package go.haxe;

import go.Reflect;
import go.Strings;
import go.reflect.Value;
import go.reflect.Kind;
import go.reflect.Type;
import go.Syntax;
import go.Fmt;

// HxDynamic implements Dynamic runtime manipulation required by Haxe
// using go.reflect.Reflect and naming from http://haxedev.wikidot.com/article:operator-overloading
// It is intended to be as permissive as possible, returning null or zero values
// when operations are invalid, rather than panicking.
// However it does put out warning messages that could be converted to Haxe throw statements.
// All functions return String, Int, Float, Bool or null inside a Dynamic
//
// TODO tests
@:keep
@:analyzer(ignore)
class HxDynamic {

    public static var Null: Value = Reflect.valueOf(null);

    //
    // unary operations
    //
    public static function not(d:Dynamic):Bool {
        var dV = ensureConcreteValue(d);
        if (dV.kind() == Reflect.Bool) {
            var dB:Bool = dV.bool();
            return !dB;
        }

        throw "runtime.HxDynamic.not value invalid: " + Std.string(d);
    }

    public static function increment(d:Dynamic):Dynamic {
        var dV = ensureConcreteValue(d);
        if (dV.canInt() || dV.canUint()) {
            return (valueToInt(dV) + 1 : Dynamic);
        } else if (dV.canFloat()) {
            return (valueToFloat(dV) + 1.0 : Dynamic);
        }

        throw "runtime.HxDynamic.increment value invalid: " + Std.string(d);
    }

    public static function decrement(d:Dynamic):Dynamic {
        var dV = ensureConcreteValue(d);
        if (dV.canInt() || dV.canUint()) {
            return (valueToInt(dV) - 1 : Dynamic);
        } else if (dV.canFloat()) {
            return (valueToFloat(dV) - 1.0 : Dynamic);
        }

        throw "runtime.HxDynamic.decrement value invalid: " + Std.string(d);
    }

    public static function negate(d:Dynamic):Dynamic {
        var dV = ensureConcreteValue(d);
        if (dV.canInt() || dV.canUint()) {
            return (0 - valueToInt(dV) : Dynamic);
        } else if (dV.canFloat()) {
            return (0.0 - valueToFloat(dV) : Dynamic);
        }

        throw "runtime.HxDynamic.negate value invalid: " + Std.string(d);
    }

    public static function bitnot(d:Dynamic):Dynamic {
        var dV = ensureConcreteValue(d);
        if (dV.canInt() || dV.canUint()) {
            return (~valueToInt(dV) : Dynamic);
        }

        throw "runtime.HxDynamic.bitnot value invalid: " + Std.string(d);
    }

    //
    // binary operations
    //

    public static function and(a:Dynamic, b:Dynamic):Bool {
        var aV = ensureConcreteValue(a);
        var bV = ensureConcreteValue(b);
        if (aV.kind() == Reflect.Bool && bV.kind() == Reflect.Bool)
            return aV.bool() && bV.bool();
        else
            throw "runtime.HxDynamic.and invalid operands: " + aV.string() + " and " + bV.string();
    }

    public static function or(a:Dynamic, b:Dynamic):Bool {
        var aV = ensureConcreteValue(a);
        var bV = ensureConcreteValue(b);
        if (aV.kind() == Reflect.Bool && bV.kind() == Reflect.Bool)
            return aV.bool() || bV.bool();
        else
            throw "runtime.HxDynamic.or invalid operands: " + aV.string() + " and " + bV.string();
    }

    // interal function for assessing what kind of operation to perform on comperable values
    static function jointKind(aV:Value, bV:Value):Kind {
        var avCi = aV.canInt() || aV.canUint();
        var bvCi = bV.canInt() || bV.canUint();
        if (avCi && bvCi)
            return Reflect.Int;
        else if ((aV.canFloat() || avCi) && (bV.canFloat() || bvCi))
            return Reflect.Float64;
        else if (aV.kind() == Reflect.String || bV.kind() == Reflect.String)
            return Reflect.String;

        return Reflect.Invalid;
    }

