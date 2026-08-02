package go.encoding.asn1;

@:go.Type({ name: "int64Encoder", instanceName: "asn1.int64Encoder", imports: ["encoding/asn1"] })
extern typedef Int64Encoder = haxe.extern.EitherType<go.Int64, {
    @:native("Encode") function encode(dst: go.Slice<go.Byte>): Void;
    @:native("Len") function len(): (go.GoInt);

}>