package go.log.slog;

@:structInit
@:go.Type({ name: "handlerWriter", instanceName: "slog.handlerWriter", imports: ["log/slog"] })
extern class HandlerWriter {

    @:native("Write") function write(buf: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}