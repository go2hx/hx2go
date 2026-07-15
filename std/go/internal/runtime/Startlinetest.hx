package go.internal.runtime;

@:go.Type({ name: "startlinetest", instanceName: "startlinetest.startlinetest", imports: ["internal/runtime/startlinetest"] })
extern class Startlinetest {

    @:native("CallerStartLine") static var CallerStartLine: (p0: Bool) -> go.GoInt;

    @:native("AsmFunc") static function asmFunc(): go.GoInt;

}