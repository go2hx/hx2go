package hx2go.hxb;

/**
	Error raised by `hxb` when a file is malformed, uses an unsupported version,
	or is otherwise not valid HXB. Mirrors the compiler's `HxbFailure`.
**/
class HxbError extends haxe.Exception {
	public function new(message:String, ?previous:haxe.Exception) {
		super(message, previous);
	}
}
