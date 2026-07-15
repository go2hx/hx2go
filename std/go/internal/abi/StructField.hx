package go.internal.abi;

@:structInit
@:go.Type({ name: "StructField", instanceName: "abi.StructField", imports: ["internal/abi"] })
extern class StructField {

    @:native("Name") var name: go.internal.abi.Name;
    @:native("Typ") var typ: go.Pointer<go.internal.abi.Type>;
    @:native("Offset") var offset: go.UIntPtr;

function new(name: go.internal.abi.Name, typ: go.Pointer<go.internal.abi.Type>, offset: go.UIntPtr);

    @:native("Embedded") function embedded(): Bool;

}