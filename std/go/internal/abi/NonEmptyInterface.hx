package go.internal.abi;

@:structInit
@:go.Type({ name: "NonEmptyInterface", instanceName: "abi.NonEmptyInterface", imports: ["internal/abi"] })
extern class NonEmptyInterface {

    @:native("ITab") var iTab: go.Pointer<go.internal.abi.ITab>;
    @:native("Data") var data: go.unsafe.Pointer;

function new(iTab: go.Pointer<go.internal.abi.ITab>, data: go.unsafe.Pointer);

}