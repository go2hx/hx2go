package go.vendor.golang.org.x.net.http2.hpack;

@:structInit
@:go.Type({ name: "Encoder", instanceName: "hpack.Encoder", imports: ["vendor/golang.org/x/net/http2/hpack"] })
extern class Encoder {

    @:native("MaxDynamicTableSize") function maxDynamicTableSize(): go.UInt32;
    @:native("SetMaxDynamicTableSize") function setMaxDynamicTableSize(v: go.UInt32): Void;
    @:native("SetMaxDynamicTableSizeLimit") function setMaxDynamicTableSizeLimit(v: go.UInt32): Void;
    @:native("WriteField") function writeField(f: go.vendor.golang.org.x.net.http2.hpack.HeaderField): go.Error;

}