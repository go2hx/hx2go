package go.math.big;

@:structInit
@:go.Type({ name: "decimal", instanceName: "big.decimal", imports: ["math/big"] })
extern class Decimal {

    @:native("String") function string(): (String);

}