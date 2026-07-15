package go.regexp;

@:structInit
@:go.Type({ name: "Regexp", instanceName: "regexp.Regexp", imports: ["regexp"] })
extern class Regexp {

    @:native("AppendText") function appendText(b: go.Slice<go.Byte>): go.Result<go.Slice<go.Byte>>;
    @:native("Copy") function copy(): go.Pointer<go.regexp.Regexp>;
    @:native("Expand") function expand(dst: go.Slice<go.Byte>, template: go.Slice<go.Byte>, src: go.Slice<go.Byte>, match: go.Slice<go.GoInt>): go.Slice<go.Byte>;
    @:native("ExpandString") function expandString(dst: go.Slice<go.Byte>, template: String, src: String, match: go.Slice<go.GoInt>): go.Slice<go.Byte>;
    @:native("Find") function find(b: go.Slice<go.Byte>): go.Slice<go.Byte>;
    @:native("FindAll") function findAll(b: go.Slice<go.Byte>, n: go.GoInt): go.Slice<go.Slice<go.Byte>>;
    @:native("FindAllIndex") function findAllIndex(b: go.Slice<go.Byte>, n: go.GoInt): go.Slice<go.Slice<go.GoInt>>;
    @:native("FindAllString") function findAllString(s: String, n: go.GoInt): go.Slice<String>;
    @:native("FindAllStringIndex") function findAllStringIndex(s: String, n: go.GoInt): go.Slice<go.Slice<go.GoInt>>;
    @:native("FindAllStringSubmatch") function findAllStringSubmatch(s: String, n: go.GoInt): go.Slice<go.Slice<String>>;
    @:native("FindAllStringSubmatchIndex") function findAllStringSubmatchIndex(s: String, n: go.GoInt): go.Slice<go.Slice<go.GoInt>>;
    @:native("FindAllSubmatch") function findAllSubmatch(b: go.Slice<go.Byte>, n: go.GoInt): go.Slice<go.Slice<go.Slice<go.Byte>>>;
    @:native("FindAllSubmatchIndex") function findAllSubmatchIndex(b: go.Slice<go.Byte>, n: go.GoInt): go.Slice<go.Slice<go.GoInt>>;
    @:native("FindIndex") function findIndex(b: go.Slice<go.Byte>): go.Slice<go.GoInt>;
    @:native("FindReaderIndex") function findReaderIndex(r: go.io.RuneReader): go.Slice<go.GoInt>;
    @:native("FindReaderSubmatchIndex") function findReaderSubmatchIndex(r: go.io.RuneReader): go.Slice<go.GoInt>;
    @:native("FindString") function findString(s: String): String;
    @:native("FindStringIndex") function findStringIndex(s: String): go.Slice<go.GoInt>;
    @:native("FindStringSubmatch") function findStringSubmatch(s: String): go.Slice<String>;
    @:native("FindStringSubmatchIndex") function findStringSubmatchIndex(s: String): go.Slice<go.GoInt>;
    @:native("FindSubmatch") function findSubmatch(b: go.Slice<go.Byte>): go.Slice<go.Slice<go.Byte>>;
    @:native("FindSubmatchIndex") function findSubmatchIndex(b: go.Slice<go.Byte>): go.Slice<go.GoInt>;
    @:go.Tuple("prefix", "complete") @:native("LiteralPrefix") function literalPrefix(): go.Tuple<{ prefix: String, complete: Bool }>;
    @:native("Longest") function longest(): Void;
    @:native("MarshalText") function marshalText(): go.Result<go.Slice<go.Byte>>;
    @:native("Match") function match(b: go.Slice<go.Byte>): Bool;
    @:native("MatchReader") function matchReader(r: go.io.RuneReader): Bool;
    @:native("MatchString") function matchString(s: String): Bool;
    @:native("NumSubexp") function numSubexp(): go.GoInt;
    @:native("ReplaceAll") function replaceAll(src: go.Slice<go.Byte>, repl: go.Slice<go.Byte>): go.Slice<go.Byte>;
    @:native("ReplaceAllFunc") function replaceAllFunc(src: go.Slice<go.Byte>, repl: (p0: go.Slice<go.Byte>) -> go.Slice<go.Byte>): go.Slice<go.Byte>;
    @:native("ReplaceAllLiteral") function replaceAllLiteral(src: go.Slice<go.Byte>, repl: go.Slice<go.Byte>): go.Slice<go.Byte>;
    @:native("ReplaceAllLiteralString") function replaceAllLiteralString(src: String, repl: String): String;
    @:native("ReplaceAllString") function replaceAllString(src: String, repl: String): String;
    @:native("ReplaceAllStringFunc") function replaceAllStringFunc(src: String, repl: (p0: String) -> String): String;
    @:native("Split") function split(s: String, n: go.GoInt): go.Slice<String>;
    @:native("String") function string(): String;
    @:native("SubexpIndex") function subexpIndex(name: String): go.GoInt;
    @:native("SubexpNames") function subexpNames(): go.Slice<String>;
    @:native("UnmarshalText") function unmarshalText(text: go.Slice<go.Byte>): go.Error;

}