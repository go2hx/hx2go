package go.log.slog.internal.buffer;

@:go.Type({ name: "Buffer", instanceName: "buffer.Buffer", imports: ["log/slog/internal/buffer"] })
extern class Buffer {

    @:native("Free") function free(): Void;
    @:native("Len") function len(): go.GoInt;
    @:native("Reset") function reset(): Void;
    @:native("SetLen") function setLen(n: go.GoInt): Void;
    @:native("String") function string(): String;
    @:native("Write") function write(p: go.Slice<go.Byte>): go.Result<go.GoInt>;
    @:native("WriteByte") function writeByte(c: go.Byte): go.Error;
    @:native("WriteString") function writeString(s: String): go.Result<go.GoInt>;

}