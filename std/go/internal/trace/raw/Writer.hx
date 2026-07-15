package go.internal.trace.raw;

@:structInit
@:go.Type({ name: "Writer", instanceName: "raw.Writer", imports: ["internal/trace/raw"] })
extern class Writer {

    @:native("WriteEvent") function writeEvent(e: go.internal.trace.raw.Event): go.Error;

}