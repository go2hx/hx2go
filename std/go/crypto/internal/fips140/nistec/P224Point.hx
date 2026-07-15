package go.crypto.internal.fips140.nistec;

@:structInit
@:go.Type({ name: "P224Point", instanceName: "nistec.P224Point", imports: ["crypto/internal/fips140/nistec"] })
extern class P224Point {

    @:native("Add") function add(p1: go.Pointer<go.crypto.internal.fips140.nistec.P224Point>, p2: go.Pointer<go.crypto.internal.fips140.nistec.P224Point>): go.Pointer<go.crypto.internal.fips140.nistec.P224Point>;
    @:native("Bytes") function bytes(): go.Slice<go.Byte>;
    @:native("BytesCompressed") function bytesCompressed(): go.Slice<go.Byte>;
    @:native("BytesX") function bytesX(): go.Result<go.Slice<go.Byte>>;
    @:native("Double") function double(p: go.Pointer<go.crypto.internal.fips140.nistec.P224Point>): go.Pointer<go.crypto.internal.fips140.nistec.P224Point>;
    @:native("ScalarBaseMult") function scalarBaseMult(scalar: go.Slice<go.Byte>): go.Result<go.Pointer<go.crypto.internal.fips140.nistec.P224Point>>;
    @:native("ScalarMult") function scalarMult(q: go.Pointer<go.crypto.internal.fips140.nistec.P224Point>, scalar: go.Slice<go.Byte>): go.Result<go.Pointer<go.crypto.internal.fips140.nistec.P224Point>>;
    @:native("Select") function select(p1: go.Pointer<go.crypto.internal.fips140.nistec.P224Point>, p2: go.Pointer<go.crypto.internal.fips140.nistec.P224Point>, cond: go.GoInt): go.Pointer<go.crypto.internal.fips140.nistec.P224Point>;
    @:native("Set") function set(q: go.Pointer<go.crypto.internal.fips140.nistec.P224Point>): go.Pointer<go.crypto.internal.fips140.nistec.P224Point>;
    @:native("SetBytes") function setBytes(b: go.Slice<go.Byte>): go.Result<go.Pointer<go.crypto.internal.fips140.nistec.P224Point>>;
    @:native("SetGenerator") function setGenerator(): go.Pointer<go.crypto.internal.fips140.nistec.P224Point>;

}