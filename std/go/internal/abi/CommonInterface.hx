package go.internal.abi;

@:structInit
@:go.Type({ name: "CommonInterface", instanceName: "abi.CommonInterface", imports: ["internal/abi"] })
extern class CommonInterface {

    @:native("Data") var data: go.unsafe.Pointer;

function new(data: go.unsafe.Pointer);

}