    public static function toAnySlice(v: Dynamic): Slice<Dynamic> {
        var len: Int = getArrayLength(v);
        var slice: Slice<Dynamic> = new Slice();

        for (i in 0...len) {
            slice = slice.append(ensureInterface(getArrayIndex(v, i)));
        }

        return slice;
    }

    public static function formatField(name: String): String {
        if (name.length == 0) {
            return name;
        }

        return 'Hx_Field_$name';
    }

    public static function isNull(x: Dynamic): Bool {
        return Syntax.code("{0} == nil", x); // this doesn't work: ensureConcreteValue(x).isNil();
    }

    public static function equals(a:Dynamic, b:Dynamic):Bool {
        // null == special case
        var aV = ensureConcreteValue(a);
        var bV = ensureConcreteValue(b);
        var aN = !aV.isValid();
        var bN = !bV.isValid();

        if (aN || bN) {
            if (aN && bN)
                return true;
            else
                return false; // null only ever equals null
        }

        var aK = aV.kind();
        var bK = bV.kind();

        // Bool == special case
        // Note: not promoting bool to int
        if (aK == Reflect.Bool || bK == Reflect.Bool) {
            if (aK == Reflect.Bool && bK == Reflect.Bool) {
                return aV.bool() == bV.bool();
            } else {
                return false; // bool only equal other bool
            }
        }

        var k = jointKind(aV, bV);
        if (k == Reflect.Int)
            return valueToInt(aV) == valueToInt(bV);
        else if (k == Reflect.Float64)
            return valueToFloat(aV) == valueToFloat(bV);
        else if (k == Reflect.String)
            return toString(a) == toString(b);
        else
            return Syntax.code("reflect.DeepEqual({0}, {1})", aV._interface(), bV._interface());
    }

    public static function nequals(a:Dynamic, b:Dynamic):Bool {
        return !equals(a, b);
    }

    public static function lt(a:Dynamic, b:Dynamic):Bool {
        var aV = ensureConcreteValue(a);
        var bV = ensureConcreteValue(b);
        var k = jointKind(aV, bV);
        if (k == Reflect.Int)
            return valueToInt(aV) < valueToInt(bV);
        else if (k == Reflect.Float64)
            return valueToFloat(aV) < valueToFloat(bV);
        else if (k == Reflect.String)
            return toString(a) < toString(b);
        else
            throw "runtime.HxDynamic.lt invalid operands: " + aV.string() + " and " + bV.string();
    }

    public static function gtequals(a:Dynamic, b:Dynamic):Bool {
        return !lt(a, b);
    }

    public static function gt(a:Dynamic, b:Dynamic):Bool {
        var aV = ensureConcreteValue(a);
        var bV = ensureConcreteValue(b);
        var k = jointKind(aV, bV);
        if (k == Reflect.Int)
            return valueToInt(aV) > valueToInt(bV);
        else if (k == Reflect.Float64)
            return valueToFloat(aV) > valueToFloat(bV);
        else if (k == Reflect.String)
            return toString(a) > toString(b);
        else
            throw "runtime.HxDynamic.gt invalid operands: " + aV.string() + " and " + bV.string();
    }

    public static function ltequals(a:Dynamic, b:Dynamic):Bool {
        return !gt(a, b);
    }

    public static function add(a:Dynamic, b:Dynamic):Dynamic {
        var aV = ensureConcreteValue(a);
        var bV = ensureConcreteValue(b);
        var k = jointKind(aV, bV);
        if (k == Reflect.Int)
            return (valueToInt(aV) + valueToInt(bV) : Dynamic);
        else if (k == Reflect.Float64)
            return (valueToFloat(aV) + valueToFloat(bV) : Dynamic);
        else if (k == Reflect.String)
            return (toString(a) + toString(b):Dynamic);
        else
            throw "runtime.HxDynamic.add invalid operands: " + aV.string() + " and " + bV.string();
    }

