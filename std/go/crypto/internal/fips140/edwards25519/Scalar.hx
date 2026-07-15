package go.crypto.internal.fips140.edwards25519;

@:structInit
@:go.Type({ name: "Scalar", instanceName: "edwards25519.Scalar", imports: ["crypto/internal/fips140/edwards25519"] })
extern class Scalar {

    @:native("Add") function add(x: go.Pointer<go.crypto.internal.fips140.edwards25519.Scalar>, y: go.Pointer<go.crypto.internal.fips140.edwards25519.Scalar>): go.Pointer<go.crypto.internal.fips140.edwards25519.Scalar>;
    @:native("Bytes") function bytes(): go.Slice<go.Byte>;
    @:native("Equal") function equal(t: go.Pointer<go.crypto.internal.fips140.edwards25519.Scalar>): go.GoInt;
    @:native("Multiply") function multiply(x: go.Pointer<go.crypto.internal.fips140.edwards25519.Scalar>, y: go.Pointer<go.crypto.internal.fips140.edwards25519.Scalar>): go.Pointer<go.crypto.internal.fips140.edwards25519.Scalar>;
    @:native("MultiplyAdd") function multiplyAdd(x: go.Pointer<go.crypto.internal.fips140.edwards25519.Scalar>, y: go.Pointer<go.crypto.internal.fips140.edwards25519.Scalar>, z: go.Pointer<go.crypto.internal.fips140.edwards25519.Scalar>): go.Pointer<go.crypto.internal.fips140.edwards25519.Scalar>;
    @:native("Negate") function negate(x: go.Pointer<go.crypto.internal.fips140.edwards25519.Scalar>): go.Pointer<go.crypto.internal.fips140.edwards25519.Scalar>;
    @:native("Set") function set(x: go.Pointer<go.crypto.internal.fips140.edwards25519.Scalar>): go.Pointer<go.crypto.internal.fips140.edwards25519.Scalar>;
    @:native("SetBytesWithClamping") function setBytesWithClamping(x: go.Slice<go.Byte>): go.Result<go.Pointer<go.crypto.internal.fips140.edwards25519.Scalar>>;
    @:native("SetCanonicalBytes") function setCanonicalBytes(x: go.Slice<go.Byte>): go.Result<go.Pointer<go.crypto.internal.fips140.edwards25519.Scalar>>;
    @:native("SetUniformBytes") function setUniformBytes(x: go.Slice<go.Byte>): go.Result<go.Pointer<go.crypto.internal.fips140.edwards25519.Scalar>>;
    @:native("Subtract") function subtract(x: go.Pointer<go.crypto.internal.fips140.edwards25519.Scalar>, y: go.Pointer<go.crypto.internal.fips140.edwards25519.Scalar>): go.Pointer<go.crypto.internal.fips140.edwards25519.Scalar>;

}