package go.reflect;

import go.Int64;
import go.UInt64;
import go.Slice;
import go.Float64;

// TODO implement more of reflect...

@:go.Type({name: "reflect", imports: ["reflect"]})
extern class Reflect {
    /* Kind constants... */
    public static var Invalid:Kind;
    public static var Bool:Kind;
    public static var Int:Kind;
    public static var Int8:Kind;
    public static var Int16:Kind;
    public static var Int32:Kind;
    public static var Int64:Kind;
    public static var Uint:Kind;
    public static var Uint8:Kind;
    public static var Uint16:Kind;
    public static var Uint32:Kind;
    public static var Uint64:Kind;
    public static var Float32:Kind;
    public static var Float64:Kind;
    public static var Complex64:Kind;
    public static var Complex128:Kind;
    public static var Array:Kind;
    public static var Chan:Kind;
    public static var Func:Kind;
    public static var Interface:Kind;
    public static var Map:Kind;
    public static var Ptr:Kind;
    public static var Slice:Kind;
    public static var String:Kind;
    public static var Struct:Kind;
    public static var UnsafePointer:Kind;

    static function typeOf(i:Dynamic):Type;
    static function valueOf(i:Dynamic):Value;
    static function indirect(ptr:Value):Value;

}
