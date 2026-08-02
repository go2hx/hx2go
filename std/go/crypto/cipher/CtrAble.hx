package go.crypto.cipher;

@:go.Type({ name: "ctrAble", instanceName: "cipher.ctrAble", imports: ["crypto/cipher"] })
extern typedef CtrAble = {

    @:native("NewCTR") function newCTR(iv: go.Slice<go.Byte>): (go.crypto.cipher.Stream);

}