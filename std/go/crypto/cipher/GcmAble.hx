package go.crypto.cipher;

@:go.Type({ name: "gcmAble", instanceName: "cipher.gcmAble", imports: ["crypto/cipher"] })
extern typedef GcmAble = {

    @:native("NewGCM") function newGCM(nonceSize: go.GoInt, tagSize: go.GoInt): (go.Result<go.crypto.cipher.AEAD>);

}