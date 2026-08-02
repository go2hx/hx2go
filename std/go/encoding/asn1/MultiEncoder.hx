package go.encoding.asn1;

@:go.Type({ name: "multiEncoder", instanceName: "asn1.multiEncoder", imports: ["encoding/asn1"] })
extern class MultiEncoder {

    @:native("Encode") function encode(dst: go.Slice<go.Byte>): Void;
    @:native("Len") function len(): (go.GoInt);

}