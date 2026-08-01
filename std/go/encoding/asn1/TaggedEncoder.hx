package go.encoding.asn1;

@:structInit
@:go.Type({ name: "taggedEncoder", instanceName: "asn1.taggedEncoder", imports: ["encoding/asn1"] })
extern class TaggedEncoder {

    @:native("Encode") function encode(dst: go.Slice<go.Byte>): Void;
    @:native("Len") function len(): (go.GoInt);

}