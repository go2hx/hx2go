package go.internal.trace.raw;

@:structInit
@:go.Type({ name: "TextReader", instanceName: "raw.TextReader", imports: ["internal/trace/raw"] })
extern class TextReader {

    @:native("ReadEvent") function readEvent(): go.Result<go.internal.trace.raw.Event>;
    @:native("Version") function version(): go.internal.trace.version.Version;

}