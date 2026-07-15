package go.crypto;

@:go.Type({ name: "hpke", instanceName: "hpke.hpke", imports: ["crypto/hpke"] })
extern class Hpke {

    @:native("AES128GCM") static function AES128GCM(): go.crypto.hpke.AEAD;
    @:native("AES256GCM") static function AES256GCM(): go.crypto.hpke.AEAD;
    @:native("ChaCha20Poly1305") static function chaCha20Poly1305(): go.crypto.hpke.AEAD;
    @:native("DHKEM") static function DHKEM(curve: go.crypto.ecdh.Curve): go.crypto.hpke.KEM;
    @:native("ExportOnly") static function exportOnly(): go.crypto.hpke.AEAD;
    @:native("HKDFSHA256") static function HKDFSHA256(): go.crypto.hpke.KDF;
    @:native("HKDFSHA384") static function HKDFSHA384(): go.crypto.hpke.KDF;
    @:native("HKDFSHA512") static function HKDFSHA512(): go.crypto.hpke.KDF;
    @:native("MLKEM1024") static function MLKEM1024(): go.crypto.hpke.KEM;
    @:native("MLKEM1024P384") static function MLKEM1024P384(): go.crypto.hpke.KEM;
    @:native("MLKEM768") static function MLKEM768(): go.crypto.hpke.KEM;
    @:native("MLKEM768P256") static function MLKEM768P256(): go.crypto.hpke.KEM;
    @:native("MLKEM768X25519") static function MLKEM768X25519(): go.crypto.hpke.KEM;
    @:native("NewAEAD") static function newAEAD(id: go.UInt16): go.Result<go.crypto.hpke.AEAD>;
    @:native("NewDHKEMPrivateKey") static function newDHKEMPrivateKey(priv: go.crypto.ecdh.KeyExchanger): go.Result<go.crypto.hpke.PrivateKey>;
    @:native("NewDHKEMPublicKey") static function newDHKEMPublicKey(pub: go.Pointer<go.crypto.ecdh.PublicKey>): go.Result<go.crypto.hpke.PublicKey>;
    @:native("NewHybridPrivateKey") static function newHybridPrivateKey(pq: go.crypto.Decapsulator, t: go.crypto.ecdh.KeyExchanger): go.Result<go.crypto.hpke.PrivateKey>;
    @:native("NewHybridPublicKey") static function newHybridPublicKey(pq: go.crypto.Encapsulator, t: go.Pointer<go.crypto.ecdh.PublicKey>): go.Result<go.crypto.hpke.PublicKey>;
    @:native("NewKDF") static function newKDF(id: go.UInt16): go.Result<go.crypto.hpke.KDF>;
    @:native("NewKEM") static function newKEM(id: go.UInt16): go.Result<go.crypto.hpke.KEM>;
    @:native("NewMLKEMPrivateKey") static function newMLKEMPrivateKey(priv: go.crypto.Decapsulator): go.Result<go.crypto.hpke.PrivateKey>;
    @:native("NewMLKEMPublicKey") static function newMLKEMPublicKey(pub: go.crypto.Encapsulator): go.Result<go.crypto.hpke.PublicKey>;
    @:native("NewRecipient") static function newRecipient(enc: go.Slice<go.Byte>, k: go.crypto.hpke.PrivateKey, kdf: go.crypto.hpke.KDF, aead: go.crypto.hpke.AEAD, info: go.Slice<go.Byte>): go.Result<go.Pointer<go.crypto.hpke.Recipient>>;
    @:go.Tuple("enc", "s", "err") @:native("NewSender") static function newSender(pk: go.crypto.hpke.PublicKey, kdf: go.crypto.hpke.KDF, aead: go.crypto.hpke.AEAD, info: go.Slice<go.Byte>): go.Tuple<{ enc: go.Slice<go.Byte>, s: go.Pointer<go.crypto.hpke.Sender>, err: go.Error }>;
    @:native("Open") static function open(k: go.crypto.hpke.PrivateKey, kdf: go.crypto.hpke.KDF, aead: go.crypto.hpke.AEAD, info: go.Slice<go.Byte>, ciphertext: go.Slice<go.Byte>): go.Result<go.Slice<go.Byte>>;
    @:native("SHAKE128") static function SHAKE128(): go.crypto.hpke.KDF;
    @:native("SHAKE256") static function SHAKE256(): go.crypto.hpke.KDF;
    @:native("Seal") static function seal(pk: go.crypto.hpke.PublicKey, kdf: go.crypto.hpke.KDF, aead: go.crypto.hpke.AEAD, info: go.Slice<go.Byte>, plaintext: go.Slice<go.Byte>): go.Result<go.Slice<go.Byte>>;

}