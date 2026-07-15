package go.go.types;

@:structInit
@:go.Type({ name: "Signature", instanceName: "types.Signature", imports: ["go/types"] })
extern class Signature {

    @:native("Params") function params(): go.Pointer<go.go.types.Tuple>;
    @:native("Recv") function recv(): go.Pointer<go.go.types.Var>;
    @:native("RecvTypeParams") function recvTypeParams(): go.Pointer<go.go.types.TypeParamList>;
    @:native("Results") function results(): go.Pointer<go.go.types.Tuple>;
    @:native("String") function string(): String;
    @:native("TypeParams") function typeParams(): go.Pointer<go.go.types.TypeParamList>;
    @:native("Underlying") function underlying(): go.go.types.Type;
    @:native("Variadic") function variadic(): Bool;

}