package go.go.types;

/**
    Instance reports the type arguments and instantiated type for type and
    function instantiations. For type instantiations, [Type] will be of dynamic
    type *[Named]. For function instantiations, [Type] will be of dynamic type
    *Signature.
**/
@:structInit
@:go.Type({ name: "Instance", instanceName: "types.Instance", imports: ["go/types"] })
extern class Instance {

    @:native("TypeArgs") var typeArgs: go.Pointer<go.go.types.TypeList>;
    @:native("Type") var type: go.go.types.Type;

    function new(typeArgs: go.Pointer<go.go.types.TypeList>=null, type: go.go.types.Type=null);

}