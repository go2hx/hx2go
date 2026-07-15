package go.crypto.internal.fips140.edwards25519.field;

@:structInit
@:go.Type({ name: "Element", instanceName: "field.Element", imports: ["crypto/internal/fips140/edwards25519/field"] })
extern class Element {

    @:native("Absolute") function absolute(u: go.Pointer<go.crypto.internal.fips140.edwards25519.field.Element>): go.Pointer<go.crypto.internal.fips140.edwards25519.field.Element>;
    @:native("Add") function add(a: go.Pointer<go.crypto.internal.fips140.edwards25519.field.Element>, b: go.Pointer<go.crypto.internal.fips140.edwards25519.field.Element>): go.Pointer<go.crypto.internal.fips140.edwards25519.field.Element>;
    @:native("Bytes") function bytes(): go.Slice<go.Byte>;
    @:native("Equal") function equal(u: go.Pointer<go.crypto.internal.fips140.edwards25519.field.Element>): go.GoInt;
    @:native("Invert") function invert(z: go.Pointer<go.crypto.internal.fips140.edwards25519.field.Element>): go.Pointer<go.crypto.internal.fips140.edwards25519.field.Element>;
    @:native("IsNegative") function isNegative(): go.GoInt;
    @:native("Mult32") function mult32(x: go.Pointer<go.crypto.internal.fips140.edwards25519.field.Element>, y: go.UInt32): go.Pointer<go.crypto.internal.fips140.edwards25519.field.Element>;
    @:native("Multiply") function multiply(x: go.Pointer<go.crypto.internal.fips140.edwards25519.field.Element>, y: go.Pointer<go.crypto.internal.fips140.edwards25519.field.Element>): go.Pointer<go.crypto.internal.fips140.edwards25519.field.Element>;
    @:native("Negate") function negate(a: go.Pointer<go.crypto.internal.fips140.edwards25519.field.Element>): go.Pointer<go.crypto.internal.fips140.edwards25519.field.Element>;
    @:native("One") function one(): go.Pointer<go.crypto.internal.fips140.edwards25519.field.Element>;
    @:native("Pow22523") function pow22523(x: go.Pointer<go.crypto.internal.fips140.edwards25519.field.Element>): go.Pointer<go.crypto.internal.fips140.edwards25519.field.Element>;
    @:native("Select") function select(a: go.Pointer<go.crypto.internal.fips140.edwards25519.field.Element>, b: go.Pointer<go.crypto.internal.fips140.edwards25519.field.Element>, cond: go.GoInt): go.Pointer<go.crypto.internal.fips140.edwards25519.field.Element>;
    @:native("Set") function set(a: go.Pointer<go.crypto.internal.fips140.edwards25519.field.Element>): go.Pointer<go.crypto.internal.fips140.edwards25519.field.Element>;
    @:native("SetBytes") function setBytes(x: go.Slice<go.Byte>): go.Result<go.Pointer<go.crypto.internal.fips140.edwards25519.field.Element>>;
    @:go.Tuple("R", "wasSquare") @:native("SqrtRatio") function sqrtRatio(u: go.Pointer<go.crypto.internal.fips140.edwards25519.field.Element>, v: go.Pointer<go.crypto.internal.fips140.edwards25519.field.Element>): go.Tuple<{ R: go.Pointer<go.crypto.internal.fips140.edwards25519.field.Element>, wasSquare: go.GoInt }>;
    @:native("Square") function square(x: go.Pointer<go.crypto.internal.fips140.edwards25519.field.Element>): go.Pointer<go.crypto.internal.fips140.edwards25519.field.Element>;
    @:native("Subtract") function subtract(a: go.Pointer<go.crypto.internal.fips140.edwards25519.field.Element>, b: go.Pointer<go.crypto.internal.fips140.edwards25519.field.Element>): go.Pointer<go.crypto.internal.fips140.edwards25519.field.Element>;
    @:native("Swap") function swap(u: go.Pointer<go.crypto.internal.fips140.edwards25519.field.Element>, cond: go.GoInt): Void;
    @:native("Zero") function zero(): go.Pointer<go.crypto.internal.fips140.edwards25519.field.Element>;

}