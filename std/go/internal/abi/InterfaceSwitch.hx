package go.internal.abi;

@:structInit
@:go.Type({ name: "InterfaceSwitch", instanceName: "abi.InterfaceSwitch", imports: ["internal/abi"] })
extern class InterfaceSwitch {

    @:native("Cache") var cache: go.Pointer<go.internal.abi.InterfaceSwitchCache>;
    @:native("NCases") var nCases: go.GoInt;
    @:native("Cases") var cases: go.GoArray<go.Pointer<go.internal.abi.InterfaceType>, 1>;

function new(cache: go.Pointer<go.internal.abi.InterfaceSwitchCache>, nCases: go.GoInt, cases: go.GoArray<go.Pointer<go.internal.abi.InterfaceType>, 1>);

}