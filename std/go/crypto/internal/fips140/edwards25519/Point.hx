package go.crypto.internal.fips140.edwards25519;

@:structInit
@:go.Type({ name: "Point", instanceName: "edwards25519.Point", imports: ["crypto/internal/fips140/edwards25519"] })
extern class Point {

    @:native("Add") function add(p: go.Pointer<go.crypto.internal.fips140.edwards25519.Point>, q: go.Pointer<go.crypto.internal.fips140.edwards25519.Point>): go.Pointer<go.crypto.internal.fips140.edwards25519.Point>;
    @:native("Bytes") function bytes(): go.Slice<go.Byte>;
    @:native("Equal") function equal(u: go.Pointer<go.crypto.internal.fips140.edwards25519.Point>): go.GoInt;
    @:native("Negate") function negate(p: go.Pointer<go.crypto.internal.fips140.edwards25519.Point>): go.Pointer<go.crypto.internal.fips140.edwards25519.Point>;
    @:native("ScalarBaseMult") function scalarBaseMult(x: go.Pointer<go.crypto.internal.fips140.edwards25519.Scalar>): go.Pointer<go.crypto.internal.fips140.edwards25519.Point>;
    @:native("ScalarMult") function scalarMult(x: go.Pointer<go.crypto.internal.fips140.edwards25519.Scalar>, q: go.Pointer<go.crypto.internal.fips140.edwards25519.Point>): go.Pointer<go.crypto.internal.fips140.edwards25519.Point>;
    @:native("Set") function set(u: go.Pointer<go.crypto.internal.fips140.edwards25519.Point>): go.Pointer<go.crypto.internal.fips140.edwards25519.Point>;
    @:native("SetBytes") function setBytes(x: go.Slice<go.Byte>): go.Result<go.Pointer<go.crypto.internal.fips140.edwards25519.Point>>;
    @:native("Subtract") function subtract(p: go.Pointer<go.crypto.internal.fips140.edwards25519.Point>, q: go.Pointer<go.crypto.internal.fips140.edwards25519.Point>): go.Pointer<go.crypto.internal.fips140.edwards25519.Point>;
    @:native("VarTimeDoubleScalarBaseMult") function varTimeDoubleScalarBaseMult(a: go.Pointer<go.crypto.internal.fips140.edwards25519.Scalar>, A: go.Pointer<go.crypto.internal.fips140.edwards25519.Point>, b: go.Pointer<go.crypto.internal.fips140.edwards25519.Scalar>): go.Pointer<go.crypto.internal.fips140.edwards25519.Point>;

}