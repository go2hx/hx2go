package go.crypto.hpke;

@:structInit
@:go.Type({ name: "Recipient", instanceName: "hpke.Recipient", imports: ["crypto/hpke"] })
extern class Recipient {

    @:native("Export") function export(exporterContext: String, length: go.GoInt): go.Result<go.Slice<go.Byte>>;
    @:native("Open") function open(aad: go.Slice<go.Byte>, ciphertext: go.Slice<go.Byte>): go.Result<go.Slice<go.Byte>>;

}