package go.crypto.tls;

@:go.Type({ name: "transcriptHash", instanceName: "tls.transcriptHash", imports: ["crypto/tls"] })
extern typedef TranscriptHash = {

    @:native("Write") function write(p0: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}