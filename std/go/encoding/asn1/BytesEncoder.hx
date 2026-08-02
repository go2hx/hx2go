package go.encoding.asn1;

@:go.Type({ name: "bytesEncoder", instanceName: "asn1.bytesEncoder", imports: ["encoding/asn1"] })
extern class BytesEncoder {

    @:native("Encode") function encode(dst: go.Slice<go.Byte>): Void;
    @:native("Len") function len(): (go.GoInt);

}