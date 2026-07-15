package go.crypto.internal.entropy.v1.0.0;

@:go.Type({ name: "entropy", instanceName: "v1.0.0.entropy", imports: ["crypto/internal/entropy/v1.0.0"] })
extern class Entropy {

    @:native("AdaptiveProportionTest") static function adaptiveProportionTest(samples: go.Slice<go.UInt8>): go.Error;
    @:native("RepetitionCountTest") static function repetitionCountTest(samples: go.Slice<go.UInt8>): go.Error;
    @:native("SHA384") static function SHA384(p: go.Pointer<go.GoArray<go.Byte, 1024>>): go.GoArray<go.Byte, 48>;
    @:native("Samples") static function samples(samples: go.Slice<go.UInt8>, memory: go.Pointer<go.crypto.internal.entropy.v1.0.0.ScratchBuffer>): go.Error;
    @:native("Seed") static function seed(memory: go.Pointer<go.crypto.internal.entropy.v1.0.0.ScratchBuffer>): go.Result<go.GoArray<go.Byte, 48>>;
    @:native("TestingOnlySHA384") static function testingOnlySHA384(p: go.Slice<go.Byte>): go.GoArray<go.Byte, 48>;
    @:native("Version") static function version(): String;

}