package go.math.big.internal.asmgen;

@:structInit
@:go.Type({ name: "Reg", instanceName: "asmgen.Reg", imports: ["math/big/internal/asmgen"] })
extern class Reg {

    @:native("IsImm") function isImm(): Bool;
    @:native("IsMem") function isMem(): Bool;
    @:native("String") function string(): String;
    @:native("Valid") function valid(): Bool;

}