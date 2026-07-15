package go.internal.trace.raw;

@:structInit
@:go.Type({ name: "TextWriter", instanceName: "raw.TextWriter", imports: ["internal/trace/raw"] })
extern class TextWriter {

    @:native("WriteEvent") function writeEvent(e: go.internal.trace.raw.Event): go.Error;

}