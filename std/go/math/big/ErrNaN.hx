package go.math.big;

/**
    An ErrNaN panic is raised by a [Float] operation that would lead to
    a NaN under IEEE 754 rules. An ErrNaN implements the error interface.
**/
@:structInit
@:go.Type({ name: "ErrNaN", instanceName: "big.ErrNaN", imports: ["math/big"] })
extern class ErrNaN {

    @:native("Error") function error(): (String);

}