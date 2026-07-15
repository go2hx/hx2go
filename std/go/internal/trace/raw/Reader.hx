package go.internal.trace.raw;

@:structInit
@:go.Type({ name: "Reader", instanceName: "raw.Reader", imports: ["internal/trace/raw"] })
extern class Reader {

    @:native("ReadEvent") function readEvent(): go.Result<go.internal.trace.raw.Event>;
    @:native("Version") function version(): go.internal.trace.version.Version;

}