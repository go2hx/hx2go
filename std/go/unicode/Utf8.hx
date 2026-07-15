package go.unicode;

@:go.Type({ name: "utf8", instanceName: "utf8.utf8", imports: ["unicode/utf8"] })
extern class Utf8 {

    @:native("MaxRune") static var MaxRune: go.Rune;
    @:native("RuneError") static var RuneError: go.Rune;
    @:native("RuneSelf") static var RuneSelf: go.GoInt;
    @:native("UTFMax") static var UTFMax: go.GoInt;

    @:native("AppendRune") static function appendRune(p: go.Slice<go.Byte>, r: go.Rune): go.Slice<go.Byte>;
    @:go.Tuple("r", "size") @:native("DecodeLastRune") static function decodeLastRune(p: go.Slice<go.Byte>): go.Tuple<{ r: go.Rune, size: go.GoInt }>;
    @:go.Tuple("r", "size") @:native("DecodeLastRuneInString") static function decodeLastRuneInString(s: String): go.Tuple<{ r: go.Rune, size: go.GoInt }>;
    @:go.Tuple("r", "size") @:native("DecodeRune") static function decodeRune(p: go.Slice<go.Byte>): go.Tuple<{ r: go.Rune, size: go.GoInt }>;
    @:go.Tuple("r", "size") @:native("DecodeRuneInString") static function decodeRuneInString(s: String): go.Tuple<{ r: go.Rune, size: go.GoInt }>;
    @:native("EncodeRune") static function encodeRune(p: go.Slice<go.Byte>, r: go.Rune): go.GoInt;
    @:native("FullRune") static function fullRune(p: go.Slice<go.Byte>): Bool;
    @:native("FullRuneInString") static function fullRuneInString(s: String): Bool;
    @:native("RuneCount") static function runeCount(p: go.Slice<go.Byte>): go.GoInt;
    @:native("RuneCountInString") static function runeCountInString(s: String): go.GoInt;
    @:native("RuneLen") static function runeLen(r: go.Rune): go.GoInt;
    @:native("RuneStart") static function runeStart(b: go.Byte): Bool;
    @:native("Valid") static function valid(p: go.Slice<go.Byte>): Bool;
    @:native("ValidRune") static function validRune(r: go.Rune): Bool;
    @:native("ValidString") static function validString(s: String): Bool;

}