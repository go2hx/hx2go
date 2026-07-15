package go.internal.chacha8rand;

@:structInit
@:go.Type({ name: "State", instanceName: "chacha8rand.State", imports: ["internal/chacha8rand"] })
extern class State {

    @:native("Init") function init(seed: go.GoArray<go.Byte, 32>): Void;
    @:native("Init64") function init64(seed: go.GoArray<go.UInt64, 4>): Void;
    @:go.Tuple("p0", "p1") @:native("Next") function next(): go.Tuple<{ p0: go.UInt64, p1: Bool }>;
    @:native("Refill") function refill(): Void;
    @:native("Reseed") function reseed(): Void;

}