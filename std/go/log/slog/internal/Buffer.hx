package go.log.slog.internal;

@:go.Type({ name: "buffer", instanceName: "buffer.buffer", imports: ["log/slog/internal/buffer"] })
extern class Buffer {

    @:native("New") static function _new(): go.Pointer<go.log.slog.internal.buffer.Buffer>;

}