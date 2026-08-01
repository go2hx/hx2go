package go.encoding.asn1;

@:go.Type({ name: "stringEncoder", instanceName: "asn1.stringEncoder", imports: ["encoding/asn1"] })
extern typedef StringEncoder = haxe.extern.EitherType<String, {
    @:native("Encode") function encode(dst: go.Slice<go.Byte>): Void;
    @:native("Len") function len(): (go.GoInt);

}>