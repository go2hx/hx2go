package go.math;

@:go.Type({ name: "big", instanceName: "big.big", imports: ["math/big"] })
extern class Big {

    @:native("Above") static var above: go.math.big.Accuracy;
    @:native("AwayFromZero") static var awayFromZero: go.math.big.RoundingMode;
    @:native("Below") static var below: go.math.big.Accuracy;
    @:native("Exact") static var exact: go.math.big.Accuracy;
    @:native("MaxBase") static var maxBase: go.Rune;
    @:native("MaxExp") static var maxExp: go.GoInt;
    @:native("MaxPrec") static var maxPrec: go.GoInt;
    @:native("MinExp") static var minExp: go.GoInt;
    @:native("ToNearestAway") static var toNearestAway: go.math.big.RoundingMode;
    @:native("ToNearestEven") static var toNearestEven: go.math.big.RoundingMode;
    @:native("ToNegativeInf") static var toNegativeInf: go.math.big.RoundingMode;
    @:native("ToPositiveInf") static var toPositiveInf: go.math.big.RoundingMode;
    @:native("ToZero") static var toZero: go.math.big.RoundingMode;

    @:native("Jacobi") static function jacobi(x: go.Pointer<go.math.big.Int>, y: go.Pointer<go.math.big.Int>): (go.GoInt);
    @:native("NewFloat") static function newFloat(x: Float): (go.Pointer<go.math.big.Float>);
    @:native("NewInt") static function newInt(x: go.Int64): (go.Pointer<go.math.big.Int>);
    @:native("NewRat") static function newRat(a: go.Int64, b: go.Int64): (go.Pointer<go.math.big.Rat>);
    @:go.Tuple("f", "b", "err") @:native("ParseFloat") static function parseFloat(s: String, base: go.GoInt, prec: go.GoUInt, mode: go.math.big.RoundingMode): (go.Tuple<{ f: go.Pointer<go.math.big.Float>, b: go.GoInt, err: go.Error }>);

}