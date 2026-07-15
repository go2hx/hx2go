package go.crypto.hpke;

@:structInit
@:go.Type({ name: "Sender", instanceName: "hpke.Sender", imports: ["crypto/hpke"] })
extern class Sender {

    @:native("Export") function export(exporterContext: String, length: go.GoInt): go.Result<go.Slice<go.Byte>>;
    @:native("Seal") function seal(aad: go.Slice<go.Byte>, plaintext: go.Slice<go.Byte>): go.Result<go.Slice<go.Byte>>;

}