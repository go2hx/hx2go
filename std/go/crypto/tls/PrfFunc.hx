package go.crypto.tls;

@:go.Type({ name: "prfFunc", instanceName: "tls.prfFunc", imports: ["crypto/tls"] })
extern typedef PrfFunc = (secret: go.Slice<go.Byte>, label: String, seed: go.Slice<go.Byte>, keyLen: go.GoInt) -> (go.Slice<go.Byte>)