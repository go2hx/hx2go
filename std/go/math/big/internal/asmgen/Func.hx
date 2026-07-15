package go.math.big.internal.asmgen;

@:structInit
@:go.Type({ name: "Func", instanceName: "asmgen.Func", imports: ["math/big/internal/asmgen"] })
extern class Func {

    @:native("Name") var name: String;
    @:native("Asm") var asm: go.Pointer<go.math.big.internal.asmgen.Asm>;

function new(name: String, asm: go.Pointer<go.math.big.internal.asmgen.Asm>);

    @:native("Arg") function arg(name: String): go.math.big.internal.asmgen.Reg;
    @:native("ArgHint") function argHint(name: String, hint: go.math.big.internal.asmgen.Hint): go.math.big.internal.asmgen.Reg;
    @:native("ArgPtr") function argPtr(name: String): go.math.big.internal.asmgen.RegPtr;
    @:native("Pipe") function pipe(): go.Pointer<go.math.big.internal.asmgen.Pipe>;
    @:native("StoreArg") function storeArg(src: go.math.big.internal.asmgen.Reg, name: String): Void;

}