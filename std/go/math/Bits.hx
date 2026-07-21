package go.math;

@:go.Type({ name: "bits", instanceName: "bits.bits", imports: ["math/bits"] })
extern class Bits {

    @:native("UintSize") static var UintSize: go.GoInt;

    @:go.Tuple("sum", "carryOut") @:native("Add") static function add(x: go.GoUInt, y: go.GoUInt, carry: go.GoUInt): (go.Tuple<{ sum: go.GoUInt, carryOut: go.GoUInt }>);
    @:go.Tuple("sum", "carryOut") @:native("Add32") static function add32(x: go.UInt32, y: go.UInt32, carry: go.UInt32): (go.Tuple<{ sum: go.UInt32, carryOut: go.UInt32 }>);
    @:go.Tuple("sum", "carryOut") @:native("Add64") static function add64(x: go.UInt64, y: go.UInt64, carry: go.UInt64): (go.Tuple<{ sum: go.UInt64, carryOut: go.UInt64 }>);
    @:go.Tuple("quo", "rem") @:native("Div") static function div(hi: go.GoUInt, lo: go.GoUInt, y: go.GoUInt): (go.Tuple<{ quo: go.GoUInt, rem: go.GoUInt }>);
    @:go.Tuple("quo", "rem") @:native("Div32") static function div32(hi: go.UInt32, lo: go.UInt32, y: go.UInt32): (go.Tuple<{ quo: go.UInt32, rem: go.UInt32 }>);
    @:go.Tuple("quo", "rem") @:native("Div64") static function div64(hi: go.UInt64, lo: go.UInt64, y: go.UInt64): (go.Tuple<{ quo: go.UInt64, rem: go.UInt64 }>);
    @:native("LeadingZeros") static function leadingZeros(x: go.GoUInt): (go.GoInt);
    @:native("LeadingZeros16") static function leadingZeros16(x: go.UInt16): (go.GoInt);
    @:native("LeadingZeros32") static function leadingZeros32(x: go.UInt32): (go.GoInt);
    @:native("LeadingZeros64") static function leadingZeros64(x: go.UInt64): (go.GoInt);
    @:native("LeadingZeros8") static function leadingZeros8(x: go.UInt8): (go.GoInt);
    @:native("Len") static function len(x: go.GoUInt): (go.GoInt);
    @:native("Len16") static function len16(x: go.UInt16): (go.GoInt);
    @:native("Len32") static function len32(x: go.UInt32): (go.GoInt);
    @:native("Len64") static function len64(x: go.UInt64): (go.GoInt);
    @:native("Len8") static function len8(x: go.UInt8): (go.GoInt);
    @:go.Tuple("hi", "lo") @:native("Mul") static function mul(x: go.GoUInt, y: go.GoUInt): (go.Tuple<{ hi: go.GoUInt, lo: go.GoUInt }>);
    @:go.Tuple("hi", "lo") @:native("Mul32") static function mul32(x: go.UInt32, y: go.UInt32): (go.Tuple<{ hi: go.UInt32, lo: go.UInt32 }>);
    @:go.Tuple("hi", "lo") @:native("Mul64") static function mul64(x: go.UInt64, y: go.UInt64): (go.Tuple<{ hi: go.UInt64, lo: go.UInt64 }>);
    @:native("OnesCount") static function onesCount(x: go.GoUInt): (go.GoInt);
    @:native("OnesCount16") static function onesCount16(x: go.UInt16): (go.GoInt);
    @:native("OnesCount32") static function onesCount32(x: go.UInt32): (go.GoInt);
    @:native("OnesCount64") static function onesCount64(x: go.UInt64): (go.GoInt);
    @:native("OnesCount8") static function onesCount8(x: go.UInt8): (go.GoInt);
    @:native("Rem") static function rem(hi: go.GoUInt, lo: go.GoUInt, y: go.GoUInt): (go.GoUInt);
    @:native("Rem32") static function rem32(hi: go.UInt32, lo: go.UInt32, y: go.UInt32): (go.UInt32);
    @:native("Rem64") static function rem64(hi: go.UInt64, lo: go.UInt64, y: go.UInt64): (go.UInt64);
    @:native("Reverse") static function reverse(x: go.GoUInt): (go.GoUInt);
    @:native("Reverse16") static function reverse16(x: go.UInt16): (go.UInt16);
    @:native("Reverse32") static function reverse32(x: go.UInt32): (go.UInt32);
    @:native("Reverse64") static function reverse64(x: go.UInt64): (go.UInt64);
    @:native("Reverse8") static function reverse8(x: go.UInt8): (go.UInt8);
    @:native("ReverseBytes") static function reverseBytes(x: go.GoUInt): (go.GoUInt);
    @:native("ReverseBytes16") static function reverseBytes16(x: go.UInt16): (go.UInt16);
    @:native("ReverseBytes32") static function reverseBytes32(x: go.UInt32): (go.UInt32);
    @:native("ReverseBytes64") static function reverseBytes64(x: go.UInt64): (go.UInt64);
    @:native("RotateLeft") static function rotateLeft(x: go.GoUInt, k: go.GoInt): (go.GoUInt);
    @:native("RotateLeft16") static function rotateLeft16(x: go.UInt16, k: go.GoInt): (go.UInt16);
    @:native("RotateLeft32") static function rotateLeft32(x: go.UInt32, k: go.GoInt): (go.UInt32);
    @:native("RotateLeft64") static function rotateLeft64(x: go.UInt64, k: go.GoInt): (go.UInt64);
    @:native("RotateLeft8") static function rotateLeft8(x: go.UInt8, k: go.GoInt): (go.UInt8);
    @:go.Tuple("diff", "borrowOut") @:native("Sub") static function sub(x: go.GoUInt, y: go.GoUInt, borrow: go.GoUInt): (go.Tuple<{ diff: go.GoUInt, borrowOut: go.GoUInt }>);
    @:go.Tuple("diff", "borrowOut") @:native("Sub32") static function sub32(x: go.UInt32, y: go.UInt32, borrow: go.UInt32): (go.Tuple<{ diff: go.UInt32, borrowOut: go.UInt32 }>);
    @:go.Tuple("diff", "borrowOut") @:native("Sub64") static function sub64(x: go.UInt64, y: go.UInt64, borrow: go.UInt64): (go.Tuple<{ diff: go.UInt64, borrowOut: go.UInt64 }>);
    @:native("TrailingZeros") static function trailingZeros(x: go.GoUInt): (go.GoInt);
    @:native("TrailingZeros16") static function trailingZeros16(x: go.UInt16): (go.GoInt);
    @:native("TrailingZeros32") static function trailingZeros32(x: go.UInt32): (go.GoInt);
    @:native("TrailingZeros64") static function trailingZeros64(x: go.UInt64): (go.GoInt);
    @:native("TrailingZeros8") static function trailingZeros8(x: go.UInt8): (go.GoInt);

}