package go.internal.trace;

@:go.Type({ name: "raw", instanceName: "raw.raw", imports: ["internal/trace/raw"] })
extern class Raw {

    @:native("NewReader") static function newReader(r: go.io.Reader): go.Result<go.Pointer<go.internal.trace.raw.Reader>>;
    @:native("NewTextReader") static function newTextReader(r: go.io.Reader): go.Result<go.Pointer<go.internal.trace.raw.TextReader>>;
    @:native("NewTextWriter") static function newTextWriter(w: go.io.Writer, v: go.internal.trace.version.Version): go.Result<go.Pointer<go.internal.trace.raw.TextWriter>>;
    @:native("NewWriter") static function newWriter(w: go.io.Writer, v: go.internal.trace.version.Version): go.Result<go.Pointer<go.internal.trace.raw.Writer>>;

}