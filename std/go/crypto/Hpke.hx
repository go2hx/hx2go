package go.crypto;

/**
    Package hpke implements Hybrid Public Key Encryption (HPKE) as defined in
    [RFC 9180].
    
    [RFC 9180]: https://www.rfc-editor.org/rfc/rfc9180.html
**/
@:go.Type({ name: "hpke", instanceName: "hpke.hpke", imports: ["crypto/hpke"] })
extern class Hpke {

    /**
        AES128GCM returns an AES-128-GCM AEAD implementation.
    **/
    @:native("AES128GCM") static function AES128GCM(): (go.crypto.hpke.AEAD);
    /**
        AES256GCM returns an AES-256-GCM AEAD implementation.
    **/
    @:native("AES256GCM") static function AES256GCM(): (go.crypto.hpke.AEAD);
    /**
        ChaCha20Poly1305 returns a ChaCha20Poly1305 AEAD implementation.
    **/
    @:native("ChaCha20Poly1305") static function chaCha20Poly1305(): (go.crypto.hpke.AEAD);
    /**
        DHKEM returns a KEM implementing one of
        
          - DHKEM(P-256, HKDF-SHA256)
          - DHKEM(P-384, HKDF-SHA384)
          - DHKEM(P-521, HKDF-SHA512)
          - DHKEM(X25519, HKDF-SHA256)
        
        depending on curve.
    **/
    @:native("DHKEM") static function DHKEM(curve: go.crypto.ecdh.Curve): (go.crypto.hpke.KEM);
    /**
        ExportOnly returns a placeholder AEAD implementation that cannot encrypt or
        decrypt, but only export secrets with [Sender.Export] or [Recipient.Export].
        
        When this is used, [Sender.Seal] and [Recipient.Open] return errors.
    **/
    @:native("ExportOnly") static function exportOnly(): (go.crypto.hpke.AEAD);
    /**
        HKDFSHA256 returns an HKDF-SHA256 KDF implementation.
    **/
    @:native("HKDFSHA256") static function HKDFSHA256(): (go.crypto.hpke.KDF);
    /**
        HKDFSHA384 returns an HKDF-SHA384 KDF implementation.
    **/
    @:native("HKDFSHA384") static function HKDFSHA384(): (go.crypto.hpke.KDF);
    /**
        HKDFSHA512 returns an HKDF-SHA512 KDF implementation.
    **/
    @:native("HKDFSHA512") static function HKDFSHA512(): (go.crypto.hpke.KDF);
    /**
        MLKEM1024 returns a KEM implementing ML-KEM-1024 from draft-ietf-hpke-pq.
    **/
    @:native("MLKEM1024") static function MLKEM1024(): (go.crypto.hpke.KEM);
    /**
        MLKEM1024P384 returns a KEM implementing MLKEM1024-P384 from draft-ietf-hpke-pq.
    **/
    @:native("MLKEM1024P384") static function MLKEM1024P384(): (go.crypto.hpke.KEM);
    /**
        MLKEM768 returns a KEM implementing ML-KEM-768 from draft-ietf-hpke-pq.
    **/
    @:native("MLKEM768") static function MLKEM768(): (go.crypto.hpke.KEM);
    /**
        MLKEM768P256 returns a KEM implementing MLKEM768-P256 from draft-ietf-hpke-pq.
    **/
    @:native("MLKEM768P256") static function MLKEM768P256(): (go.crypto.hpke.KEM);
    /**
        MLKEM768X25519 returns a KEM implementing MLKEM768-X25519 (a.k.a. X-Wing)
        from draft-ietf-hpke-pq.
    **/
    @:native("MLKEM768X25519") static function MLKEM768X25519(): (go.crypto.hpke.KEM);
    /**
        NewAEAD returns the AEAD implementation for the given AEAD ID.
        
        Applications are encouraged to use specific implementations like [AES128GCM]
        or [ChaCha20Poly1305] instead, unless runtime agility is required.
    **/
    @:native("NewAEAD") static function newAEAD(id: go.UInt16): (go.Result<go.crypto.hpke.AEAD>);
    /**
        NewDHKEMPrivateKey returns a PrivateKey implementing
        
          - DHKEM(P-256, HKDF-SHA256)
          - DHKEM(P-384, HKDF-SHA384)
          - DHKEM(P-521, HKDF-SHA512)
          - DHKEM(X25519, HKDF-SHA256)
        
        depending on the underlying curve of priv ([ecdh.X25519], [ecdh.P256],
        [ecdh.P384], or [ecdh.P521]).
        
        This function is meant for applications that already have an instantiated
        crypto/ecdh private key, or another implementation of a [ecdh.KeyExchanger]
        (e.g. a hardware key). Otherwise, applications should use the
        [KEM.NewPrivateKey] method of [DHKEM].
    **/
    @:native("NewDHKEMPrivateKey") static function newDHKEMPrivateKey(priv: go.crypto.ecdh.KeyExchanger): (go.Result<go.crypto.hpke.PrivateKey>);
    /**
        NewDHKEMPublicKey returns a PublicKey implementing
        
          - DHKEM(P-256, HKDF-SHA256)
          - DHKEM(P-384, HKDF-SHA384)
          - DHKEM(P-521, HKDF-SHA512)
          - DHKEM(X25519, HKDF-SHA256)
        
        depending on the underlying curve of pub ([ecdh.X25519], [ecdh.P256],
        [ecdh.P384], or [ecdh.P521]).
        
        This function is meant for applications that already have an instantiated
        crypto/ecdh public key. Otherwise, applications should use the
        [KEM.NewPublicKey] method of [DHKEM].
    **/
    @:native("NewDHKEMPublicKey") static function newDHKEMPublicKey(pub: go.Pointer<go.crypto.ecdh.PublicKey>): (go.Result<go.crypto.hpke.PublicKey>);
    /**
        NewHybridPrivateKey returns a PrivateKey implementing
        
          - MLKEM768-X25519 (a.k.a. X-Wing)
          - MLKEM768-P256
          - MLKEM1024-P384
        
        from draft-ietf-hpke-pq, depending on the underlying curve of t
        ([ecdh.X25519], [ecdh.P256], or [ecdh.P384]) and the type of pq.Encapsulator()
        (either *[mlkem.EncapsulationKey768] or *[mlkem.EncapsulationKey1024]).
        
        This function is meant for applications that already have instantiated
        crypto/ecdh and crypto/mlkem private keys, or another implementation of a
        [ecdh.KeyExchanger] and [crypto.Decapsulator] (e.g. a hardware key).
        Otherwise, applications should use the [KEM.NewPrivateKey] method of e.g.
        [MLKEM768X25519].
    **/
    @:native("NewHybridPrivateKey") static function newHybridPrivateKey(pq: go.crypto.Decapsulator, t: go.crypto.ecdh.KeyExchanger): (go.Result<go.crypto.hpke.PrivateKey>);
    /**
        NewHybridPublicKey returns a PublicKey implementing one of
        
          - MLKEM768-X25519 (a.k.a. X-Wing)
          - MLKEM768-P256
          - MLKEM1024-P384
        
        from draft-ietf-hpke-pq, depending on the underlying curve of t
        ([ecdh.X25519], [ecdh.P256], or [ecdh.P384]) and the type of pq (either
        *[mlkem.EncapsulationKey768] or *[mlkem.EncapsulationKey1024]).
        
        This function is meant for applications that already have instantiated
        crypto/ecdh and crypto/mlkem public keys. Otherwise, applications should use
        the [KEM.NewPublicKey] method of e.g. [MLKEM768X25519].
    **/
    @:native("NewHybridPublicKey") static function newHybridPublicKey(pq: go.crypto.Encapsulator, t: go.Pointer<go.crypto.ecdh.PublicKey>): (go.Result<go.crypto.hpke.PublicKey>);
    /**
        NewKDF returns the KDF implementation for the given KDF ID.
        
        Applications are encouraged to use specific implementations like [HKDFSHA256]
        instead, unless runtime agility is required.
    **/
    @:native("NewKDF") static function newKDF(id: go.UInt16): (go.Result<go.crypto.hpke.KDF>);
    /**
        NewKEM returns the KEM implementation for the given KEM ID.
        
        Applications are encouraged to use specific implementations like [DHKEM] or
        [MLKEM768X25519] instead, unless runtime agility is required.
    **/
    @:native("NewKEM") static function newKEM(id: go.UInt16): (go.Result<go.crypto.hpke.KEM>);
    /**
        NewMLKEMPrivateKey returns a KEMPrivateKey implementing
        
          - ML-KEM-768
          - ML-KEM-1024
        
        from draft-ietf-hpke-pq, depending on the type of priv.Encapsulator()
        (either *[mlkem.EncapsulationKey768] or *[mlkem.EncapsulationKey1024]).
        
        This function is meant for applications that already have an instantiated
        crypto/mlkem private key. Otherwise, applications should use the
        [KEM.NewPrivateKey] method of e.g. [MLKEM768].
    **/
    @:native("NewMLKEMPrivateKey") static function newMLKEMPrivateKey(priv: go.crypto.Decapsulator): (go.Result<go.crypto.hpke.PrivateKey>);
    /**
        NewMLKEMPublicKey returns a KEMPublicKey implementing
        
          - ML-KEM-768
          - ML-KEM-1024
        
        from draft-ietf-hpke-pq, depending on the type of pub
        (*[mlkem.EncapsulationKey768] or *[mlkem.EncapsulationKey1024]).
        
        This function is meant for applications that already have an instantiated
        crypto/mlkem public key. Otherwise, applications should use the
        [KEM.NewPublicKey] method of e.g. [MLKEM768].
    **/
    @:native("NewMLKEMPublicKey") static function newMLKEMPublicKey(pub: go.crypto.Encapsulator): (go.Result<go.crypto.hpke.PublicKey>);
    /**
        NewRecipient returns a receiving HPKE context for the provided KEM
        decapsulation key (i.e. the secret key), and using the ciphersuite defined by
        the combination of KEM, KDF, and AEAD.
        
        The enc parameter must have been produced by a matching sending HPKE context
        with the corresponding KEM encapsulation key. The info parameter is
        additional public information that must match between sender and recipient.
    **/
    @:native("NewRecipient") static function newRecipient(enc: go.Slice<go.Byte>, k: go.crypto.hpke.PrivateKey, kdf: go.crypto.hpke.KDF, aead: go.crypto.hpke.AEAD, info: go.Slice<go.Byte>): (go.Result<go.Pointer<go.crypto.hpke.Recipient>>);
    /**
        NewSender returns a sending HPKE context for the provided KEM encapsulation
        key (i.e. the public key), and using the ciphersuite defined by the
        combination of KEM, KDF, and AEAD.
        
        The info parameter is additional public information that must match between
        sender and recipient.
        
        The returned enc ciphertext can be used to instantiate a matching receiving
        HPKE context with the corresponding KEM decapsulation key.
    **/
    @:go.Tuple("enc", "s", "err") @:native("NewSender") static function newSender(pk: go.crypto.hpke.PublicKey, kdf: go.crypto.hpke.KDF, aead: go.crypto.hpke.AEAD, info: go.Slice<go.Byte>): (go.Tuple<{ enc: go.Slice<go.Byte>, s: go.Pointer<go.crypto.hpke.Sender>, err: go.Error }>);
    /**
        Open instantiates a single-use HPKE receiving HPKE context like [NewRecipient],
        and then decrypts the provided ciphertext like [Recipient.Open] (with no aad).
        ciphertext must be the concatenation of the encapsulated key and the actual ciphertext.
    **/
    @:native("Open") static function open(k: go.crypto.hpke.PrivateKey, kdf: go.crypto.hpke.KDF, aead: go.crypto.hpke.AEAD, info: go.Slice<go.Byte>, ciphertext: go.Slice<go.Byte>): (go.Result<go.Slice<go.Byte>>);
    /**
        SHAKE128 returns a SHAKE128 KDF implementation.
    **/
    @:native("SHAKE128") static function SHAKE128(): (go.crypto.hpke.KDF);
    /**
        SHAKE256 returns a SHAKE256 KDF implementation.
    **/
    @:native("SHAKE256") static function SHAKE256(): (go.crypto.hpke.KDF);
    /**
        Seal instantiates a single-use HPKE sending HPKE context like [NewSender],
        and then encrypts the provided plaintext like [Sender.Seal] (with no aad).
        Seal returns the concatenation of the encapsulated key and the ciphertext.
    **/
    @:native("Seal") static function seal(pk: go.crypto.hpke.PublicKey, kdf: go.crypto.hpke.KDF, aead: go.crypto.hpke.AEAD, info: go.Slice<go.Byte>, plaintext: go.Slice<go.Byte>): (go.Result<go.Slice<go.Byte>>);

}