package go.crypto.internal.fips140;

@:go.Type({ name: "mlkem", instanceName: "mlkem.mlkem", imports: ["crypto/internal/fips140/mlkem"] })
extern class Mlkem {

    @:native("CiphertextSize1024") static var CiphertextSize1024: go.GoInt;
    @:native("CiphertextSize768") static var CiphertextSize768: go.GoInt;
    @:native("EncapsulationKeySize1024") static var EncapsulationKeySize1024: go.GoInt;
    @:native("EncapsulationKeySize768") static var EncapsulationKeySize768: go.GoInt;
    @:native("SeedSize") static var SeedSize: go.GoInt;
    @:native("SharedKeySize") static var SharedKeySize: go.GoInt;

    @:native("GenerateKey1024") static function generateKey1024(): go.Result<go.Pointer<go.crypto.internal.fips140.mlkem.DecapsulationKey1024>>;
    @:native("GenerateKey768") static function generateKey768(): go.Result<go.Pointer<go.crypto.internal.fips140.mlkem.DecapsulationKey768>>;
    @:native("GenerateKeyInternal1024") static function generateKeyInternal1024(d: go.Pointer<go.GoArray<go.Byte, 32>>, z: go.Pointer<go.GoArray<go.Byte, 32>>): go.Pointer<go.crypto.internal.fips140.mlkem.DecapsulationKey1024>;
    @:native("GenerateKeyInternal768") static function generateKeyInternal768(d: go.Pointer<go.GoArray<go.Byte, 32>>, z: go.Pointer<go.GoArray<go.Byte, 32>>): go.Pointer<go.crypto.internal.fips140.mlkem.DecapsulationKey768>;
    @:native("NewDecapsulationKey1024") static function newDecapsulationKey1024(seed: go.Slice<go.Byte>): go.Result<go.Pointer<go.crypto.internal.fips140.mlkem.DecapsulationKey1024>>;
    @:native("NewDecapsulationKey768") static function newDecapsulationKey768(seed: go.Slice<go.Byte>): go.Result<go.Pointer<go.crypto.internal.fips140.mlkem.DecapsulationKey768>>;
    @:native("NewEncapsulationKey1024") static function newEncapsulationKey1024(encapsulationKey: go.Slice<go.Byte>): go.Result<go.Pointer<go.crypto.internal.fips140.mlkem.EncapsulationKey1024>>;
    @:native("NewEncapsulationKey768") static function newEncapsulationKey768(encapsulationKey: go.Slice<go.Byte>): go.Result<go.Pointer<go.crypto.internal.fips140.mlkem.EncapsulationKey768>>;
    @:native("TestingOnlyExpandedBytes1024") static function testingOnlyExpandedBytes1024(dk: go.Pointer<go.crypto.internal.fips140.mlkem.DecapsulationKey1024>): go.Slice<go.Byte>;
    @:native("TestingOnlyExpandedBytes768") static function testingOnlyExpandedBytes768(dk: go.Pointer<go.crypto.internal.fips140.mlkem.DecapsulationKey768>): go.Slice<go.Byte>;
    @:native("TestingOnlyNewDecapsulationKey1024") static function testingOnlyNewDecapsulationKey1024(b: go.Slice<go.Byte>): go.Result<go.Pointer<go.crypto.internal.fips140.mlkem.DecapsulationKey1024>>;
    @:native("TestingOnlyNewDecapsulationKey768") static function testingOnlyNewDecapsulationKey768(b: go.Slice<go.Byte>): go.Result<go.Pointer<go.crypto.internal.fips140.mlkem.DecapsulationKey768>>;

}