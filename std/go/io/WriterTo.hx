package go.io;

@:go.Type({ name: "WriterTo", instanceName: "io.WriterTo", imports: ["io"] })
extern typedef WriterTo = {

    @:native("WriteTo") function writeTo(w: go.io.Writer): (go.Result<go.Int64>);

}