    public static function subtract(a:Dynamic, b:Dynamic):Dynamic {
        var aV = ensureConcreteValue(a);
        var bV = ensureConcreteValue(b);
        var k = jointKind(aV, bV);
        if (k == Reflect.Int)
            return (valueToInt(aV) - valueToInt(bV) : Dynamic);
        else if (k == Reflect.Float64)
            return (valueToFloat(aV) - valueToFloat(bV) : Dynamic);
        else
            throw "runtime.HxDynamic.subtract invalid operands: " + aV.string() + " and " + bV.string();
    }

    public static function multiply(a:Dynamic, b:Dynamic):Dynamic {
        var aV = ensureConcreteValue(a);
        var bV = ensureConcreteValue(b);
        var k = jointKind(aV, bV);
        if (k == Reflect.Int)
            return (valueToInt(aV) * valueToInt(bV) : Dynamic);
        else if (k == Reflect.Float64)
            return (valueToFloat(aV) * valueToFloat(bV) : Dynamic);
        else
            throw "runtime.HxDynamic.multiply invalid operands: " + aV.string() + " and " + bV.string();
    }

    public static function divide(a:Dynamic, b:Dynamic):Dynamic {
        var aV = ensureConcreteValue(a);
        var bV = ensureConcreteValue(b);
        var k = jointKind(aV, bV);
        // In Haxe, the standard division operator (/) always produces a Float result, even if both operands are integers.
        if (k == Reflect.Int || k == Reflect.Float64)
            return (valueToFloat(aV) / valueToFloat(bV) : Dynamic);
        else
            throw "runtime.HxDynamic.divide invalid operands: " + aV.string() + " and " + bV.string();
    }

    public static function modulo(a:Dynamic, b:Dynamic):Dynamic {
        var aV = ensureConcreteValue(a);
        var bV = ensureConcreteValue(b);
        var k = jointKind(aV, bV);
        // In Haxe, Float does not support modulo
        if (k == Reflect.Int)
            return (valueToInt(aV) % valueToInt(bV) : Dynamic);
        else
            throw "runtime.HxDynamic.modulo invalid operands: " + aV.string() + " and " + bV.string();
    }

    public static function bitand(a:Dynamic, b:Dynamic):Dynamic {
        var aV = ensureConcreteValue(a);
        var bV = ensureConcreteValue(b);
        var k = jointKind(aV, bV);
        if (k == Reflect.Int)
            return (valueToInt(aV) & valueToInt(bV) : Dynamic);
        else
            throw "runtime.HxDynamic.bitand invalid operands: " + aV.string() + " and " + bV.string();
    }

    public static function bitor(a:Dynamic, b:Dynamic):Dynamic {
        var aV = ensureConcreteValue(a);
        var bV = ensureConcreteValue(b);
        var k = jointKind(aV, bV);
        if (k == Reflect.Int)
            return (valueToInt(aV) | valueToInt(bV) : Dynamic);
        else
            throw "runtime.HxDynamic.bitor invalid operands: " + aV.string() + " and " + bV.string();
    }

    public static function bitxor(a:Dynamic, b:Dynamic):Dynamic {
        var aV = ensureConcreteValue(a);
        var bV = ensureConcreteValue(b);
        var k = jointKind(aV, bV);
        if (k == Reflect.Int)
            return (valueToInt(aV) ^ valueToInt(bV) : Dynamic);
        else
            throw "runtime.HxDynamic.bitxor invalid operands: " + aV.string() + " and " + bV.string();
    }

    public static function lbitshift(a:Dynamic, b:Dynamic):Dynamic {
        var aV = ensureConcreteValue(a);
        var bV = ensureConcreteValue(b);
        var k = jointKind(aV, bV);
        if (k == Reflect.Int)
            return (valueToInt(aV) << valueToInt(bV) : Dynamic);
        else
            throw "runtime.HxDynamic.lbitshift invalid operands: " + aV.string() + " and " + bV.string();
    }

    public static function rbitshift(a:Dynamic, b:Dynamic):Dynamic {
        var aV = ensureConcreteValue(a);
        var bV = ensureConcreteValue(b);
        var k = jointKind(aV, bV);
        if (k == Reflect.Int)
            return (valueToInt(aV) >> valueToInt(bV) : Dynamic);
        else
            throw "runtime.HxDynamic.rbitshift invalid operands: " + aV.string() + " and " + bV.string();
    }

