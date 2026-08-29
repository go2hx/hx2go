package go.go.types;

/**
    A Signature represents a (non-builtin) function or method type.
    The receiver is ignored when comparing signatures for identity.
**/
@:structInit
@:go.Type({ name: "Signature", instanceName: "types.Signature", imports: ["go/types"] })
extern class Signature {

    /**
        Params returns the parameters of signature s, or nil.
        See [NewSignatureType] for details of variadic functions.
    **/
    @:native("Params") function params(): (go.Pointer<go.go.types.Tuple>);
    /**
        Recv returns the receiver of signature s (if a method), or nil if a
        function. It is ignored when comparing signatures for identity.
        
        For an abstract method, Recv returns the enclosing interface either
        as a *[Named] or an *[Interface]. Due to embedding, an interface may
        contain methods whose receiver type is a different interface.
    **/
    @:native("Recv") function recv(): (go.Pointer<go.go.types.Var>);
    /**
        RecvTypeParams returns the receiver type parameters of signature s, or nil.
    **/
    @:native("RecvTypeParams") function recvTypeParams(): (go.Pointer<go.go.types.TypeParamList>);
    /**
        Results returns the results of signature s, or nil.
    **/
    @:native("Results") function results(): (go.Pointer<go.go.types.Tuple>);
    @:native("String") function string(): (std.String);
    /**
        TypeParams returns the type parameters of signature s, or nil.
    **/
    @:native("TypeParams") function typeParams(): (go.Pointer<go.go.types.TypeParamList>);
    @:native("Underlying") function underlying(): (go.go.types.Type);
    /**
        Variadic reports whether the signature s is variadic.
    **/
    @:native("Variadic") function variadic(): (Bool);

}