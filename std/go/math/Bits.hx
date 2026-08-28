package go.math;

/**
    Package bits implements bit counting and manipulation
    functions for the predeclared unsigned integer types.
    
    Functions in this package may be implemented directly by
    the compiler, for better performance. For those functions
    the code in this package will not be used. Which
    functions are implemented by the compiler depends on the
    architecture and the Go release.
**/
@:go.Type({ name: "bits", instanceName: "bits.bits", imports: ["math/bits"] })
extern class Bits {

    /**
        UintSize is the size of a uint in bits.
    **/
    @:native("UintSize") static var uintSize: go.GoInt;

    /**
        Add returns the sum with carry of x, y and carry: sum = x + y + carry.
        The carry input must be 0 or 1; otherwise the behavior is undefined.
        The carryOut output is guaranteed to be 0 or 1.
        
        This function's execution time does not depend on the inputs.
    **/
    @:go.Tuple("sum", "carryOut") @:native("Add") static function add(x: go.GoUInt, y: go.GoUInt, carry: go.GoUInt): (go.Tuple<{ sum: go.GoUInt, carryOut: go.GoUInt }>);
    /**
        Add32 returns the sum with carry of x, y and carry: sum = x + y + carry.
        The carry input must be 0 or 1; otherwise the behavior is undefined.
        The carryOut output is guaranteed to be 0 or 1.
        
        This function's execution time does not depend on the inputs.
    **/
    @:go.Tuple("sum", "carryOut") @:native("Add32") static function add32(x: go.UInt32, y: go.UInt32, carry: go.UInt32): (go.Tuple<{ sum: go.UInt32, carryOut: go.UInt32 }>);
    /**
        Add64 returns the sum with carry of x, y and carry: sum = x + y + carry.
        The carry input must be 0 or 1; otherwise the behavior is undefined.
        The carryOut output is guaranteed to be 0 or 1.
        
        This function's execution time does not depend on the inputs.
    **/
    @:go.Tuple("sum", "carryOut") @:native("Add64") static function add64(x: go.UInt64, y: go.UInt64, carry: go.UInt64): (go.Tuple<{ sum: go.UInt64, carryOut: go.UInt64 }>);
    /**
        Div returns the quotient and remainder of (hi, lo) divided by y:
        quo = (hi, lo)/y, rem = (hi, lo)%y with the dividend bits' upper
        half in parameter hi and the lower half in parameter lo.
        Div panics for y == 0 (division by zero) or y <= hi (quotient overflow).
    **/
    @:go.Tuple("quo", "rem") @:native("Div") static function div(hi: go.GoUInt, lo: go.GoUInt, y: go.GoUInt): (go.Tuple<{ quo: go.GoUInt, rem: go.GoUInt }>);
    /**
        Div32 returns the quotient and remainder of (hi, lo) divided by y:
        quo = (hi, lo)/y, rem = (hi, lo)%y with the dividend bits' upper
        half in parameter hi and the lower half in parameter lo.
        Div32 panics for y == 0 (division by zero) or y <= hi (quotient overflow).
    **/
    @:go.Tuple("quo", "rem") @:native("Div32") static function div32(hi: go.UInt32, lo: go.UInt32, y: go.UInt32): (go.Tuple<{ quo: go.UInt32, rem: go.UInt32 }>);
    /**
        Div64 returns the quotient and remainder of (hi, lo) divided by y:
        quo = (hi, lo)/y, rem = (hi, lo)%y with the dividend bits' upper
        half in parameter hi and the lower half in parameter lo.
        Div64 panics for y == 0 (division by zero) or y <= hi (quotient overflow).
    **/
    @:go.Tuple("quo", "rem") @:native("Div64") static function div64(hi: go.UInt64, lo: go.UInt64, y: go.UInt64): (go.Tuple<{ quo: go.UInt64, rem: go.UInt64 }>);
    /**
        LeadingZeros returns the number of leading zero bits in x; the result is [UintSize] for x == 0.
    **/
    @:native("LeadingZeros") static function leadingZeros(x: go.GoUInt): (go.GoInt);
    /**
        LeadingZeros16 returns the number of leading zero bits in x; the result is 16 for x == 0.
    **/
    @:native("LeadingZeros16") static function leadingZeros16(x: go.UInt16): (go.GoInt);
    /**
        LeadingZeros32 returns the number of leading zero bits in x; the result is 32 for x == 0.
    **/
    @:native("LeadingZeros32") static function leadingZeros32(x: go.UInt32): (go.GoInt);
    /**
        LeadingZeros64 returns the number of leading zero bits in x; the result is 64 for x == 0.
    **/
    @:native("LeadingZeros64") static function leadingZeros64(x: go.UInt64): (go.GoInt);
    /**
        LeadingZeros8 returns the number of leading zero bits in x; the result is 8 for x == 0.
    **/
    @:native("LeadingZeros8") static function leadingZeros8(x: go.UInt8): (go.GoInt);
    /**
        Len returns the minimum number of bits required to represent x; the result is 0 for x == 0.
    **/
    @:native("Len") static function len(x: go.GoUInt): (go.GoInt);
    /**
        Len16 returns the minimum number of bits required to represent x; the result is 0 for x == 0.
    **/
    @:native("Len16") static function len16(x: go.UInt16): (go.GoInt);
    /**
        Len32 returns the minimum number of bits required to represent x; the result is 0 for x == 0.
    **/
    @:native("Len32") static function len32(x: go.UInt32): (go.GoInt);
    /**
        Len64 returns the minimum number of bits required to represent x; the result is 0 for x == 0.
    **/
    @:native("Len64") static function len64(x: go.UInt64): (go.GoInt);
    /**
        Len8 returns the minimum number of bits required to represent x; the result is 0 for x == 0.
    **/
    @:native("Len8") static function len8(x: go.UInt8): (go.GoInt);
    /**
        Mul returns the full-width product of x and y: (hi, lo) = x * y
        with the product bits' upper half returned in hi and the lower
        half returned in lo.
        
        This function's execution time does not depend on the inputs.
    **/
    @:go.Tuple("hi", "lo") @:native("Mul") static function mul(x: go.GoUInt, y: go.GoUInt): (go.Tuple<{ hi: go.GoUInt, lo: go.GoUInt }>);
    /**
        Mul32 returns the 64-bit product of x and y: (hi, lo) = x * y
        with the product bits' upper half returned in hi and the lower
        half returned in lo.
        
        This function's execution time does not depend on the inputs.
    **/
    @:go.Tuple("hi", "lo") @:native("Mul32") static function mul32(x: go.UInt32, y: go.UInt32): (go.Tuple<{ hi: go.UInt32, lo: go.UInt32 }>);
    /**
        Mul64 returns the 128-bit product of x and y: (hi, lo) = x * y
        with the product bits' upper half returned in hi and the lower
        half returned in lo.
        
        This function's execution time does not depend on the inputs.
    **/
    @:go.Tuple("hi", "lo") @:native("Mul64") static function mul64(x: go.UInt64, y: go.UInt64): (go.Tuple<{ hi: go.UInt64, lo: go.UInt64 }>);
    /**
        OnesCount returns the number of one bits ("population count") in x.
    **/
    @:native("OnesCount") static function onesCount(x: go.GoUInt): (go.GoInt);
    /**
        OnesCount16 returns the number of one bits ("population count") in x.
    **/
    @:native("OnesCount16") static function onesCount16(x: go.UInt16): (go.GoInt);
    /**
        OnesCount32 returns the number of one bits ("population count") in x.
    **/
    @:native("OnesCount32") static function onesCount32(x: go.UInt32): (go.GoInt);
    /**
        OnesCount64 returns the number of one bits ("population count") in x.
    **/
    @:native("OnesCount64") static function onesCount64(x: go.UInt64): (go.GoInt);
    /**
        OnesCount8 returns the number of one bits ("population count") in x.
    **/
    @:native("OnesCount8") static function onesCount8(x: go.UInt8): (go.GoInt);
    /**
        Rem returns the remainder of (hi, lo) divided by y. Rem panics for
        y == 0 (division by zero) but, unlike Div, it doesn't panic on a
        quotient overflow.
    **/
    @:native("Rem") static function rem(hi: go.GoUInt, lo: go.GoUInt, y: go.GoUInt): (go.GoUInt);
    /**
        Rem32 returns the remainder of (hi, lo) divided by y. Rem32 panics
        for y == 0 (division by zero) but, unlike [Div32], it doesn't panic
        on a quotient overflow.
    **/
    @:native("Rem32") static function rem32(hi: go.UInt32, lo: go.UInt32, y: go.UInt32): (go.UInt32);
    /**
        Rem64 returns the remainder of (hi, lo) divided by y. Rem64 panics
        for y == 0 (division by zero) but, unlike [Div64], it doesn't panic
        on a quotient overflow.
    **/
    @:native("Rem64") static function rem64(hi: go.UInt64, lo: go.UInt64, y: go.UInt64): (go.UInt64);
    /**
        Reverse returns the value of x with its bits in reversed order.
    **/
    @:native("Reverse") static function reverse(x: go.GoUInt): (go.GoUInt);
    /**
        Reverse16 returns the value of x with its bits in reversed order.
    **/
    @:native("Reverse16") static function reverse16(x: go.UInt16): (go.UInt16);
    /**
        Reverse32 returns the value of x with its bits in reversed order.
    **/
    @:native("Reverse32") static function reverse32(x: go.UInt32): (go.UInt32);
    /**
        Reverse64 returns the value of x with its bits in reversed order.
    **/
    @:native("Reverse64") static function reverse64(x: go.UInt64): (go.UInt64);
    /**
        Reverse8 returns the value of x with its bits in reversed order.
    **/
    @:native("Reverse8") static function reverse8(x: go.UInt8): (go.UInt8);
    /**
        ReverseBytes returns the value of x with its bytes in reversed order.
        
        This function's execution time does not depend on the inputs.
    **/
    @:native("ReverseBytes") static function reverseBytes(x: go.GoUInt): (go.GoUInt);
    /**
        ReverseBytes16 returns the value of x with its bytes in reversed order.
        
        This function's execution time does not depend on the inputs.
    **/
    @:native("ReverseBytes16") static function reverseBytes16(x: go.UInt16): (go.UInt16);
    /**
        ReverseBytes32 returns the value of x with its bytes in reversed order.
        
        This function's execution time does not depend on the inputs.
    **/
    @:native("ReverseBytes32") static function reverseBytes32(x: go.UInt32): (go.UInt32);
    /**
        ReverseBytes64 returns the value of x with its bytes in reversed order.
        
        This function's execution time does not depend on the inputs.
    **/
    @:native("ReverseBytes64") static function reverseBytes64(x: go.UInt64): (go.UInt64);
    /**
        RotateLeft returns the value of x rotated left by (k mod [UintSize]) bits.
        To rotate x right by k bits, call RotateLeft(x, -k).
        
        This function's execution time does not depend on the inputs.
    **/
    @:native("RotateLeft") static function rotateLeft(x: go.GoUInt, k: go.GoInt): (go.GoUInt);
    /**
        RotateLeft16 returns the value of x rotated left by (k mod 16) bits.
        To rotate x right by k bits, call RotateLeft16(x, -k).
        
        This function's execution time does not depend on the inputs.
    **/
    @:native("RotateLeft16") static function rotateLeft16(x: go.UInt16, k: go.GoInt): (go.UInt16);
    /**
        RotateLeft32 returns the value of x rotated left by (k mod 32) bits.
        To rotate x right by k bits, call RotateLeft32(x, -k).
        
        This function's execution time does not depend on the inputs.
    **/
    @:native("RotateLeft32") static function rotateLeft32(x: go.UInt32, k: go.GoInt): (go.UInt32);
    /**
        RotateLeft64 returns the value of x rotated left by (k mod 64) bits.
        To rotate x right by k bits, call RotateLeft64(x, -k).
        
        This function's execution time does not depend on the inputs.
    **/
    @:native("RotateLeft64") static function rotateLeft64(x: go.UInt64, k: go.GoInt): (go.UInt64);
    /**
        RotateLeft8 returns the value of x rotated left by (k mod 8) bits.
        To rotate x right by k bits, call RotateLeft8(x, -k).
        
        This function's execution time does not depend on the inputs.
    **/
    @:native("RotateLeft8") static function rotateLeft8(x: go.UInt8, k: go.GoInt): (go.UInt8);
    /**
        Sub returns the difference of x, y and borrow: diff = x - y - borrow.
        The borrow input must be 0 or 1; otherwise the behavior is undefined.
        The borrowOut output is guaranteed to be 0 or 1.
        
        This function's execution time does not depend on the inputs.
    **/
    @:go.Tuple("diff", "borrowOut") @:native("Sub") static function sub(x: go.GoUInt, y: go.GoUInt, borrow: go.GoUInt): (go.Tuple<{ diff: go.GoUInt, borrowOut: go.GoUInt }>);
    /**
        Sub32 returns the difference of x, y and borrow, diff = x - y - borrow.
        The borrow input must be 0 or 1; otherwise the behavior is undefined.
        The borrowOut output is guaranteed to be 0 or 1.
        
        This function's execution time does not depend on the inputs.
    **/
    @:go.Tuple("diff", "borrowOut") @:native("Sub32") static function sub32(x: go.UInt32, y: go.UInt32, borrow: go.UInt32): (go.Tuple<{ diff: go.UInt32, borrowOut: go.UInt32 }>);
    /**
        Sub64 returns the difference of x, y and borrow: diff = x - y - borrow.
        The borrow input must be 0 or 1; otherwise the behavior is undefined.
        The borrowOut output is guaranteed to be 0 or 1.
        
        This function's execution time does not depend on the inputs.
    **/
    @:go.Tuple("diff", "borrowOut") @:native("Sub64") static function sub64(x: go.UInt64, y: go.UInt64, borrow: go.UInt64): (go.Tuple<{ diff: go.UInt64, borrowOut: go.UInt64 }>);
    /**
        TrailingZeros returns the number of trailing zero bits in x; the result is [UintSize] for x == 0.
    **/
    @:native("TrailingZeros") static function trailingZeros(x: go.GoUInt): (go.GoInt);
    /**
        TrailingZeros16 returns the number of trailing zero bits in x; the result is 16 for x == 0.
    **/
    @:native("TrailingZeros16") static function trailingZeros16(x: go.UInt16): (go.GoInt);
    /**
        TrailingZeros32 returns the number of trailing zero bits in x; the result is 32 for x == 0.
    **/
    @:native("TrailingZeros32") static function trailingZeros32(x: go.UInt32): (go.GoInt);
    /**
        TrailingZeros64 returns the number of trailing zero bits in x; the result is 64 for x == 0.
    **/
    @:native("TrailingZeros64") static function trailingZeros64(x: go.UInt64): (go.GoInt);
    /**
        TrailingZeros8 returns the number of trailing zero bits in x; the result is 8 for x == 0.
    **/
    @:native("TrailingZeros8") static function trailingZeros8(x: go.UInt8): (go.GoInt);

}