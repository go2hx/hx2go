package go.crypto.tls;

@:structInit
@:go.Type({ name: "echConfig", instanceName: "tls.echConfig", imports: ["crypto/tls"] })
extern class EchConfig {

    @:native("Version") var version: go.UInt16;
    @:native("Length") var length: go.UInt16;
    @:native("ConfigID") var configID: go.UInt8;
    @:native("KemID") var kemID: go.UInt16;
    @:native("PublicKey") var publicKey: go.Slice<go.Byte>;
    @:native("SymmetricCipherSuite") var symmetricCipherSuite: go.Slice<go.crypto.tls.EchCipher>;
    @:native("MaxNameLength") var maxNameLength: go.UInt8;
    @:native("PublicName") var publicName: go.Slice<go.Byte>;
    @:native("Extensions") var extensions: go.Slice<go.crypto.tls.EchExtension>;

    function new(version: go.UInt16=0, length: go.UInt16=0, configID: go.UInt8=0, kemID: go.UInt16=0, publicKey: go.Slice<go.Byte>=null, symmetricCipherSuite: go.Slice<go.crypto.tls.EchCipher>=null, maxNameLength: go.UInt8=0, publicName: go.Slice<go.Byte>=null, extensions: go.Slice<go.crypto.tls.EchExtension>=null);

}