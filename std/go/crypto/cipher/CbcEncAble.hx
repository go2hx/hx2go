package go.crypto.cipher;

@:go.Type({ name: "cbcEncAble", instanceName: "cipher.cbcEncAble", imports: ["crypto/cipher"] })
extern typedef CbcEncAble = {

    @:native("NewCBCEncrypter") function newCBCEncrypter(iv: go.Slice<go.Byte>): (go.crypto.cipher.BlockMode);

}