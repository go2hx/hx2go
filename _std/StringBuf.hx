
/**
	A String buffer is an efficient way to build a big string by appending small
	elements together.

	Unlike String, an instance of StringBuf is not immutable in the sense that
	it can be passed as argument to functions which modify it by appending more
	values.
**/
class StringBuf {
    var b : go.strings.Builder;

	/**
		The length of `this` StringBuf in characters.
	**/
	public var length(get, never):Int;

	/**
		Creates a new StringBuf instance.

		This may involve initialization of the internal buffer.
	**/
	public inline function new() {
		b = go.Syntax.code("HxDefault[strings.Builder]()",[]); // Haxe needs explicit default initialization for go.strings.Builder
	}

	inline function get_length():Int {
		return b.len();
	}

	/**
		Appends the representation of `x` to `this` StringBuf.

		The exact representation of `x` may vary per platform. To get more
		consistent behavior, this function should be called with
		Std.string(x).

		If `x` is null, the String "null" is appended.
	**/
	public inline function add<T>(x:T):Void {
		b.write(Std.string(x));
	}

	/**
		Appends the character identified by `c` to `this` StringBuf.

		If `c` is negative or has another invalid value, the result is
		unspecified.
	**/
	public inline function addChar(c:Int):Void {
		b.write(String.fromCharCode(c));
	}

	/**
		Appends a substring of `s` to `this` StringBuf.

		This function expects `pos` and `len` to describe a valid substring of
		`s`, or else the result is unspecified. To get more robust behavior,
		`this.add(s.substr(pos,len))` can be used instead.

		If `s` or `pos` are null, the result is unspecified.

		If `len` is omitted or null, the substring ranges from `pos` to the end
		of `s`.
	**/
	public inline function addSub(s:String, pos:Int, ?len:Int):Void {
		b.write(len == null ? s.substr(pos) : s.substr(pos, len));
	}

	/**
		Removes all characters from `this` StringBuf, making it possible to reuse it.
	**/
	public inline function clear():Void {
		b.reset();
	}

	/**
		Returns the content of `this` StringBuf as String.

		The buffer is not emptied by this operation.
	**/
	public inline function toString():String {
		return b.string();
	}
}