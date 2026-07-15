package go.internal.abi;

@:structInit
@:go.Type({ name: "Name", instanceName: "abi.Name", imports: ["internal/abi"] })
extern class Name {

    @:native("Bytes") var bytes: go.Pointer<go.Byte>;

function new(bytes: go.Pointer<go.Byte>);

    @:native("Data") function data(off: go.GoInt): go.Pointer<go.Byte>;
    @:native("DataChecked") function dataChecked(off: go.GoInt, whySafe: String): go.Pointer<go.Byte>;
    @:native("HasTag") function hasTag(): Bool;
    @:native("IsBlank") function isBlank(): Bool;
    @:native("IsEmbedded") function isEmbedded(): Bool;
    @:native("IsExported") function isExported(): Bool;
    @:native("Name") function name(): String;
    @:go.Tuple("p0", "p1") @:native("ReadVarint") function readVarint(off: go.GoInt): go.Tuple<{ p0: go.GoInt, p1: go.GoInt }>;
    @:native("Tag") function tag(): String;

}