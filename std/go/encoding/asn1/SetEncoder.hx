package go.encoding.asn1;

@:go.Type({ name: "setEncoder", instanceName: "asn1.setEncoder", imports: ["encoding/asn1"] })
extern class SetEncoder {

    @:native("Encode") function encode(dst: go.Slice<go.Byte>): Void;
    @:native("Len") function len(): (go.GoInt);

}