package go;

@:go.Type({ name: "bytes", instanceName: "bytes.bytes", imports: ["bytes"] })
extern class Bytes {

    @:native("MinRead") static var MinRead: go.GoInt;

    @:native("Clone") static function clone(b: go.Slice<go.Byte>): (go.Slice<go.Byte>);
    @:native("Compare") static function compare(a: go.Slice<go.Byte>, b: go.Slice<go.Byte>): (go.GoInt);
    @:native("Contains") static function contains(b: go.Slice<go.Byte>, subslice: go.Slice<go.Byte>): (Bool);
    @:native("ContainsAny") static function containsAny(b: go.Slice<go.Byte>, chars: String): (Bool);
    @:native("ContainsFunc") static function containsFunc(b: go.Slice<go.Byte>, f: (p0: go.Rune) -> (Bool)): (Bool);
    @:native("ContainsRune") static function containsRune(b: go.Slice<go.Byte>, r: go.Rune): (Bool);
    @:native("Count") static function count(s: go.Slice<go.Byte>, sep: go.Slice<go.Byte>): (go.GoInt);
    @:go.Tuple("before", "after", "found") @:native("Cut") static function cut(s: go.Slice<go.Byte>, sep: go.Slice<go.Byte>): (go.Tuple<{ before: go.Slice<go.Byte>, after: go.Slice<go.Byte>, found: Bool }>);
    @:go.Tuple("after", "found") @:native("CutPrefix") static function cutPrefix(s: go.Slice<go.Byte>, prefix: go.Slice<go.Byte>): (go.Tuple<{ after: go.Slice<go.Byte>, found: Bool }>);
    @:go.Tuple("before", "found") @:native("CutSuffix") static function cutSuffix(s: go.Slice<go.Byte>, suffix: go.Slice<go.Byte>): (go.Tuple<{ before: go.Slice<go.Byte>, found: Bool }>);
    @:native("Equal") static function equal(a: go.Slice<go.Byte>, b: go.Slice<go.Byte>): (Bool);
    @:native("EqualFold") static function equalFold(s: go.Slice<go.Byte>, t: go.Slice<go.Byte>): (Bool);
    @:native("Fields") static function fields(s: go.Slice<go.Byte>): (go.Slice<go.Slice<go.Byte>>);
    @:native("FieldsFunc") static function fieldsFunc(s: go.Slice<go.Byte>, f: (p0: go.Rune) -> (Bool)): (go.Slice<go.Slice<go.Byte>>);
    @:native("FieldsFuncSeq") static function fieldsFuncSeq(s: go.Slice<go.Byte>, f: (p0: go.Rune) -> (Bool)): (go.iter.Seq<go.Slice<go.Byte>>);
    @:native("FieldsSeq") static function fieldsSeq(s: go.Slice<go.Byte>): (go.iter.Seq<go.Slice<go.Byte>>);
    @:native("HasPrefix") static function hasPrefix(s: go.Slice<go.Byte>, prefix: go.Slice<go.Byte>): (Bool);
    @:native("HasSuffix") static function hasSuffix(s: go.Slice<go.Byte>, suffix: go.Slice<go.Byte>): (Bool);
    @:native("Index") static function index(s: go.Slice<go.Byte>, sep: go.Slice<go.Byte>): (go.GoInt);
    @:native("IndexAny") static function indexAny(s: go.Slice<go.Byte>, chars: String): (go.GoInt);
    @:native("IndexByte") static function indexByte(b: go.Slice<go.Byte>, c: go.Byte): (go.GoInt);
    @:native("IndexFunc") static function indexFunc(s: go.Slice<go.Byte>, f: (r: go.Rune) -> (Bool)): (go.GoInt);
    @:native("IndexRune") static function indexRune(s: go.Slice<go.Byte>, r: go.Rune): (go.GoInt);
    @:native("Join") static function join(s: go.Slice<go.Slice<go.Byte>>, sep: go.Slice<go.Byte>): (go.Slice<go.Byte>);
    @:native("LastIndex") static function lastIndex(s: go.Slice<go.Byte>, sep: go.Slice<go.Byte>): (go.GoInt);
    @:native("LastIndexAny") static function lastIndexAny(s: go.Slice<go.Byte>, chars: String): (go.GoInt);
    @:native("LastIndexByte") static function lastIndexByte(s: go.Slice<go.Byte>, c: go.Byte): (go.GoInt);
    @:native("LastIndexFunc") static function lastIndexFunc(s: go.Slice<go.Byte>, f: (r: go.Rune) -> (Bool)): (go.GoInt);
    @:native("Lines") static function lines(s: go.Slice<go.Byte>): (go.iter.Seq<go.Slice<go.Byte>>);
    @:native("Map") static function map(mapping: (r: go.Rune) -> (go.Rune), s: go.Slice<go.Byte>): (go.Slice<go.Byte>);
    @:native("NewBuffer") static function newBuffer(buf: go.Slice<go.Byte>): (go.Pointer<go.bytes.Buffer>);
    @:native("NewBufferString") static function newBufferString(s: String): (go.Pointer<go.bytes.Buffer>);
    @:native("NewReader") static function newReader(b: go.Slice<go.Byte>): (go.Pointer<go.bytes.Reader>);
    @:native("Repeat") static function repeat(b: go.Slice<go.Byte>, count: go.GoInt): (go.Slice<go.Byte>);
    @:native("Replace") static function replace(s: go.Slice<go.Byte>, old: go.Slice<go.Byte>, _new: go.Slice<go.Byte>, n: go.GoInt): (go.Slice<go.Byte>);
    @:native("ReplaceAll") static function replaceAll(s: go.Slice<go.Byte>, old: go.Slice<go.Byte>, _new: go.Slice<go.Byte>): (go.Slice<go.Byte>);
    @:native("Runes") static function runes(s: go.Slice<go.Byte>): (go.Slice<go.Rune>);
    @:native("Split") static function split(s: go.Slice<go.Byte>, sep: go.Slice<go.Byte>): (go.Slice<go.Slice<go.Byte>>);
    @:native("SplitAfter") static function splitAfter(s: go.Slice<go.Byte>, sep: go.Slice<go.Byte>): (go.Slice<go.Slice<go.Byte>>);
    @:native("SplitAfterN") static function splitAfterN(s: go.Slice<go.Byte>, sep: go.Slice<go.Byte>, n: go.GoInt): (go.Slice<go.Slice<go.Byte>>);
    @:native("SplitAfterSeq") static function splitAfterSeq(s: go.Slice<go.Byte>, sep: go.Slice<go.Byte>): (go.iter.Seq<go.Slice<go.Byte>>);
    @:native("SplitN") static function splitN(s: go.Slice<go.Byte>, sep: go.Slice<go.Byte>, n: go.GoInt): (go.Slice<go.Slice<go.Byte>>);
    @:native("SplitSeq") static function splitSeq(s: go.Slice<go.Byte>, sep: go.Slice<go.Byte>): (go.iter.Seq<go.Slice<go.Byte>>);
    @:native("Title") static function title(s: go.Slice<go.Byte>): (go.Slice<go.Byte>);
    @:native("ToLower") static function toLower(s: go.Slice<go.Byte>): (go.Slice<go.Byte>);
    @:native("ToLowerSpecial") static function toLowerSpecial(c: go.unicode.SpecialCase, s: go.Slice<go.Byte>): (go.Slice<go.Byte>);
    @:native("ToTitle") static function toTitle(s: go.Slice<go.Byte>): (go.Slice<go.Byte>);
    @:native("ToTitleSpecial") static function toTitleSpecial(c: go.unicode.SpecialCase, s: go.Slice<go.Byte>): (go.Slice<go.Byte>);
    @:native("ToUpper") static function toUpper(s: go.Slice<go.Byte>): (go.Slice<go.Byte>);
    @:native("ToUpperSpecial") static function toUpperSpecial(c: go.unicode.SpecialCase, s: go.Slice<go.Byte>): (go.Slice<go.Byte>);
    @:native("ToValidUTF8") static function toValidUTF8(s: go.Slice<go.Byte>, replacement: go.Slice<go.Byte>): (go.Slice<go.Byte>);
    @:native("Trim") static function trim(s: go.Slice<go.Byte>, cutset: String): (go.Slice<go.Byte>);
    @:native("TrimFunc") static function trimFunc(s: go.Slice<go.Byte>, f: (r: go.Rune) -> (Bool)): (go.Slice<go.Byte>);
    @:native("TrimLeft") static function trimLeft(s: go.Slice<go.Byte>, cutset: String): (go.Slice<go.Byte>);
    @:native("TrimLeftFunc") static function trimLeftFunc(s: go.Slice<go.Byte>, f: (r: go.Rune) -> (Bool)): (go.Slice<go.Byte>);
    @:native("TrimPrefix") static function trimPrefix(s: go.Slice<go.Byte>, prefix: go.Slice<go.Byte>): (go.Slice<go.Byte>);
    @:native("TrimRight") static function trimRight(s: go.Slice<go.Byte>, cutset: String): (go.Slice<go.Byte>);
    @:native("TrimRightFunc") static function trimRightFunc(s: go.Slice<go.Byte>, f: (r: go.Rune) -> (Bool)): (go.Slice<go.Byte>);
    @:native("TrimSpace") static function trimSpace(s: go.Slice<go.Byte>): (go.Slice<go.Byte>);
    @:native("TrimSuffix") static function trimSuffix(s: go.Slice<go.Byte>, suffix: go.Slice<go.Byte>): (go.Slice<go.Byte>);

}