package go.crypto;

@:go.Type({ name: "Decapsulator", instanceName: "crypto.Decapsulator", imports: ["crypto"] })
extern typedef Decapsulator = {

    @:native("Decapsulate") function decapsulate(ciphertext: go.Slice<go.Byte>): (go.Result<go.Slice<go.Byte>>);
    @:native("Encapsulator") function encapsulator(): (go.crypto.Encapsulator);

}