    public static function urbitshift(a:Dynamic, b:Dynamic):Dynamic {
        var aV = ensureConcreteValue(a);
        var bV = ensureConcreteValue(b);
        var k = jointKind(aV, bV);
        if (k == Reflect.Int)
            return (valueToInt(aV) >>> valueToInt(bV) : Dynamic);
        else
            throw "runtime.HxDynamic.urbitshift invalid operands: " + aV.string() + " and " + bV.string();
    }

    //
    // conversion functions, following Haxe Dynamic conventions
    //

    public static function toString(d:Dynamic):String {
        // var dV = ensureConcreteValue(d);
        // if (dV.kind() == Reflect.String) {
        // 	return dV.string(); // gives a string showing the type of the value, not a representation of the value
        // }
        return Std.string(d);
    }

    public static function toBool(d:Dynamic):Bool {
        var dV = ensureConcreteValue(d);
        if (dV.kind() == Reflect.Bool) {
            return dV.bool();
        }
        return valueToInt(dV) != 0;
    }

    // internal function to convert Value to Int
    static function valueToInt(dV:Value):Int {
        // NOTE not converting bool to int
        // if (dV.kind() == Reflect.Bool) {
        //  return if (dV.bool()) 1 else 0;
        // } else
        if (dV.canUint()) {
            return (dV.uint() : Int);
        } else if (dV.canInt()) {
            return (dV.int() : Int);
        } else if (dV.canFloat()) {
            return Std.int(go.Math.floor(dV.float()));
        }

        return 0;
    }

    static function isClass(v: Value): Bool {
        var kind = v.kind();
        if (kind == Reflect.Ptr || kind == Reflect.Interface) {
            return isClass(v.elem());
        }

        if (kind != Reflect.Struct) {
            return false;
        }

        return v.fieldByName("VTable").isValid();
    }

    static function convertToType(v: Value, t: Type): Value {
        var cv = ensureConcreteValue(v._interface());
        var k = t.kind();

        if (k == Reflect.Int) return Reflect.valueOf(valueToInt(cv));
        if (k == Reflect.Float64) return Reflect.valueOf(valueToFloat(cv));
        if (k == Reflect.String) return Reflect.valueOf(toString(cv._interface()));
        if (k == Reflect.Bool) return Reflect.valueOf(toBool(cv));

        return cv;
    }

    public static function call(fn: Dynamic, args: Array<Dynamic>): Dynamic {
        var fV = ensureConcreteValue(fn);
        if (isNull(fn) || !fV.isValid()) {
            throw "runtime.HxDynamic.call null function value";
        }

        if (fV.kind() != Reflect.Func) {
            throw "runtime.HxDynamic.call value not callable: " + Std.string(fn);
        }

        var fType = fV.type();
        var numIn = fType.numIn();
        var isVariadic = fType.isVariadic();
        var argVals: Array<Value> = [];

        for (i in 0...numIn) {
            if (isVariadic && i == numIn - 1) break;
            var pt = fType._in(i);
            var av = i < args.length ? args[i] : null;
            argVals.push(convertToType(ensureValue(av), pt));
        }

        var results = fV.call(argVals);
        if (results.length == 0) {
            return null;
        }

        return ensureInterface(results[0]);
    }

    public static function toInt(d:Dynamic):Int {
        var dV = ensureConcreteValue(d);
        return valueToInt(dV);
    }

    // internal function to convert Value to Float
    static function valueToFloat(dV:Value):Float {
        // NOTE not converting bool to int
        // if (dV.kind() == Reflect.Bool) {
        //  return if (dV.bool()) 1.0 else 0.0;
        // } else
        if (dV.canUint()) {
            return (dV.uint() : Float);
        } else if (dV.canInt()) {
            return (dV.int() : Float);
        } else if (dV.canFloat()) {
            return (dV.float() : Float);
        }
        return 0.0;
    }

