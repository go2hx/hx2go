package go.crypto.rsa;

@:structInit
@:go.Type({ name: "OAEPOptions", instanceName: "rsa.OAEPOptions", imports: ["crypto/rsa"] })
extern class OAEPOptions {

    @:native("Hash") var hash: go.crypto.Hash;
    @:native("MGFHash") var mGFHash: go.crypto.Hash;
    @:native("Label") var label: go.Slice<go.Byte>;

function new(hash: go.crypto.Hash, mGFHash: go.crypto.Hash, label: go.Slice<go.Byte>);

}