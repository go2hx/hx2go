package go.crypto.internal;

@:go.Type({ name: "cryptotest", instanceName: "cryptotest.cryptotest", imports: ["crypto/internal/cryptotest"] })
extern class Cryptotest {

    @:native("FetchModule") static function fetchModule(t: go.Pointer<go.testing.T>, module: String, version: String): String;
    @:native("MustSupportFIPS140") static function mustSupportFIPS140(t: go.Pointer<go.testing.T>): Void;
    @:native("NoExtraMethods") static function noExtraMethods(t: go.Pointer<go.testing.T>, ms: Dynamic, allowed: haxe.Rest<String>): Void;
    @:native("SkipTestAllocations") static function skipTestAllocations(t: go.Pointer<go.testing.T>): Void;
    @:native("TestAEAD") static function testAEAD(t: go.Pointer<go.testing.T>, mAEAD: go.crypto.internal.cryptotest.MakeAEAD): Void;
    @:native("TestAllImplementations") static function testAllImplementations(t: go.Pointer<go.testing.T>, pkg: String, f: (t: go.Pointer<go.testing.T>) -> Void): Void;
    @:native("TestBlock") static function testBlock(t: go.Pointer<go.testing.T>, keySize: go.GoInt, mb: go.crypto.internal.cryptotest.MakeBlock): Void;
    @:native("TestBlockMode") static function testBlockMode(t: go.Pointer<go.testing.T>, block: go.crypto.cipher.Block, makeEncrypter: go.crypto.internal.cryptotest.MakeBlockMode, makeDecrypter: go.crypto.internal.cryptotest.MakeBlockMode): Void;
    @:native("TestHash") static function testHash(t: go.Pointer<go.testing.T>, mh: go.crypto.internal.cryptotest.MakeHash): Void;
    @:native("TestStream") static function testStream(t: go.Pointer<go.testing.T>, ms: go.crypto.internal.cryptotest.MakeStream): Void;
    @:native("TestStreamFromBlock") static function testStreamFromBlock(t: go.Pointer<go.testing.T>, block: go.crypto.cipher.Block, blockMode: (b: go.crypto.cipher.Block, iv: go.Slice<go.Byte>) -> go.crypto.cipher.Stream): Void;

}