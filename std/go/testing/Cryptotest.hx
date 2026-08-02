package go.testing;

@:go.Type({ name: "cryptotest", instanceName: "cryptotest.cryptotest", imports: ["testing/cryptotest"] })
extern class Cryptotest {

    @:native("SetGlobalRandom") static function setGlobalRandom(t: go.Pointer<go.testing.T>, seed: go.UInt64): Void;

}