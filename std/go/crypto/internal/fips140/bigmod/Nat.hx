package go.crypto.internal.fips140.bigmod;

@:structInit
@:go.Type({ name: "Nat", instanceName: "bigmod.Nat", imports: ["crypto/internal/fips140/bigmod"] })
extern class Nat {

    @:native("Add") function add(y: go.Pointer<go.crypto.internal.fips140.bigmod.Nat>, m: go.Pointer<go.crypto.internal.fips140.bigmod.Modulus>): go.Pointer<go.crypto.internal.fips140.bigmod.Nat>;
    @:native("BitLenVarTime") function bitLenVarTime(): go.GoInt;
    @:native("Bits") function bits(): go.Slice<go.GoUInt>;
    @:native("Bytes") function bytes(m: go.Pointer<go.crypto.internal.fips140.bigmod.Modulus>): go.Slice<go.Byte>;
    @:native("DivShortVarTime") function divShortVarTime(y: go.GoUInt): go.GoUInt;
    @:native("Equal") function equal(y: go.Pointer<go.crypto.internal.fips140.bigmod.Nat>): go.crypto.internal.fips140.bigmod.choice;
    @:native("Exp") function exp(x: go.Pointer<go.crypto.internal.fips140.bigmod.Nat>, e: go.Slice<go.Byte>, m: go.Pointer<go.crypto.internal.fips140.bigmod.Modulus>): go.Pointer<go.crypto.internal.fips140.bigmod.Nat>;
    @:native("ExpShortVarTime") function expShortVarTime(x: go.Pointer<go.crypto.internal.fips140.bigmod.Nat>, e: go.GoUInt, m: go.Pointer<go.crypto.internal.fips140.bigmod.Modulus>): go.Pointer<go.crypto.internal.fips140.bigmod.Nat>;
    @:native("ExpandFor") function expandFor(m: go.Pointer<go.crypto.internal.fips140.bigmod.Modulus>): go.Pointer<go.crypto.internal.fips140.bigmod.Nat>;
    @:native("GCDVarTime") function gCDVarTime(a: go.Pointer<go.crypto.internal.fips140.bigmod.Nat>, b: go.Pointer<go.crypto.internal.fips140.bigmod.Nat>): go.Result<go.Pointer<go.crypto.internal.fips140.bigmod.Nat>>;
    @:go.Tuple("p0", "p1") @:native("InverseVarTime") function inverseVarTime(a: go.Pointer<go.crypto.internal.fips140.bigmod.Nat>, m: go.Pointer<go.crypto.internal.fips140.bigmod.Modulus>): go.Tuple<{ p0: go.Pointer<go.crypto.internal.fips140.bigmod.Nat>, p1: Bool }>;
    @:native("IsMinusOne") function isMinusOne(m: go.Pointer<go.crypto.internal.fips140.bigmod.Modulus>): go.crypto.internal.fips140.bigmod.choice;
    @:native("IsOdd") function isOdd(): go.crypto.internal.fips140.bigmod.choice;
    @:native("IsOne") function isOne(): go.crypto.internal.fips140.bigmod.choice;
    @:native("IsZero") function isZero(): go.crypto.internal.fips140.bigmod.choice;
    @:native("Mod") function mod(x: go.Pointer<go.crypto.internal.fips140.bigmod.Nat>, m: go.Pointer<go.crypto.internal.fips140.bigmod.Modulus>): go.Pointer<go.crypto.internal.fips140.bigmod.Nat>;
    @:native("Mul") function mul(y: go.Pointer<go.crypto.internal.fips140.bigmod.Nat>, m: go.Pointer<go.crypto.internal.fips140.bigmod.Modulus>): go.Pointer<go.crypto.internal.fips140.bigmod.Nat>;
    @:native("SetBytes") function setBytes(b: go.Slice<go.Byte>, m: go.Pointer<go.crypto.internal.fips140.bigmod.Modulus>): go.Result<go.Pointer<go.crypto.internal.fips140.bigmod.Nat>>;
    @:native("SetOverflowingBytes") function setOverflowingBytes(b: go.Slice<go.Byte>, m: go.Pointer<go.crypto.internal.fips140.bigmod.Modulus>): go.Result<go.Pointer<go.crypto.internal.fips140.bigmod.Nat>>;
    @:native("SetUint") function setUint(y: go.GoUInt): go.Pointer<go.crypto.internal.fips140.bigmod.Nat>;
    @:native("ShiftRightVarTime") function shiftRightVarTime(n: go.GoUInt): go.Pointer<go.crypto.internal.fips140.bigmod.Nat>;
    @:native("Sub") function sub(y: go.Pointer<go.crypto.internal.fips140.bigmod.Nat>, m: go.Pointer<go.crypto.internal.fips140.bigmod.Modulus>): go.Pointer<go.crypto.internal.fips140.bigmod.Nat>;
    @:native("SubOne") function subOne(m: go.Pointer<go.crypto.internal.fips140.bigmod.Modulus>): go.Pointer<go.crypto.internal.fips140.bigmod.Nat>;
    @:native("TrailingZeroBitsVarTime") function trailingZeroBitsVarTime(): go.GoUInt;

}