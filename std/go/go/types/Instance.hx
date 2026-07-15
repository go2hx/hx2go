package go.go.types;

@:structInit
@:go.Type({ name: "Instance", instanceName: "types.Instance", imports: ["go/types"] })
extern class Instance {

    @:native("TypeArgs") var typeArgs: go.Pointer<go.go.types.TypeList>;
    @:native("Type") var type: go.go.types.Type;

function new(typeArgs: go.Pointer<go.go.types.TypeList>, type: go.go.types.Type);

}