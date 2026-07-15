package go.internal.lazyregexp;

@:structInit
@:go.Type({ name: "Regexp", instanceName: "lazyregexp.Regexp", imports: ["internal/lazyregexp"] })
extern class Regexp {

    @:native("FindAllString") function findAllString(s: String, n: go.GoInt): go.Slice<String>;
    @:native("FindString") function findString(s: String): String;
    @:native("FindStringSubmatch") function findStringSubmatch(s: String): go.Slice<String>;
    @:native("FindStringSubmatchIndex") function findStringSubmatchIndex(s: String): go.Slice<go.GoInt>;
    @:native("FindSubmatch") function findSubmatch(s: go.Slice<go.Byte>): go.Slice<go.Slice<go.Byte>>;
    @:native("MatchString") function matchString(s: String): Bool;
    @:native("ReplaceAllString") function replaceAllString(src: String, repl: String): String;
    @:native("SubexpNames") function subexpNames(): go.Slice<String>;

}