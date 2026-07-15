package go.crypto;

@:go.Type({ name: "mlkem", instanceName: "mlkem.mlkem", imports: ["crypto/mlkem"] })
extern class Mlkem {

    @:native("CiphertextSize1024") static var CiphertextSize1024: go.GoInt;
    @:native("CiphertextSize768") static var CiphertextSize768: go.GoInt;
    @:native("EncapsulationKeySize1024") static var EncapsulationKeySize1024: go.GoInt;
    @:native("EncapsulationKeySize768") static var EncapsulationKeySize768: go.GoInt;
    @:native("SeedSize") static var SeedSize: go.GoInt;
    @:native("SharedKeySize") static var SharedKeySize: go.GoInt;

    @:native("GenerateKey1024") static function generateKey1024(): go.Result<go.Pointer<go.crypto.mlkem.DecapsulationKey1024>>;
    @:native("GenerateKey768") static function generateKey768(): go.Result<go.Pointer<go.crypto.mlkem.DecapsulationKey768>>;
    @:native("NewDecapsulationKey1024") static function newDecapsulationKey1024(seed: go.Slice<go.Byte>): go.Result<go.Pointer<go.crypto.mlkem.DecapsulationKey1024>>;
    @:native("NewDecapsulationKey768") static function newDecapsulationKey768(seed: go.Slice<go.Byte>): go.Result<go.Pointer<go.crypto.mlkem.DecapsulationKey768>>;
    @:native("NewEncapsulationKey1024") static function newEncapsulationKey1024(encapsulationKey: go.Slice<go.Byte>): go.Result<go.Pointer<go.crypto.mlkem.EncapsulationKey1024>>;
    @:native("NewEncapsulationKey768") static function newEncapsulationKey768(encapsulationKey: go.Slice<go.Byte>): go.Result<go.Pointer<go.crypto.mlkem.EncapsulationKey768>>;

}