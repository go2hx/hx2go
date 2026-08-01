package go.crypto.cipher;

@:go.Type({ name: "cbcDecAble", instanceName: "cipher.cbcDecAble", imports: ["crypto/cipher"] })
extern typedef CbcDecAble = {

    @:native("NewCBCDecrypter") function newCBCDecrypter(iv: go.Slice<go.Byte>): (go.crypto.cipher.BlockMode);

}