    public static function toFloat(d:Dynamic):Float {
        var dV = ensureConcreteValue(d);
        return valueToFloat(dV);
    }

    static function valueToClass(value: Value, className: String): Value {
        var kind = value.kind();

        if (kind == Reflect.Ptr || kind == Reflect.Interface) {
            if (value.isNil()) {
                return value;
            }
            return valueToClass(value.elem(), className);
        }

        if (kind == Reflect.Struct && value.type().name() != className) {
            var f = value.fieldByName(className);
            if (f.isValid()) {
                return valueToClass(f, className);
            }
            // Null<T> is struct{Value T; Valid bool}
            // cast the boxed value.
            var boxed = value.fieldByName("Value");
            if (boxed.isValid()) {
                return valueToClass(boxed, className);
            }
        }

        return value;
    }

    public static function toClass(d: Dynamic, className: String): Dynamic {
        if (isNull(d)) {
            return null;
        }

        var cls = valueToClass(ensureValue(d), className);
        if (!cls.isValid()) {
            return null;
        }

        // already the class reference.
        if (cls.kind() == Reflect.Ptr) {
            return cls._interface();
        }

        // return a pointer to the value
        if (!cls.canAddr()) {
            var boxed = Reflect._new(cls.type());
            boxed.elem().set(cls);
            return boxed._interface();
        }

        return cls.addr()._interface();
    }

    // read field access on dynamic (class, anon, etc)
    public static function getField(dyn: Dynamic, fieldName: String): Dynamic {
        var value = ensureValue(dyn);
        var kind = value.kind();
        var found = false;

        if (isNull(dyn) || !value.isValid()) {
            throw "runtime.HxDynamic.field null field access: " + fieldName;
        }

        if (kind == Reflect.Ptr || kind == Reflect.Interface) {
            return getField(value.elem(), fieldName);
        }

        if (kind == Reflect.Struct) {
            var f = value.fieldByName(formatField(fieldName));
            if (f.isValid()) {
                found = true;
            } else {
                var vtable = value.fieldByName("VTable");
                if (vtable.isValid()) {
                    f = vtable.methodByName(formatField(fieldName));
                    found = true;
                } else {
                    var m = value.methodByName(formatField(fieldName));
                    if (m.isValid()) {
                        f = m;
                        found = true;
                    }
                }
            }
            value = f;
        }

        if (kind == Reflect.Map) {
            var mi = value.mapIndex(
                ensureValue(fieldName)
            );

            if (mi.isValid()) {
                found = true;
                value = mi;
            }
        }

        if (kind == Reflect.Array || kind == Reflect.Slice) {
            if (fieldName == "length") {
                value = ensureValue(getArrayLength(dyn));
                found = true;
            }
        }

        if (kind == Reflect.String) {
            if (fieldName == "length") {
                value = ensureValue(toString(dyn).length);
                found = true;
            }
        }

        if (!found) {
            return null;
        }

        return value.canInterface() ? value._interface() : null;
    }

    // write field access on dynamic (class, anon, etc)
    public static function setField(dyn: Dynamic, fieldName: String, v: Dynamic): Dynamic {
        var value = ensureValue(dyn);
        var kind = value.kind();

        if (kind == Reflect.Interface) {
            return setField(value.elem(), fieldName, v);
        }

        if (kind == Reflect.Ptr) {
            value = value.elem();
            kind = value.kind();
        }

        if (kind == Reflect.Struct) {
            var field = value.fieldByName(formatField(fieldName));
            if (!field.isValid()) {
                throw 'runtime.HxDynamic.setField field "$fieldName" not present on "$value"';
            }

            if (!field.canSet()) {
                throw 'runtime.HxDynamic.setField cannot set "$fieldName" on "$value"';
            }

            field.set(
                valueToAssign(v, field.type())
            );
        }

        if (kind == Reflect.Map) {
            var fn = ensureValue(fieldName);
            value.setMapIndex(fn, valueToAssign(v, value.type().elem()));
        }

        return v;
        // TODO: throw when Null<T> is supported.
    }

