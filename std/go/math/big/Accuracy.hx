package go.math.big;

@:go.Type({ name: "Accuracy", instanceName: "big.Accuracy", imports: ["math/big"] })
extern typedef Accuracy = haxe.extern.EitherType<go.Int8, {
    @:native("String") function string(): (String);

}>