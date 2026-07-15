package go.math.big.internal.asmgen;

@:structInit
@:go.Type({ name: "Pipe", instanceName: "asmgen.Pipe", imports: ["math/big/internal/asmgen"] })
extern class Pipe {

    @:native("AtUnrollEnd") function atUnrollEnd(end: () -> Void): Void;
    @:native("AtUnrollStart") function atUnrollStart(start: () -> Void): Void;
    @:native("Done") function done(): Void;
    @:native("DropInput") function dropInput(name: String): Void;
    @:native("LoadN") function loadN(n: go.GoInt): go.Slice<go.Slice<go.math.big.internal.asmgen.Reg>>;
    @:native("LoadPtrs") function loadPtrs(n: go.math.big.internal.asmgen.Reg): Void;
    @:native("Loop") function loop(block: (_in: go.Slice<go.Slice<go.math.big.internal.asmgen.Reg>>, out: go.Slice<go.Slice<go.math.big.internal.asmgen.Reg>>) -> Void): Void;
    @:native("Restart") function restart(n: go.math.big.internal.asmgen.Reg, factors: haxe.Rest<go.GoInt>): Void;
    @:native("SetBackward") function setBackward(): Void;
    @:native("SetHint") function setHint(name: String, hint: go.math.big.internal.asmgen.Hint): Void;
    @:native("SetLabel") function setLabel(label: String): Void;
    @:native("SetMaxColumns") function setMaxColumns(m: go.GoInt): Void;
    @:native("SetUseIndexCounter") function setUseIndexCounter(): Void;
    @:native("Start") function start(n: go.math.big.internal.asmgen.Reg, factors: haxe.Rest<go.GoInt>): Void;
    @:native("StoreN") function storeN(regs: go.Slice<go.Slice<go.math.big.internal.asmgen.Reg>>): Void;

}