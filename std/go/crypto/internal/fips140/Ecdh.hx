package go.crypto.internal.fips140;

@:go.Type({ name: "ecdh", instanceName: "ecdh.ecdh", imports: ["crypto/internal/fips140/ecdh"] })
extern class Ecdh {

    @:native("ECDH") static function ECDH<P: go.crypto.internal.fips140.ecdh.Point<P>>(c: go.Pointer<go.crypto.internal.fips140.ecdh.Curve<P>>, k: go.Pointer<go.crypto.internal.fips140.ecdh.PrivateKey>, peer: go.Pointer<go.crypto.internal.fips140.ecdh.PublicKey>): go.Result<go.Slice<go.Byte>>;
    @:native("GenerateKey") static function generateKey<P: go.crypto.internal.fips140.ecdh.Point<P>>(c: go.Pointer<go.crypto.internal.fips140.ecdh.Curve<P>>, rand: go.io.Reader): go.Result<go.Pointer<go.crypto.internal.fips140.ecdh.PrivateKey>>;
    @:native("NewPrivateKey") static function newPrivateKey<P: go.crypto.internal.fips140.ecdh.Point<P>>(c: go.Pointer<go.crypto.internal.fips140.ecdh.Curve<P>>, key: go.Slice<go.Byte>): go.Result<go.Pointer<go.crypto.internal.fips140.ecdh.PrivateKey>>;
    @:native("NewPublicKey") static function newPublicKey<P: go.crypto.internal.fips140.ecdh.Point<P>>(c: go.Pointer<go.crypto.internal.fips140.ecdh.Curve<P>>, key: go.Slice<go.Byte>): go.Result<go.Pointer<go.crypto.internal.fips140.ecdh.PublicKey>>;
    @:native("P224") static function P224(): go.Pointer<go.crypto.internal.fips140.ecdh.Curve<go.Pointer<go.crypto.internal.fips140.nistec.P224Point>>>;
    @:native("P256") static function P256(): go.Pointer<go.crypto.internal.fips140.ecdh.Curve<go.Pointer<go.crypto.internal.fips140.nistec.P256Point>>>;
    @:native("P384") static function P384(): go.Pointer<go.crypto.internal.fips140.ecdh.Curve<go.Pointer<go.crypto.internal.fips140.nistec.P384Point>>>;
    @:native("P521") static function P521(): go.Pointer<go.crypto.internal.fips140.ecdh.Curve<go.Pointer<go.crypto.internal.fips140.nistec.P521Point>>>;

}