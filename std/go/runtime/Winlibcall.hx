package go.runtime;

@:structInit
@:go.Type({ name: "winlibcall", instanceName: "runtime.winlibcall", imports: ["runtime"] })
extern class Winlibcall {

    @:native("Fn") var fn: go.UIntPtr;
    @:native("N") var N: go.UIntPtr;
    @:native("Args") var args: go.UIntPtr;
    @:native("R1") var R1: go.UIntPtr;
    @:native("R2") var R2: go.UIntPtr;
    @:native("Err") var err: go.UIntPtr;

    function new(fn: go.UIntPtr=0, N: go.UIntPtr=0, args: go.UIntPtr=0, R1: go.UIntPtr=0, R2: go.UIntPtr=0, err: go.UIntPtr=0);

}