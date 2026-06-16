package hx2go.hxb;

/**
	A source position: the file it points into and a `[min, max)` byte range,
	mirroring the compiler's `pos`.
**/
@:structInit
class Pos {
	public var file:String;
	public var min:Int;
	public var max:Int;

	public function new(file:String, min:Int, max:Int) {
		this.file = file;
		this.min = min;
		this.max = max;
	}

	public function toString():String {
		return '$file:$min-$max';
	}

	/** A throwaway position with empty file and zero range. **/
	public static inline function none():Pos {
		return new Pos("", 0, 0);
	}
}
