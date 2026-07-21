package go.runtime;

@:structInit
@:go.Type({ name: "traceFrame", instanceName: "runtime.traceFrame", imports: ["runtime"] })
extern class TraceFrame {

    @:native("PC") var PC: go.UIntPtr;

    function new(PC: go.UIntPtr);

}