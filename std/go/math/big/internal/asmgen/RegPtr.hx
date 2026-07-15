package go.math.big.internal.asmgen;

@:structInit
@:go.Type({ name: "RegPtr", instanceName: "asmgen.RegPtr", imports: ["math/big/internal/asmgen"] })
extern class RegPtr {

    @:native("String") function string(): String;
    @:native("Valid") function valid(): Bool;

}