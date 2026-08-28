package go.encoding.asn1;

/**
    A RawValue represents an undecoded ASN.1 object.
**/
@:structInit
@:go.Type({ name: "RawValue", instanceName: "asn1.RawValue", imports: ["encoding/asn1"] })
extern class RawValue {

    @:native("Class") var _class: go.GoInt;
    @:native("Tag") var tag: go.GoInt;
    @:native("IsCompound") var isCompound: Bool;
    @:native("Bytes") var bytes: go.Slice<go.Byte>;
    @:native("FullBytes") var fullBytes: go.Slice<go.Byte>;

    function new(_class: go.GoInt=0, tag: go.GoInt=0, isCompound: Bool=false, bytes: go.Slice<go.Byte>=null, fullBytes: go.Slice<go.Byte>=null);

}