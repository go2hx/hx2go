package go.haxe;

@:coreType
@:go.Type({ name: "HxArray[any]" })
private extern abstract DynamicArray {

    @:from public static inline function fromDynamic<T>(v: Dynamic): DynamicArray {
        return Syntax.code("HxAnyToArray({0})", v);
    }
}

@:go.Type({ topLevel: true })
extern class HxArray {

    public static inline extern function fastGet<T>(arr: Array<T>, index: Int): T {
        return Syntax.code("{0}.FastGet({1})", (cast arr : Array<T>), (cast index : Int));
    }

    public static inline extern function fastSet<T>(arr: Array<T>, index: Int, value: T): Void {
        Syntax.code("{0}.FastSet({1}, {2})", (cast arr : Array<T>), (cast index : Int), (cast value: T));
    }

    public static inline extern function elemType<T>(arr: Array<T>): go.reflect.Type {
        return Syntax.code("{0}.ElemType()", (cast arr : Array<T>));
    }

    @:native("Hx_Array_Push") static function push<T>(arr: DynamicArray, val: T): Int;
    @:native("Hx_Array_Pop") static function pop<T>(arr: DynamicArray): T;
    @:native("Hx_Array_Shift") static function shift<T>(arr: DynamicArray): T;
    @:native("Hx_Array_Unshift") static function unshift<T>(arr: DynamicArray, val: T): T;
    @:native("Hx_Array_Insert") static function insert<T>(arr: DynamicArray, pos: Int, val: T): Void;
    @:native("Hx_Array_Remove") static function remove<T>(arr: DynamicArray, val: T): Bool;
    @:native("Hx_Array_Contains") static function contains<T>(arr: DynamicArray, val: T): Bool;
    @:native("Hx_Array_IndexOf") static function indexOf<T>(arr: DynamicArray, val: T, ?fromIndex: Int): Int;
    @:native("Hx_Array_LastIndexOf") static function lastIndexOf<T>(arr: DynamicArray, val: T, ?fromIndex: Int): Int;
    @:native("Hx_Array_Concat") static function concat<T>(arr: DynamicArray, other: Array<T>): Array<T>;
    @:native("Hx_Array_Copy") static function copy<T>(arr: DynamicArray): Array<T>;
    @:native("Hx_Array_Slice") static function slice<T>(arr: DynamicArray, pos: Int, ?end: Int): Array<T>;
    @:native("Hx_Array_Splice") static function splice<T>(arr: DynamicArray, pos: Int, len: Int): Array<T>;
    @:native("Hx_Array_Reverse") static function reverse<T>(arr: DynamicArray): Void;
    @:native("Hx_Array_Sort") static function sort<T>(arr: DynamicArray, f: (T, T) -> Int): Void;
    @:native("Hx_Array_Map") static function map<T, S>(arr: DynamicArray, f: T -> S): Array<S>;
    @:native("Hx_Array_Filter") static function filter<T>(arr: DynamicArray, f: T -> Bool): Array<T>;
    @:native("Hx_Array_Resize") static function resize<T>(arr: DynamicArray, size: Int): Void;
    @:native("Hx_Array_Join") static function join<T>(arr: DynamicArray, sep: String): String;
    @:native("Hx_Array_Copy") static function copy<T>(arr: DynamicArray): Array<T>;
    @:native("Hx_Array_Shift") static function shift<T>(arr: DynamicArray): T;
    @:native("Hx_Array_Pop") static function pop<T>(arr: DynamicArray): T;
    @:native("Hx_Array_ToString") static function toString(arr: DynamicArray): String;

}
