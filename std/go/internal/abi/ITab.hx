package go.internal.abi;

@:structInit
@:go.Type({ name: "ITab", instanceName: "abi.ITab", imports: ["internal/abi"] })
extern class ITab {

    @:native("Inter") var inter: go.Pointer<go.internal.abi.InterfaceType>;
    @:native("Type") var type: go.Pointer<go.internal.abi.Type>;
    @:native("Hash") var hash: go.UInt32;
    @:native("Fun") var fun: go.GoArray<go.UIntPtr, 1>;

function new(inter: go.Pointer<go.internal.abi.InterfaceType>, type: go.Pointer<go.internal.abi.Type>, hash: go.UInt32, fun: go.GoArray<go.UIntPtr, 1>);

}