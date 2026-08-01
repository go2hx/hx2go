package go.crypto.tls;

@:structInit
@:go.Type({ name: "echCipher", instanceName: "tls.echCipher", imports: ["crypto/tls"] })
extern class EchCipher {

    @:native("KDFID") var KDFID: go.UInt16;
    @:native("AEADID") var AEADID: go.UInt16;

    function new(KDFID: go.UInt16, AEADID: go.UInt16);

}