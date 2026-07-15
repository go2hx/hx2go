package go.encoding.asn1;

@:structInit
@:go.Type({ name: "RawValue", instanceName: "asn1.RawValue", imports: ["encoding/asn1"] })
extern class RawValue {

    @:native("Class") var _class: go.GoInt;
    @:native("Tag") var tag: go.GoInt;
    @:native("IsCompound") var isCompound: Bool;
    @:native("Bytes") var bytes: go.Slice<go.Byte>;
    @:native("FullBytes") var fullBytes: go.Slice<go.Byte>;

function new(_class: go.GoInt, tag: go.GoInt, isCompound: Bool, bytes: go.Slice<go.Byte>, fullBytes: go.Slice<go.Byte>);

}