package go.crypto.internal.fips140.ecdh;

@:go.Type({ name: "Point", instanceName: "ecdh.Point", imports: ["crypto/internal/fips140/ecdh"] })
extern typedef Point = {

    @:native("Bytes") function bytes(): go.Slice<go.Byte>;
    @:native("BytesX") function bytesX(): go.Result<go.Slice<go.Byte>>;
    @:native("ScalarBaseMult") function scalarBaseMult(p0: go.Slice<go.Byte>): go.Result<P>;
    @:native("ScalarMult") function scalarMult(p0: P, p1: go.Slice<go.Byte>): go.Result<P>;
    @:native("SetBytes") function setBytes(p0: go.Slice<go.Byte>): go.Result<P>;

}