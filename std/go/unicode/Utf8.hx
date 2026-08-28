package go.unicode;

/**
    Package utf8 implements functions and constants to support text encoded in
    UTF-8. It includes functions to translate between runes and UTF-8 byte sequences.
    See https://en.wikipedia.org/wiki/UTF-8
**/
@:go.Type({ name: "utf8", instanceName: "utf8.utf8", imports: ["unicode/utf8"] })
extern class Utf8 {

    /**
        Numbers fundamental to the encoding.
    **/
    @:native("MaxRune") static var maxRune: go.Rune;
    /**
        Numbers fundamental to the encoding.
    **/
    @:native("RuneError") static var runeError: go.Rune;
    /**
        Numbers fundamental to the encoding.
    **/
    @:native("RuneSelf") static var runeSelf: go.GoInt;
    /**
        Numbers fundamental to the encoding.
    **/
    @:native("UTFMax") static var uTFMax: go.GoInt;

    /**
        AppendRune appends the UTF-8 encoding of r to the end of p and
        returns the extended buffer. If the rune is out of range,
        it appends the encoding of [RuneError].
    **/
    @:native("AppendRune") static function appendRune(p: go.Slice<go.Byte>, r: go.Rune): (go.Slice<go.Byte>);
    /**
        DecodeLastRune unpacks the last UTF-8 encoding in p and returns the rune and
        its width in bytes. If p is empty it returns ([RuneError], 0). Otherwise, if
        the encoding is invalid, it returns (RuneError, 1). Both are impossible
        results for correct, non-empty UTF-8.
        
        An encoding is invalid if it is incorrect UTF-8, encodes a rune that is
        out of range, or is not the shortest possible UTF-8 encoding for the
        value. No other validation is performed.
    **/
    @:go.Tuple("r", "size") @:native("DecodeLastRune") static function decodeLastRune(p: go.Slice<go.Byte>): (go.Tuple<{ r: go.Rune, size: go.GoInt }>);
    /**
        DecodeLastRuneInString is like [DecodeLastRune] but its input is a string. If
        s is empty it returns ([RuneError], 0). Otherwise, if the encoding is invalid,
        it returns (RuneError, 1). Both are impossible results for correct,
        non-empty UTF-8.
        
        An encoding is invalid if it is incorrect UTF-8, encodes a rune that is
        out of range, or is not the shortest possible UTF-8 encoding for the
        value. No other validation is performed.
    **/
    @:go.Tuple("r", "size") @:native("DecodeLastRuneInString") static function decodeLastRuneInString(s: String): (go.Tuple<{ r: go.Rune, size: go.GoInt }>);
    /**
        DecodeRune unpacks the first UTF-8 encoding in p and returns the rune and
        its width in bytes. If p is empty it returns ([RuneError], 0). Otherwise, if
        the encoding is invalid, it returns (RuneError, 1). Both are impossible
        results for correct, non-empty UTF-8.
        
        An encoding is invalid if it is incorrect UTF-8, encodes a rune that is
        out of range, or is not the shortest possible UTF-8 encoding for the
        value. No other validation is performed.
    **/
    @:go.Tuple("r", "size") @:native("DecodeRune") static function decodeRune(p: go.Slice<go.Byte>): (go.Tuple<{ r: go.Rune, size: go.GoInt }>);
    /**
        DecodeRuneInString is like [DecodeRune] but its input is a string. If s is
        empty it returns ([RuneError], 0). Otherwise, if the encoding is invalid, it
        returns (RuneError, 1). Both are impossible results for correct, non-empty
        UTF-8.
        
        An encoding is invalid if it is incorrect UTF-8, encodes a rune that is
        out of range, or is not the shortest possible UTF-8 encoding for the
        value. No other validation is performed.
    **/
    @:go.Tuple("r", "size") @:native("DecodeRuneInString") static function decodeRuneInString(s: String): (go.Tuple<{ r: go.Rune, size: go.GoInt }>);
    /**
        EncodeRune writes into p (which must be large enough) the UTF-8 encoding of the rune.
        If the rune is out of range, it writes the encoding of [RuneError].
        It returns the number of bytes written.
    **/
    @:native("EncodeRune") static function encodeRune(p: go.Slice<go.Byte>, r: go.Rune): (go.GoInt);
    /**
        FullRune reports whether the bytes in p begin with a full UTF-8 encoding of a rune.
        An invalid encoding is considered a full Rune since it will convert as a width-1 error rune.
    **/
    @:native("FullRune") static function fullRune(p: go.Slice<go.Byte>): (Bool);
    /**
        FullRuneInString is like FullRune but its input is a string.
    **/
    @:native("FullRuneInString") static function fullRuneInString(s: String): (Bool);
    /**
        RuneCount returns the number of runes in p. Erroneous and short
        encodings are treated as single runes of width 1 byte.
    **/
    @:native("RuneCount") static function runeCount(p: go.Slice<go.Byte>): (go.GoInt);
    /**
        RuneCountInString is like [RuneCount] but its input is a string.
    **/
    @:native("RuneCountInString") static function runeCountInString(s: String): (go.GoInt);
    /**
        RuneLen returns the number of bytes in the UTF-8 encoding of the rune.
        It returns -1 if the rune is not a valid value to encode in UTF-8.
    **/
    @:native("RuneLen") static function runeLen(r: go.Rune): (go.GoInt);
    /**
        RuneStart reports whether the byte could be the first byte of an encoded,
        possibly invalid rune. Second and subsequent bytes always have the top two
        bits set to 10.
    **/
    @:native("RuneStart") static function runeStart(b: go.Byte): (Bool);
    /**
        Valid reports whether p consists entirely of valid UTF-8-encoded runes.
    **/
    @:native("Valid") static function valid(p: go.Slice<go.Byte>): (Bool);
    /**
        ValidRune reports whether r can be legally encoded as UTF-8.
        Code points that are out of range or a surrogate half are illegal.
    **/
    @:native("ValidRune") static function validRune(r: go.Rune): (Bool);
    /**
        ValidString reports whether s consists entirely of valid UTF-8-encoded runes.
    **/
    @:native("ValidString") static function validString(s: String): (Bool);

}