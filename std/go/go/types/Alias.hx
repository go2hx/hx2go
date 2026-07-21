package go.go.types;

@:structInit
@:go.Type({ name: "Alias", instanceName: "types.Alias", imports: ["go/types"] })
extern class Alias {

    @:native("Obj") function obj(): (go.Pointer<go.go.types.TypeName>);
    @:native("Origin") function origin(): (go.Pointer<go.go.types.Alias>);
    @:native("Rhs") function rhs(): (go.go.types.Type);
    @:native("SetTypeParams") function setTypeParams(tparams: go.Slice<go.Pointer<go.go.types.TypeParam>>): Void;
    @:native("String") function string(): (String);
    @:native("TypeArgs") function typeArgs(): (go.Pointer<go.go.types.TypeList>);
    @:native("TypeParams") function typeParams(): (go.Pointer<go.go.types.TypeParamList>);
    @:native("Underlying") function underlying(): (go.go.types.Type);

}