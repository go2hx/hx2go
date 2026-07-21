package haxe;

private typedef NativeTrace = Any;

/**
	Do not use manually.
**/
@:dox(hide)
@:noCompletion
extern class NativeStackTrace {
	public static inline extern function saveStack(exception: Any): Void {}
	public static inline extern function callStack(): NativeTrace return ([] : Array<Dynamic>);
	public static inline extern function exceptionStack(): NativeTrace return ([] : Array<Dynamic>);
	public static inline extern function toHaxe(nativeStackTrace: NativeTrace, skip: Int = 0): Array<haxe.CallStack.StackItem> return [];
}
