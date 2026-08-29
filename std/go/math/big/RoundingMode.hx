package go.math.big;

/**
    RoundingMode determines how a [Float] value is rounded to the
    desired precision. Rounding may change the [Float] value; the
    rounding error is described by the [Float]'s [Accuracy].
**/
@:go.Type({ name: "RoundingMode", instanceName: "big.RoundingMode", imports: ["math/big"] })
extern typedef RoundingMode = haxe.extern.EitherType<go.Byte, {
    @:native("String") function string(): (String);

}>