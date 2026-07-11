package haxe;

extern class NativeStackTrace {
	public static inline extern function saveStack(exception: Any): Void {}
	public static inline extern function callStack(): Array<Any> { err(); return []; }
	public static inline extern function exceptionStack(): Array<Any> { err(); return []; }
	public static inline extern function toHaxe(nativeStackTrace: Array<Any>, skip: Int = 0): Array<haxe.CallStack.StackItem> { err(); return []; }

	static inline extern function err() Sys.println("not implemented");
}