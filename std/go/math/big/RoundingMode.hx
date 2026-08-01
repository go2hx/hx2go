package go.math.big;

@:go.Type({ name: "RoundingMode", instanceName: "big.RoundingMode", imports: ["math/big"] })
extern typedef RoundingMode = haxe.extern.EitherType<go.Byte, {
    @:native("String") function string(): (String);

}>