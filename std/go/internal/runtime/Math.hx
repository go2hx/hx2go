package go.internal.runtime;

@:go.Type({ name: "math", instanceName: "math.math", imports: ["internal/runtime/math"] })
extern class Math {

    @:native("MaxInt64") static var MaxInt64: go.Int64;
    @:native("MaxUint16") static var MaxUint16: go.UInt16;
    @:native("MaxUint32") static var MaxUint32: go.UInt32;
    @:native("MaxUint64") static var MaxUint64: go.UInt64;
    @:native("MaxUintptr") static var MaxUintptr: go.UIntPtr;

    @:go.Tuple("sum", "carryOut") @:native("Add64") static function add64(x: go.UInt64, y: go.UInt64, carry: go.UInt64): go.Tuple<{ sum: go.UInt64, carryOut: go.UInt64 }>;
    @:go.Tuple("hi", "lo") @:native("Mul64") static function mul64(x: go.UInt64, y: go.UInt64): go.Tuple<{ hi: go.UInt64, lo: go.UInt64 }>;
    @:go.Tuple("p0", "p1") @:native("MulUintptr") static function mulUintptr(a: go.UIntPtr, b: go.UIntPtr): go.Tuple<{ p0: go.UIntPtr, p1: Bool }>;

}