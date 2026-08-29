package go.math.big;

/**
    Accuracy describes the rounding error produced by the most recent
    operation that generated a [Float] value, relative to the exact value.
**/
@:go.Type({ name: "Accuracy", instanceName: "big.Accuracy", imports: ["math/big"] })
extern typedef Accuracy = haxe.extern.EitherType<go.Int8, {
    @:native("String") function string(): (String);

}>