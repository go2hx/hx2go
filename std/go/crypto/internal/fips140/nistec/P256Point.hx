package go.crypto.internal.fips140.nistec;

@:structInit
@:go.Type({ name: "P256Point", instanceName: "nistec.P256Point", imports: ["crypto/internal/fips140/nistec"] })
extern class P256Point {

    @:native("Add") function add(r1: go.Pointer<go.crypto.internal.fips140.nistec.P256Point>, r2: go.Pointer<go.crypto.internal.fips140.nistec.P256Point>): go.Pointer<go.crypto.internal.fips140.nistec.P256Point>;
    @:native("Bytes") function bytes(): go.Slice<go.Byte>;
    @:native("BytesCompressed") function bytesCompressed(): go.Slice<go.Byte>;
    @:native("BytesX") function bytesX(): go.Result<go.Slice<go.Byte>>;
    @:native("Double") function double(p: go.Pointer<go.crypto.internal.fips140.nistec.P256Point>): go.Pointer<go.crypto.internal.fips140.nistec.P256Point>;
    @:native("ScalarBaseMult") function scalarBaseMult(scalar: go.Slice<go.Byte>): go.Result<go.Pointer<go.crypto.internal.fips140.nistec.P256Point>>;
    @:native("ScalarMult") function scalarMult(q: go.Pointer<go.crypto.internal.fips140.nistec.P256Point>, scalar: go.Slice<go.Byte>): go.Result<go.Pointer<go.crypto.internal.fips140.nistec.P256Point>>;
    @:native("Select") function select(p1: go.Pointer<go.crypto.internal.fips140.nistec.P256Point>, p2: go.Pointer<go.crypto.internal.fips140.nistec.P256Point>, cond: go.GoInt): go.Pointer<go.crypto.internal.fips140.nistec.P256Point>;
    @:native("Set") function set(q: go.Pointer<go.crypto.internal.fips140.nistec.P256Point>): go.Pointer<go.crypto.internal.fips140.nistec.P256Point>;
    @:native("SetBytes") function setBytes(b: go.Slice<go.Byte>): go.Result<go.Pointer<go.crypto.internal.fips140.nistec.P256Point>>;
    @:native("SetGenerator") function setGenerator(): go.Pointer<go.crypto.internal.fips140.nistec.P256Point>;

}