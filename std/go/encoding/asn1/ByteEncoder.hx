package go.encoding.asn1;

@:go.Type({ name: "byteEncoder", instanceName: "asn1.byteEncoder", imports: ["encoding/asn1"] })
extern typedef ByteEncoder = haxe.extern.EitherType<go.Byte, {
    @:native("Encode") function encode(dst: go.Slice<go.Byte>): Void;
    @:native("Len") function len(): (go.GoInt);

}>