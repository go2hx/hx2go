package go.go.types;

@:structInit
@:go.Type({ name: "Named", instanceName: "types.Named", imports: ["go/types"] })
extern class Named {

    @:native("AddMethod") function addMethod(m: go.Pointer<go.go.types.Func>): Void;
    @:native("Method") function method(i: go.GoInt): (go.Pointer<go.go.types.Func>);
    @:native("Methods") function methods(): (go.iter.Seq<go.Pointer<go.go.types.Func>>);
    @:native("NumMethods") function numMethods(): (go.GoInt);
    @:native("Obj") function obj(): (go.Pointer<go.go.types.TypeName>);
    @:native("Origin") function origin(): (go.Pointer<go.go.types.Named>);
    @:native("SetTypeParams") function setTypeParams(tparams: go.Slice<go.Pointer<go.go.types.TypeParam>>): Void;
    @:native("SetUnderlying") function setUnderlying(u: go.go.types.Type): Void;
    @:native("String") function string(): (String);
    @:native("TypeArgs") function typeArgs(): (go.Pointer<go.go.types.TypeList>);
    @:native("TypeParams") function typeParams(): (go.Pointer<go.go.types.TypeParamList>);
    @:native("Underlying") function underlying(): (go.go.types.Type);

}