    public static function setArrayIndex(dyn: Dynamic, index: Int, v: Dynamic): Void {
        var value = ensureValue(dyn);
        var kind = value.kind();

        if (isNull(dyn) || !value.isValid()) {
            throw "runtime.HxDynamic.setArrayIndex null array access";
        }

        if (kind == Reflect.Interface) {
            value = value.elem();
            kind = value.kind();
        }

        if (kind == Reflect.Ptr) {
            value = value.elem();
            kind = value.kind();
        }

        if (kind == Reflect.Slice || kind == Reflect.Array) {
            var length = value.len();
            if (index >= length) {
                if (kind == Reflect.Array) {
                    throw "runtime.HxDynamic.setArrayIndex out of bounds exception, cannot grow go array";
                }

                value.grow(index - length + 1);
                value.setLen(index + 1);
            }

            var item = value.index(index);
            item.set(
                valueToAssign(v, item.type())
            );
        }

        // TODO: throw when Null<T> is supported.
    }

    public static function getArrayIndex(dyn: Dynamic, index: Int): Dynamic {
        var value = ensureValue(dyn);
        var kind = value.kind();

        if (isNull(dyn) || !value.isValid()) {
            throw "runtime.HxDynamic.getArrayIndex null array access";
        }

        if (kind == Reflect.Ptr || kind == Reflect.Interface) {
            return getArrayIndex(value.elem(), index);
        }

        if (kind == Reflect.Slice || kind == Reflect.Array) {
            var length = value.len();
            if (index >= length) {
                return null;
            }

            return value.index(index)._interface();
        }

        // TODO: throw when Null<T> is supported.

        return value._interface();
    }

    public static function getArrayLength(dyn: Dynamic): Int {
        var value = ensureValue(dyn);
        var kind = value.kind();

        if (isNull(value) || !value.isValid()) {
            return 0;
        }

        if (kind == Reflect.Ptr || kind == Reflect.Interface) {
            return getArrayLength(value.elem());
        }

        if (kind == Reflect.Slice || kind == Reflect.Array) {
            return value.len();
        }

        throw "runtime.HxDynamic.getArrayLength invalid type";
    }

    // given the type of dyn, if it is reflect.Value we return that, otherwise we use reflect.valueOf
    public static function ensureValue(dyn: Dynamic): Value {
        var ok: Bool = false;
        var value: Value = Null;
        Syntax.code("{0}, {1} = {2}.(reflect.Value)", value, ok, dyn);

        if (!ok) {
            return Reflect.valueOf(dyn);
        }

        return value;
    }

    // Produce the reflect.Value to assign into a settable target of type `t`.
    // Haxe `null` maps to the zero value of `t` (e.g. a nil interface for []any),
    // because ensureValue(null) yields an invalid reflect.Value that Set() rejects
    // with "call of reflect.Value.Set on zero Value".
    public static function valueToAssign(v: Dynamic, t: Type): Value {
        if (isNull(v)) {
            return Reflect.zero(t);
        }
        return ensureValue(v);
    }

    // same as ensureValue, but recursively unpacks interface{}
    // in cases like operations (add, sub, etc) we need to work with the underlying type.
    // as dynamic field access always returns interface{}, we need to fetch the underlying value.
    // for field access (w/ ensureValue) we don't want to get the underlying value as that may destroy setability.
    public static function ensureConcreteValue(dyn: Dynamic): Value {
        var v = ensureValue(dyn);
        var k = v.kind();

        while (k == Reflect.Interface) {
            v = v.elem();
            k = v.kind();
        }

        return v;
    }

    public static function ensureInterface(dyn: Dynamic): Dynamic {
        var ok: Bool = false;
        var value: Value = Null;
        Syntax.code("{0}, {1} = {2}.(reflect.Value)", value, ok, dyn);

        if (!ok) {
            return dyn;
        }

        if (!value.canInterface()) {
            throw "runtime.HxDynamic.ensureInterface cannot convert to iface";
        }

        return value._interface();
    }
}