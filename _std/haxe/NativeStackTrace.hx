package haxe;

import go.Runtime;
import go.Slice;
import go.UIntPtr;
import haxe.CallStack.StackItem;

private typedef NativeTrace = Array<StackItem>;

/**
	Do not use manually.
**/
@:dox(hide)
@:noCompletion
class NativeStackTrace {
	public static inline function saveStack(exception: Any): Void {}

	public static function callStack(): NativeTrace {
		return capture();
	}

	public static function exceptionStack(): NativeTrace {
		return capture();
	}

	public static function toHaxe(nativeStackTrace: NativeTrace, skip: Int = 0): Array<StackItem> {
		if (nativeStackTrace == null) {
			return [];
		}
		if (skip > 0) {
			return nativeStackTrace.slice(skip);
		}
		return nativeStackTrace;
	}

	static function isHaxeCallStackFrame(fn: String): Bool {
		return fn == "runtime.Callers"
			|| fn.indexOf("haxe_nativestacktrace") != -1
			|| fn.indexOf("haxe__callstack") != -1
			|| isConstructorFrame(fn);
	}

	static function isConstructorFrame(fn: String): Bool {
		return StringTools.endsWith(fn, ".Hx_New")
			|| fn.indexOf("_CreateInstance") != -1
			|| fn.indexOf("haxe_exception_thrown") != -1
			|| fn.indexOf("haxe_exception_caught") != -1;
	}

	static function capture(): Array<StackItem> {
		var pcs = new Slice<UIntPtr>(64);
		var n = Runtime.callers(1, pcs); // 1: skip runtime.Callers' own frame
		var items: Array<StackItem> = [];
		if (n <= 0) {
			return items;
		}
		pcs = pcs.slice(0, n);
		var frames = Runtime.callersFrames(pcs);
		var more = true;
		var strippingHaxeStackFrames = true;
		while (more) {
			var res = frames.next();
			var frame = res.frame;
			more = res.more;
			if (frame._function == "") {
				continue;
			}

			if (strippingHaxeStackFrames && isHaxeCallStackFrame(frame._function)) {
				continue;
			}
			strippingHaxeStackFrames = false;
			items.push(FilePos(createMethod(frame._function), frame.file, frame.line));
		}
		return items;
	}

	static function createMethod(fn: String): StackItem {
		var dot = fn.lastIndexOf(".");
		if (dot <= 0) {
			return Method(null, fn);
		}
		return Method(fn.substr(0, dot), fn.substr(dot + 1));
	}
}
