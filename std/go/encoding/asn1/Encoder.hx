package go.encoding.asn1;

@:go.Type({ name: "encoder", instanceName: "asn1.encoder", imports: ["encoding/asn1"] })
extern typedef Encoder = {

    @:native("Encode") function encode(dst: go.Slice<go.Byte>): Void;
    @:native("Len") function len(): (go.GoInt);

}