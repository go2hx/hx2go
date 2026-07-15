package go.go.types;

@:structInit
@:go.Type({ name: "TypeParam", instanceName: "types.TypeParam", imports: ["go/types"] })
extern class TypeParam {

    @:native("Constraint") function constraint(): go.go.types.Type;
    @:native("Index") function index(): go.GoInt;
    @:native("Obj") function obj(): go.Pointer<go.go.types.TypeName>;
    @:native("SetConstraint") function setConstraint(bound: go.go.types.Type): Void;
    @:native("String") function string(): String;
    @:native("Underlying") function underlying(): go.go.types.Type;

}