package go.vendor.golang.org.x.net.http2.hpack;

@:structInit
@:go.Type({ name: "Decoder", instanceName: "hpack.Decoder", imports: ["vendor/golang.org/x/net/http2/hpack"] })
extern class Decoder {

    @:native("Close") function close(): go.Error;
    @:native("DecodeFull") function decodeFull(p: go.Slice<go.Byte>): go.Result<go.Slice<go.vendor.golang.org.x.net.http2.hpack.HeaderField>>;
    @:native("EmitEnabled") function emitEnabled(): Bool;
    @:native("SetAllowedMaxDynamicTableSize") function setAllowedMaxDynamicTableSize(v: go.UInt32): Void;
    @:native("SetEmitEnabled") function setEmitEnabled(v: Bool): Void;
    @:native("SetEmitFunc") function setEmitFunc(emitFunc: (f: go.vendor.golang.org.x.net.http2.hpack.HeaderField) -> Void): Void;
    @:native("SetMaxDynamicTableSize") function setMaxDynamicTableSize(v: go.UInt32): Void;
    @:native("SetMaxStringLength") function setMaxStringLength(n: go.GoInt): Void;
    @:native("Write") function write(p: go.Slice<go.Byte>): go.Result<go.GoInt>;

}