package haxe.runtime;

import go.Reflect;
import go.reflect.Value;
import go.Syntax;

class Copy {

    public static function copy<T>(v: T): T {
        var val: Value = Reflect.valueOf(v);
        if (!val.isValid()) {
            return v;
        }

        if ((val.kind() == Reflect.Ptr || val.kind() == Reflect.Interface) && val.isNil()) {
            return null;
        }

        var seen: Map<Int, Dynamic> = new Map();
        return cast deepCopy(val, seen).iface();
    }

    static function deepCopy(v: Value, seen: Map<Int, Dynamic>): Value {
        var k = v.kind();

        if (k == Reflect.Ptr) {
            if (v.isNil()) {
                return v;
            }

            var addr: Int = cast v.pointer();
            if (seen.exists(addr)) {
                return Reflect.valueOf(seen.get(addr));
            }

            var nv = Reflect._new(v.type().elem());
            seen.set(addr, nv.iface());

            // copy the pointer elem by kind
            var pointerElem = v.elem();
            if (pointerElem.kind() == Reflect.Struct) {
                copyStruct(pointerElem, nv.elem(), seen);
            } else {
                nv.elem().set(deepCopy(pointerElem, seen));
            }
            return nv;
        }

        if (k == Reflect.Interface) {
            if (v.isNil()) {
                return v;
            }
            return deepCopy(v.elem(), seen);
        }

        if (k == Reflect.Slice) {
            if (v.isNil()) {
                return v;
            }

            var len = v.len();
            var nv = Reflect.makeSlice(v.type(), len, len);
            for (i in 0...len) {
                nv.index(i).set(deepCopy(v.index(i), seen));
            }
            return nv;
        }

        if (k == Reflect.Map) {
            if (v.isNil()) {
                return v;
            }

            var nv = Reflect.makeMap(v.type());
            var keys = v.mapKeys();
            for (i in 0...keys.length) {
                var key = keys[i];
                nv.setMapIndex(key, deepCopy(v.mapIndex(key), seen));
            }
            return nv;
        }

        if (k == Reflect.Struct) {
            var nv = Reflect._new(v.type()).elem();
            copyStruct(v, nv, seen);
            return nv;
        }

        // pass by value
        return v;
    }

    static function copyStruct(src: Value, dst: Value, seen: Map<Int, Dynamic>): Void {
        var n = src.numField();
        for (i in 0...n) {
            var df = dst.field(i);
            if (!df.canSet()) {
                continue;
            }

            df.set(deepCopy(src.field(i), seen));
        }
    }
}
