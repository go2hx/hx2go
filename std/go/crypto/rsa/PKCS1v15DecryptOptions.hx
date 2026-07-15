package go.crypto.rsa;

@:structInit
@:go.Type({ name: "PKCS1v15DecryptOptions", instanceName: "rsa.PKCS1v15DecryptOptions", imports: ["crypto/rsa"] })
extern class PKCS1v15DecryptOptions {

    @:native("SessionKeyLen") var sessionKeyLen: go.GoInt;

function new(sessionKeyLen: go.GoInt);

}