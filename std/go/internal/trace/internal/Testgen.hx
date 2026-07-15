package go.internal.trace.internal;

@:go.Type({ name: "testgen", instanceName: "testgen.testgen", imports: ["internal/trace/internal/testgen"] })
extern class Testgen {

    @:native("NoStack") static var NoStack: go.Slice<go.internal.trace.StackFrame>;
    @:native("NoString") static var NoString: String;

    @:native("Main") static function main(ver: go.internal.trace.version.Version, f: (p0: go.Pointer<go.internal.trace.internal.testgen.Trace>) -> Void): Void;
    @:native("NewTrace") static function newTrace(ver: go.internal.trace.version.Version): go.Pointer<go.internal.trace.internal.testgen.Trace>;

}