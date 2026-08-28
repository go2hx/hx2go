package go.crypto.rsa;

/**
    OAEPOptions allows passing options to OAEP encryption and decryption
    through the [PrivateKey.Decrypt] and [EncryptOAEPWithOptions] functions.
**/
@:structInit
@:go.Type({ name: "OAEPOptions", instanceName: "rsa.OAEPOptions", imports: ["crypto/rsa"] })
extern class OAEPOptions {

    @:native("Hash") var hash: go.crypto.Hash;
    @:native("MGFHash") var mGFHash: go.crypto.Hash;
    @:native("Label") var label: go.Slice<go.Byte>;

    function new(hash: go.crypto.Hash=cast 0, mGFHash: go.crypto.Hash=cast 0, label: go.Slice<go.Byte>=null);

}