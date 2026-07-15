package go.testing;

@:go.Type({ name: "slogtest", instanceName: "slogtest.slogtest", imports: ["testing/slogtest"] })
extern class Slogtest {

    @:native("Run") static function run(t: go.Pointer<go.testing.T>, newHandler: (p0: go.Pointer<go.testing.T>) -> go.log.slog.Handler, result: (p0: go.Pointer<go.testing.T>) -> go.Map<String, Dynamic>): Void;
    @:native("TestHandler") static function testHandler(h: go.log.slog.Handler, results: () -> go.Slice<go.Map<String, Dynamic>>): go.Error;

}