package go;

@:go.Type({ name: "regexp", instanceName: "regexp.regexp", imports: ["regexp"] })
extern class Regexp {

    @:native("Compile") static function compile(expr: String): (go.Result<go.Pointer<go.regexp.Regexp>>);
    @:native("CompilePOSIX") static function compilePOSIX(expr: String): (go.Result<go.Pointer<go.regexp.Regexp>>);
    @:native("Match") static function match(pattern: String, b: go.Slice<go.Byte>): (go.Result<Bool>);
    @:native("MatchReader") static function matchReader(pattern: String, r: go.io.RuneReader): (go.Result<Bool>);
    @:native("MatchString") static function matchString(pattern: String, s: String): (go.Result<Bool>);
    @:native("MustCompile") static function mustCompile(str: String): (go.Pointer<go.regexp.Regexp>);
    @:native("MustCompilePOSIX") static function mustCompilePOSIX(str: String): (go.Pointer<go.regexp.Regexp>);
    @:native("QuoteMeta") static function quoteMeta(s: String): (String);

}