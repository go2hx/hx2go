package go.vendor.golang.org.x.net.http2;

@:go.Type({ name: "hpack", instanceName: "hpack.hpack", imports: ["vendor/golang.org/x/net/http2/hpack"] })
extern class Hpack {

    @:native("AppendHuffmanString") static function appendHuffmanString(dst: go.Slice<go.Byte>, s: String): go.Slice<go.Byte>;
    @:native("HuffmanDecode") static function huffmanDecode(w: go.io.Writer, v: go.Slice<go.Byte>): go.Result<go.GoInt>;
    @:native("HuffmanDecodeToString") static function huffmanDecodeToString(v: go.Slice<go.Byte>): go.Result<String>;
    @:native("HuffmanEncodeLength") static function huffmanEncodeLength(s: String): go.UInt64;
    @:native("NewDecoder") static function newDecoder(maxDynamicTableSize: go.UInt32, emitFunc: (f: go.vendor.golang.org.x.net.http2.hpack.HeaderField) -> Void): go.Pointer<go.vendor.golang.org.x.net.http2.hpack.Decoder>;
    @:native("NewEncoder") static function newEncoder(w: go.io.Writer): go.Pointer<go.vendor.golang.org.x.net.http2.hpack.Encoder>;

}