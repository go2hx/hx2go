package go.math.big;

@:structInit
@:go.Type({ name: "ErrNaN", instanceName: "big.ErrNaN", imports: ["math/big"] })
extern class ErrNaN {

    @:native("Error") function error(): (String);

}