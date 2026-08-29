package go.unicode;

/**
    Package utf16 implements encoding and decoding of UTF-16 sequences.
**/
@:go.Type({ name: "utf16", instanceName: "utf16.utf16", imports: ["unicode/utf16"] })
extern class Utf16 {

    /**
        AppendRune appends the UTF-16 encoding of the Unicode code point r
        to the end of p and returns the extended buffer. If the rune is not
        a valid Unicode code point, it appends the encoding of U+FFFD.
    **/
    @:native("AppendRune") static function appendRune(a: go.Slice<go.UInt16>, r: go.Rune): (go.Slice<go.UInt16>);
    /**
        Decode returns the Unicode code point sequence represented
        by the UTF-16 encoding s.
    **/
    @:native("Decode") static function decode(s: go.Slice<go.UInt16>): (go.Slice<go.Rune>);
    /**
        DecodeRune returns the UTF-16 decoding of a surrogate pair.
        If the pair is not a valid UTF-16 surrogate pair, DecodeRune returns
        the Unicode replacement code point U+FFFD.
    **/
    @:native("DecodeRune") static function decodeRune(r1: go.Rune, r2: go.Rune): (go.Rune);
    /**
        Encode returns the UTF-16 encoding of the Unicode code point sequence s.
    **/
    @:native("Encode") static function encode(s: go.Slice<go.Rune>): (go.Slice<go.UInt16>);
    /**
        EncodeRune returns the UTF-16 surrogate pair r1, r2 for the given rune.
        If the rune is not a valid Unicode code point or does not need encoding,
        EncodeRune returns U+FFFD, U+FFFD.
    **/
    @:go.Tuple("r1", "r2") @:native("EncodeRune") static function encodeRune(r: go.Rune): (go.Tuple<{ r1: go.Rune, r2: go.Rune }>);
    /**
        IsSurrogate reports whether the specified Unicode code point
        can appear in a surrogate pair.
    **/
    @:native("IsSurrogate") static function isSurrogate(r: go.Rune): (Bool);
    /**
        RuneLen returns the number of 16-bit words in the UTF-16 encoding of the rune.
        It returns -1 if the rune is not a valid value to encode in UTF-16.
    **/
    @:native("RuneLen") static function runeLen(r: go.Rune): (go.GoInt);

}