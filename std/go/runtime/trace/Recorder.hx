package go.runtime.trace;

@:structInit
@:go.Type({ name: "recorder", instanceName: "trace.recorder", imports: ["runtime/trace"] })
extern class Recorder {

    @:native("Write") function write(b: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}