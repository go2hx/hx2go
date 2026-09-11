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

	static function isHaxeCallStackFrame(f:String):Bool {
		return f == "runtime.Callers"
			|| f.indexOf("haxe_nativestacktrace") != -1
			|| f.indexOf("haxe__callstack") != -1
			|| isConstructorFrame(f);
	}

	static function isConstructorFrame(f:String):Bool {
		return StringTools.endsWith(f, ".Hx_New")
			|| f.indexOf("_CreateEmptyInstance") != -1
			|| f.indexOf("_CreateInstance") != -1
			|| f.indexOf("haxe_exception_thrown") != -1
			|| f.indexOf("haxe_exception_caught") != -1;
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
		fn = stripClosureSuffix(fn);
		var dot = fn.lastIndexOf(".");
		if (dot <= 0) {
			return Method(null, fn);
		}
		return Method(fn.substr(0, dot), fn.substr(dot + 1));
	}

	// strip trailing funcN
	static function stripClosureSuffix(fn: String): String {
		while (true) {
			var dot = fn.lastIndexOf(".");
			if (dot <= 0) {
				return fn;
			}
			var seg = fn.substr(dot + 1);
			if (isClosureSegment(seg)) {
				fn = fn.substr(0, dot);
			} else {
				return fn;
			}
		}
	}

	static function isClosureSegment(seg: String): Bool {
		var body = StringTools.startsWith(seg, "func") ? seg.substr(4) : seg;
		if (body.length == 0) {
			return false;
		}
		for (i in 0...body.length) {
			var c = body.charCodeAt(i);
			if (c < "0".code || c > "9".code) {
				return false;
			}
		}
		return true;
	}
}
