/*
 * Copyright (C)2005-2019 Haxe Foundation
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 */

import go.Syntax;
import Reflect as HxReflect;
import go.Reflect;
import go.reflect.Kind;
import go.haxe.HxDynamic;
import go.Slice;
import go.haxe.HxEnumValue;
import go.haxe.HxEnum;
import go.haxe.HxClass;

enum ValueType {
	TNull;
	TInt;
	TInt64;
	TFloat;
	TBool;
	TObject;
	TFunction;
	TClass(c:Class<Dynamic>);
	TEnum(e:Enum<Dynamic>);
	TUnknown;
}

@:coreApi
class Type {

	public static function getClass<T>(o:T):Null<Class<T>> {
		return switch typeof(o) {
			case TClass(o):
				return cast o;
			default:
				null;
		}
	}

	public static function getEnum(o:EnumValue):Null<Enum<Dynamic>> {
		return switch typeof(o) {
			case TEnum(o):
				return cast o;
			default:
				null;
		}
	}

	public static function getSuperClass(c:Class<Dynamic>):Null<Class<Dynamic>> {
		return untyped c.superClass;
	}

	public static function getClassName(c:Class<Dynamic>):String {
		return untyped c.name;
	}

	public static function getEnumName(e:Enum<Dynamic>):String {
		return untyped e.name;
	}

	public static function resolveClass(name:String):Null<Class<Dynamic>> {
		return cast untyped HxClass.getClass(name);
	}

	public static function resolveEnum(name:String):Null<Enum<Dynamic>> {
		return cast untyped HxEnum.getEnum(name);
	}

	public static function createInstance<T>(cl:Class<T>, args:Array<Dynamic>):T {
		return untyped cl.createInstance(args);
	}

	public static function createEmptyInstance<T>(cl:Class<T>):T {
		return untyped cl.createEmptyInstance();
	}

	public static function createEnum<T>(e:Enum<T>, constr:String, ?params:Array<Dynamic>):T {
		var e: HxEnum = cast e;
		var i = e.constructorNames.indexOf(constr);
		if (i < 0) {
			throw "Unknown constructor " + constr + " for enum " + e.name;
		}

		return cast e.createByIndex(i, params);
	}

	public static function createEnumIndex<T>(e:Enum<T>, index:Int, ?params:Array<Dynamic>):T {
		var e: HxEnum = cast e;
		return cast e.createByIndex(index, params);
	}

	public static function getInstanceFields(c:Class<Dynamic>):Array<String> {
        return (untyped c.instanceFields : Array<String>).copy();
	}

	public static function getClassFields(c:Class<Dynamic>):Array<String> {
		return (untyped c.staticFields : Array<String>).copy();
	}

	public static function getEnumConstructs(e:Enum<Dynamic>):Array<String> {
		return (untyped c.constructorName : Array<String>).copy();
	}

	public static function typeof(v:Dynamic):ValueType {
		if (v == null) {
			return ValueType.TNull;
		}

		var value = HxDynamic.unwrapNullable(HxDynamic.ensureValue(v));
		if (!value.isValid()) {
			return ValueType.TNull;
		}

		var kind = value.kind();

		if (kind == Reflect.Int32) {
			return ValueType.TInt;
		} else if (kind == Reflect.Int64) {
			return ValueType.TInt64;
		} else if (kind == Reflect.Float64) {
			return ValueType.TFloat;
		} else if (kind == Reflect.Bool) {
			return ValueType.TBool;
		} else if (kind == Reflect.String) {
			 return ValueType.TClass(String);
		} else if (kind == Reflect.Slice) {
			// return ValueType.TClass(Slice);
			return ValueType.TObject; // TODO: wait until externs generate RTTI
		} else if (kind == Reflect.Func) {
			return ValueType.TFunction;
		}

		if (kind == Reflect.Ptr || kind == Reflect.Interface) {
			if (value.isNil()) {
				return ValueType.TNull;
			}

			value = value.elem();
			kind = value.kind();
		}

		if (kind == Reflect.Struct) {
			if (HxReflect.isEnumValue(v)) {
				return ValueType.TEnum(( cast v : Enum<Dynamic> ));
			}

			var vtable = value.fieldByName("VTable");
			var typeName = value.type().name();
			if (!vtable.isValid() || typeName == "Hx_Obj_go_haxe_hxclass" || typeName == "Hx_Obj_go_haxe_hxenum") {
				return ValueType.TObject;
			}

			return ValueType.TClass(( v : Class<Dynamic> ));
		}

		if (kind == Reflect.Map) {
			return ValueType.TObject;
		}

		if (kind == Reflect.Slice) { // was a pointer to a map, so its an array
			return ValueType.TClass(Array);
		}

		return ValueType.TUnknown;
	}

	public static function enumEq<T:EnumValue>(a:T, b:T):Bool {
		if (a == b) {
			return true;
		}

		var aidx = Type.enumIndex(a);
		var bidx = Type.enumIndex(b);
		if (aidx != bidx) {
			return false;
		}

		var aprm = Type.enumParameters(a);
		var bprm = Type.enumParameters(b);
		if (aprm.length != bprm.length) {
			return false;
		}

		for (idx in 0...aprm.length) {
			var ap = aprm[idx];
			var bp = bprm[idx];

			if (ap != bp) {
				return false; // TODO: review, some stuff may not be comparable, perhaps we need to use https://go.dev/src/reflect/deepequal.go
			}
		}

		return true;
	}

	public static function enumConstructor(e:EnumValue):String {
		var t: HxEnum = untyped e.enumType();
		return t.constructorNames[Type.enumIndex(e)];
	}

	public static function enumParameters(e:EnumValue):Array<Dynamic> {
		return untyped e.enumParams();
	}

	public static function enumIndex(e:EnumValue):Int {
		return untyped e.enumIndex();
	}

	public static function allEnums<T>(e:Enum<T>):Array<T> {
		var t: HxEnum = cast (e : Enum<Dynamic>);
		var r: Array<T> = [];

		for (i in 0...t.constructorNames.length) {
			if (t.constructorArgCounts[i] != 0) {
				continue;
			}

			r.push(cast t.createByIndex(i, []));
		}

		return r;
	}

}
