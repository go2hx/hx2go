package go.haxe;

class HxArray {

    public static inline extern function fastGet<T>(arr: Array<T>, index: Int): T {
        return Syntax.code("{0}.FastGet({1})", (cast arr : Array<T>), (cast index : Int));
    }

    public static inline extern function fastSet<T>(arr: Array<T>, index: Int, value: T): Void {
        Syntax.code("{0}.FastSet({1}, {2})", (cast arr : Array<T>), (cast index : Int), (cast value: T));
    }

    public static inline extern function elemType<T>(arr: Array<T>): go.reflect.Type {
        return Syntax.code("{0}.ElemType()", (cast arr : Array<T>));
    }

}
