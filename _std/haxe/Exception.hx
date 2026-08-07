package haxe;

@:haxeStd
@:coreApi
@:valueType
class Exception {
	public var message(get, never): String;
	private function get_message(): String {
		return _message;
	}

	public var stack(get,set): CallStack;
	private function get_stack(): CallStack {
		return [];
	}

	private function set_stack(stack: CallStack): CallStack {
		return [];
	}

	public var previous(get, never): Null<Exception>;
	private function get_previous(): Null<Exception> {
		return null;
	}

	public var native(get, never): Any;
	final private function get_native(): Any {
		return _native;
	}

	static private function caught(value: Any): Exception {
		return new Exception(Std.string(value));
	}

	static private function thrown(value: Any): Exception {
		// if(Std.isOfType(value, Exception)) {
		// 	return (value:Exception).native;
		// } else {
		// 	var e = new ValueException(value);
		// 	// e.__shiftStack();
		// 	return e;
		// }
		var e = new ValueException(value);
		// e.__shiftStack();
		return e;
	}

	var _message: String;
    var _native: Any;
	// var _previous: Null<cxx.SharedPtr<Exception>>;
	// var _stack: CallStack;

	public function new(message: String, ?previous: Exception, ?native: Any): Void {

		_message = message;
		_native = native;
		// _previous = previous != null ? cxx.SharedPtr.make((previous : Exception)) : null;
		// _stack = NativeStackTrace.toHaxe(NativeStackTrace.callStack());
	}

	private function unwrap(): Any {
		return this;
	}
	
	@:keep
	static function catchValue(ex: Dynamic, goType: String): Dynamic {
		if (goType == "any") {
			return ex;
		}

		var e: Exception = ex;
		var value: Dynamic = e.unwrap();
		// remove "*" prefix
		var name = goType.substr(1);

		var hit = go.haxe.HxDynamic.toClass(value, name);
		if (hit == null) {
			hit = go.haxe.HxDynamic.toClass(e, name);
		}

		return hit != null ? hit : value;
	}

	public function toString(): String {
		return '$message';
	}

	@:go.Export
	private function error(): String {
		return toString();
	}

	public function details(): String {
		return toString() + "\n" + haxe.CallStack.toString(stack);
	}
}

// This function checks if the exception is a Go error or string and converts it to a haxe.Exception if necessary.

@:analyzer(no_user_var_fusion)
@:analyzer(no_const_propagation)
@:keep
function checkException(e:Dynamic):Dynamic {
	// haxe.Exception exports error()
	var thrown = go.haxe.HxDynamic.toClass(e, "Hx_Obj_haxe_exception");
	if (thrown != null) {
		return thrown;
	}

	// Can't use Std.isOfType() because it doesn't work with non-Haxe types like Go's error interface
	var isGoError:Bool = false;
	var goError:go.Error = null;
	go.Syntax.code("{0}, {1} = {2}.(error)", goError, isGoError, e);
	if (isGoError) {
		// trace("checkException: Go error detected, converting to haxe.Exception");
		return (new haxe.ValueException(go.Syntax.code("{0}.Error()", goError), null, goError) : haxe.Exception);
	}

	// some Go panics may be strings, so we check for that as well but using Std.isOfType() since it is a Haxe type
	if (Std.isOfType(e, String)) {
		// trace("checkException: Go string detected, converting to haxe.Exception");
		return (new haxe.ValueException(e) : haxe.Exception);
	}

	// trace("checkException: Not a Go error or string, returning original exception");
	return e;
}