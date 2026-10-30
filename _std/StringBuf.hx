
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
	public function new() {
		b = go.Syntax.code("HxDefault[strings.Builder]()",[]); // Haxe needs explicit default initialisation for go.strings.Builder
	}

	function get_length():Int {
		// length in runes, not bytes
        return go.unicode.Utf8.runeCountInString(b.string());
	}

	/**
		Appends the representation of `x` to `this` StringBuf.

		The exact representation of `x` may vary per platform. To get more
		consistent behavior, this function should be called with
		Std.string(x).

		If `x` is null, the String "null" is appended.
	**/
	 @:analyzer(no_const_propagation) public function add<T>(x:T):Void {
        var s = "";
        var ok = false;
        go.Syntax.code('{0} , {1} = {2}.(string)',  s , ok , x );
        if (ok) {
            b.writeString(s).sure(); // fast path if conversion to string not needed
        }else{
			var sl:go.Slice<go.Byte> = null;
	        go.Syntax.code('{0} , {1} = {2}.([]byte)',  sl , ok , x );
			if (ok) {
				b.write(sl).sure(); // fast path if conversion from []byte succeeded
			} else {
				b.writeString(Std.string(x)).sure();
			}
        }
	}

	/**
		Appends the character identified by `c` to `this` StringBuf.

		If `c` is negative or has another invalid value, the result is
		unspecified.
	**/
	public function addChar(c:Int):Void {
		b.writeRune((c : go.Rune)).sure();
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
	public function addSub(s:String, pos:Int, ?len:Int):Void {
		b.writeString(len == null ? s.substr(pos) : s.substr(pos, len)).sure();
	}

	/**
		Removes all characters from `this` StringBuf, making it possible to reuse it.
	**/
	public function clear():Void {
		b.reset();
	}

	/**
		Returns the content of `this` StringBuf as String.

		The buffer is not emptied by this operation.
	**/
	public function toString():String {
		return b.string();
	}
}