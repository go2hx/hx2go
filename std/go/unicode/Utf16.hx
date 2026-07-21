package go.unicode;

@:go.Type({ name: "utf16", instanceName: "utf16.utf16", imports: ["unicode/utf16"] })
extern class Utf16 {

    @:native("AppendRune") static function appendRune(a: go.Slice<go.UInt16>, r: go.Rune): (go.Slice<go.UInt16>);
    @:native("Decode") static function decode(s: go.Slice<go.UInt16>): (go.Slice<go.Rune>);
    @:native("DecodeRune") static function decodeRune(r1: go.Rune, r2: go.Rune): (go.Rune);
    @:native("Encode") static function encode(s: go.Slice<go.Rune>): (go.Slice<go.UInt16>);
    @:go.Tuple("r1", "r2") @:native("EncodeRune") static function encodeRune(r: go.Rune): (go.Tuple<{ r1: go.Rune, r2: go.Rune }>);
    @:native("IsSurrogate") static function isSurrogate(r: go.Rune): (Bool);
    @:native("RuneLen") static function runeLen(r: go.Rune): (go.GoInt);

}