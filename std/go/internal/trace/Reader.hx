package go.internal.trace;

@:structInit
@:go.Type({ name: "Reader", instanceName: "trace.Reader", imports: ["internal/trace"] })
extern class Reader {

    @:native("ReadEvent") function readEvent(): go.Result<go.internal.trace.Event>;

}