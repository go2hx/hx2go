package go.internal.abi;

@:structInit
@:go.Type({ name: "TypeAssert", instanceName: "abi.TypeAssert", imports: ["internal/abi"] })
extern class TypeAssert {

    @:native("Cache") var cache: go.Pointer<go.internal.abi.TypeAssertCache>;
    @:native("Inter") var inter: go.Pointer<go.internal.abi.InterfaceType>;
    @:native("CanFail") var canFail: Bool;

function new(cache: go.Pointer<go.internal.abi.TypeAssertCache>, inter: go.Pointer<go.internal.abi.InterfaceType>, canFail: Bool);

}