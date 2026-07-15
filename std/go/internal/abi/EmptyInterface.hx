package go.internal.abi;

@:structInit
@:go.Type({ name: "EmptyInterface", instanceName: "abi.EmptyInterface", imports: ["internal/abi"] })
extern class EmptyInterface {

    @:native("Type") var type: go.Pointer<go.internal.abi.Type>;
    @:native("Data") var data: go.unsafe.Pointer;

function new(type: go.Pointer<go.internal.abi.Type>, data: go.unsafe.Pointer);

}