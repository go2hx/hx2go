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
		return 0;
	}

	static private function caught(value: Any): Exception {
		return new Exception(Std.string(value));
	}

	static private function thrown(value: Any): Any {
		return 0;
	}

	var _message: String;
	// var _previous: Null<cxx.SharedPtr<Exception>>;
	// var _stack: CallStack;

	public function new(message: String, ?previous: Exception, ?native: Any): Void {

		_message = message;
		// _previous = previous != null ? cxx.SharedPtr.make((previous : Exception)) : null;
		// _stack = NativeStackTrace.toHaxe(NativeStackTrace.callStack());
	}

	private function unwrap(): Any {
		return 0;
	}

	public function toString(): String {
		return 'Error: $message';
	}

	public function details(): String {
		return toString() + "\n" + haxe.CallStack.toString(stack);
	}
}
