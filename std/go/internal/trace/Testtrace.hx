package go.internal.trace;

@:go.Type({ name: "testtrace", instanceName: "testtrace.testtrace", imports: ["internal/trace/testtrace"] })
extern class Testtrace {

    @:native("Dump") static function dump(t: go.Pointer<go.testing.T>, testName: String, traceBytes: go.Slice<go.Byte>, forceToFile: Bool): Void;
    @:native("ExpectSuccess") static function expectSuccess(): go.Pointer<go.internal.trace.testtrace.Expectation>;
    @:native("HasSyscallEvents") static function hasSyscallEvents(): Bool;
    @:native("MustHaveSyscallEvents") static function mustHaveSyscallEvents(t: go.Pointer<go.testing.T>): Void;
    @:native("NewValidator") static function newValidator(): go.Pointer<go.internal.trace.testtrace.Validator>;
    @:native("ParseExpectation") static function parseExpectation(data: go.Slice<go.Byte>): go.Result<go.Pointer<go.internal.trace.testtrace.Expectation>>;
    @:go.Tuple("p0", "p1", "p2", "p3") @:native("ParseFile") static function parseFile(testPath: String): go.Tuple<{ p0: go.io.Reader, p1: go.internal.trace.version.Version, p2: go.Pointer<go.internal.trace.testtrace.Expectation>, p3: go.Error }>;

}