package go.math.big;

@:go.Type({ name: "nat", instanceName: "big.nat", imports: ["math/big"] })
extern class Nat {

    @:native("String") function string(): (String);

}