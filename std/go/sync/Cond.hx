package go.sync;

@:structInit
@:go.Type({ name: "Cond", instanceName: "sync.Cond", imports: ["sync"] })
extern class Cond {

    @:native("L") var L: go.sync.Locker;

    function new(L: go.sync.Locker);

    @:native("Broadcast") function broadcast(): Void;
    @:native("Signal") function signal(): Void;
    @:native("Wait") function wait(): Void;

}