package go;

@:go.Type({ name: "strings", instanceName: "strings.strings", imports: ["strings"] })
extern class Strings {

    @:native("Clone") static function clone(s: String): (String);
    @:native("Compare") static function compare(a: String, b: String): (go.GoInt);
    @:native("Contains") static function contains(s: String, substr: String): (Bool);
    @:native("ContainsAny") static function containsAny(s: String, chars: String): (Bool);
    @:native("ContainsFunc") static function containsFunc(s: String, f: (p0: go.Rune) -> (Bool)): (Bool);
    @:native("ContainsRune") static function containsRune(s: String, r: go.Rune): (Bool);
    @:native("Count") static function count(s: String, substr: String): (go.GoInt);
    @:go.Tuple("before", "after", "found") @:native("Cut") static function cut(s: String, sep: String): (go.Tuple<{ before: String, after: String, found: Bool }>);
    @:go.Tuple("after", "found") @:native("CutPrefix") static function cutPrefix(s: String, prefix: String): (go.Tuple<{ after: String, found: Bool }>);
    @:go.Tuple("before", "found") @:native("CutSuffix") static function cutSuffix(s: String, suffix: String): (go.Tuple<{ before: String, found: Bool }>);
    @:native("EqualFold") static function equalFold(s: String, t: String): (Bool);
    @:native("Fields") static function fields(s: String): (go.Slice<String>);
    @:native("FieldsFunc") static function fieldsFunc(s: String, f: (p0: go.Rune) -> (Bool)): (go.Slice<String>);
    @:native("FieldsFuncSeq") static function fieldsFuncSeq(s: String, f: (p0: go.Rune) -> (Bool)): (go.iter.Seq<String>);
    @:native("FieldsSeq") static function fieldsSeq(s: String): (go.iter.Seq<String>);
    @:native("HasPrefix") static function hasPrefix(s: String, prefix: String): (Bool);
    @:native("HasSuffix") static function hasSuffix(s: String, suffix: String): (Bool);
    @:native("Index") static function index(s: String, substr: String): (go.GoInt);
    @:native("IndexAny") static function indexAny(s: String, chars: String): (go.GoInt);
    @:native("IndexByte") static function indexByte(s: String, c: go.Byte): (go.GoInt);
    @:native("IndexFunc") static function indexFunc(s: String, f: (p0: go.Rune) -> (Bool)): (go.GoInt);
    @:native("IndexRune") static function indexRune(s: String, r: go.Rune): (go.GoInt);
    @:native("Join") static function join(elems: go.Slice<String>, sep: String): (String);
    @:native("LastIndex") static function lastIndex(s: String, substr: String): (go.GoInt);
    @:native("LastIndexAny") static function lastIndexAny(s: String, chars: String): (go.GoInt);
    @:native("LastIndexByte") static function lastIndexByte(s: String, c: go.Byte): (go.GoInt);
    @:native("LastIndexFunc") static function lastIndexFunc(s: String, f: (p0: go.Rune) -> (Bool)): (go.GoInt);
    @:native("Lines") static function lines(s: String): (go.iter.Seq<String>);
    @:native("Map") static function map(mapping: (p0: go.Rune) -> (go.Rune), s: String): (String);
    @:native("NewReader") static function newReader(s: String): (go.Pointer<go.strings.Reader>);
    @:native("NewReplacer") static function newReplacer(oldnew: haxe.Rest<String>): (go.Pointer<go.strings.Replacer>);
    @:native("Repeat") static function repeat(s: String, count: go.GoInt): (String);
    @:native("Replace") static function replace(s: String, old: String, _new: String, n: go.GoInt): (String);
    @:native("ReplaceAll") static function replaceAll(s: String, old: String, _new: String): (String);
    @:native("Split") static function split(s: String, sep: String): (go.Slice<String>);
    @:native("SplitAfter") static function splitAfter(s: String, sep: String): (go.Slice<String>);
    @:native("SplitAfterN") static function splitAfterN(s: String, sep: String, n: go.GoInt): (go.Slice<String>);
    @:native("SplitAfterSeq") static function splitAfterSeq(s: String, sep: String): (go.iter.Seq<String>);
    @:native("SplitN") static function splitN(s: String, sep: String, n: go.GoInt): (go.Slice<String>);
    @:native("SplitSeq") static function splitSeq(s: String, sep: String): (go.iter.Seq<String>);
    @:native("Title") static function title(s: String): (String);
    @:native("ToLower") static function toLower(s: String): (String);
    @:native("ToLowerSpecial") static function toLowerSpecial(c: go.unicode.SpecialCase, s: String): (String);
    @:native("ToTitle") static function toTitle(s: String): (String);
    @:native("ToTitleSpecial") static function toTitleSpecial(c: go.unicode.SpecialCase, s: String): (String);
    @:native("ToUpper") static function toUpper(s: String): (String);
    @:native("ToUpperSpecial") static function toUpperSpecial(c: go.unicode.SpecialCase, s: String): (String);
    @:native("ToValidUTF8") static function toValidUTF8(s: String, replacement: String): (String);
    @:native("Trim") static function trim(s: String, cutset: String): (String);
    @:native("TrimFunc") static function trimFunc(s: String, f: (p0: go.Rune) -> (Bool)): (String);
    @:native("TrimLeft") static function trimLeft(s: String, cutset: String): (String);
    @:native("TrimLeftFunc") static function trimLeftFunc(s: String, f: (p0: go.Rune) -> (Bool)): (String);
    @:native("TrimPrefix") static function trimPrefix(s: String, prefix: String): (String);
    @:native("TrimRight") static function trimRight(s: String, cutset: String): (String);
    @:native("TrimRightFunc") static function trimRightFunc(s: String, f: (p0: go.Rune) -> (Bool)): (String);
    @:native("TrimSpace") static function trimSpace(s: String): (String);
    @:native("TrimSuffix") static function trimSuffix(s: String, suffix: String): (String);

}