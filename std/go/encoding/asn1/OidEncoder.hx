package go.encoding.asn1;

@:go.Type({ name: "oidEncoder", instanceName: "asn1.oidEncoder", imports: ["encoding/asn1"] })
extern class OidEncoder {

    @:native("Encode") function encode(dst: go.Slice<go.Byte>): Void;
    @:native("Len") function len(): (go.GoInt);

}