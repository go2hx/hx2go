package go.math.big;

/**
    A Rat represents a quotient a/b of arbitrary precision.
    The zero value for a Rat represents the value 0.
    
    Operations always take pointer arguments (*Rat) rather
    than Rat values, and each unique Rat value requires
    its own unique *Rat pointer. To "copy" a Rat value,
    an existing (or newly allocated) Rat must be set to
    a new value using the [Rat.Set] method; shallow copies
    of Rats are not supported and may lead to errors.
**/
@:structInit
@:go.Type({ name: "Rat", instanceName: "big.Rat", imports: ["math/big"] })
extern class Rat {

    /**
        Abs sets z to |x| (the absolute value of x) and returns z.
    **/
    @:native("Abs") function abs(x: go.Pointer<go.math.big.Rat>): (go.Pointer<go.math.big.Rat>);
    /**
        Add sets z to the sum x+y and returns z.
    **/
    @:native("Add") function add(x: go.Pointer<go.math.big.Rat>, y: go.Pointer<go.math.big.Rat>): (go.Pointer<go.math.big.Rat>);
    /**
        AppendText implements the [encoding.TextAppender] interface.
    **/
    @:native("AppendText") function appendText(b: go.Slice<go.Byte>): (go.Result<go.Slice<go.Byte>>);
    /**
        Cmp compares x and y and returns:
          - -1 if x < y;
          - 0 if x == y;
          - +1 if x > y.
    **/
    @:native("Cmp") function cmp(y: go.Pointer<go.math.big.Rat>): (go.GoInt);
    /**
        Denom returns the denominator of x; it is always > 0.
        The result is a reference to x's denominator, unless
        x is an uninitialized (zero value) [Rat], in which case
        the result is a new [Int] of value 1. (To initialize x,
        any operation that sets x will do, including x.Set(x).)
        If the result is a reference to x's denominator it
        may change if a new value is assigned to x, and vice versa.
    **/
    @:native("Denom") function denom(): (go.Pointer<go.math.big.Int>);
    /**
        Float32 returns the nearest float32 value for x and a bool indicating
        whether f represents x exactly. If the magnitude of x is too large to
        be represented by a float32, f is an infinity and exact is false.
        The sign of f always matches the sign of x, even if f == 0.
    **/
    @:go.Tuple("f", "exact") @:native("Float32") function float32(): (go.Tuple<{ f: go.Float32, exact: Bool }>);
    /**
        Float64 returns the nearest float64 value for x and a bool indicating
        whether f represents x exactly. If the magnitude of x is too large to
        be represented by a float64, f is an infinity and exact is false.
        The sign of f always matches the sign of x, even if f == 0.
    **/
    @:go.Tuple("f", "exact") @:native("Float64") function float64(): (go.Tuple<{ f: Float, exact: Bool }>);
    /**
        FloatPrec returns the number n of non-repeating digits immediately
        following the decimal point of the decimal representation of x.
        The boolean result indicates whether a decimal representation of x
        with that many fractional digits is exact or rounded.
        
        Examples:
        
        	x      n    exact    decimal representation n fractional digits
        	0      0    true     0
        	1      0    true     1
        	1/2    1    true     0.5
        	1/3    0    false    0       (0.333... rounded)
        	1/4    2    true     0.25
        	1/6    1    false    0.2     (0.166... rounded)
    **/
    @:go.Tuple("n", "exact") @:native("FloatPrec") function floatPrec(): (go.Tuple<{ n: go.GoInt, exact: Bool }>);
    /**
        FloatString returns a string representation of x in decimal form with prec
        digits of precision after the radix point. The last digit is rounded to
        nearest, with halves rounded away from zero.
    **/
    @:native("FloatString") function floatString(prec: go.GoInt): (String);
    /**
        GobDecode implements the [encoding/gob.GobDecoder] interface.
    **/
    @:native("GobDecode") function gobDecode(buf: go.Slice<go.Byte>): (go.Error);
    /**
        GobEncode implements the [encoding/gob.GobEncoder] interface.
    **/
    @:native("GobEncode") function gobEncode(): (go.Result<go.Slice<go.Byte>>);
    /**
        Inv sets z to 1/x and returns z.
        If x == 0, Inv panics.
    **/
    @:native("Inv") function inv(x: go.Pointer<go.math.big.Rat>): (go.Pointer<go.math.big.Rat>);
    /**
        IsInt reports whether the denominator of x is 1.
    **/
    @:native("IsInt") function isInt(): (Bool);
    /**
        MarshalText implements the [encoding.TextMarshaler] interface.
    **/
    @:native("MarshalText") function marshalText(): (go.Result<go.Slice<go.Byte>>);
    /**
        Mul sets z to the product x*y and returns z.
    **/
    @:native("Mul") function mul(x: go.Pointer<go.math.big.Rat>, y: go.Pointer<go.math.big.Rat>): (go.Pointer<go.math.big.Rat>);
    /**
        Neg sets z to -x and returns z.
    **/
    @:native("Neg") function neg(x: go.Pointer<go.math.big.Rat>): (go.Pointer<go.math.big.Rat>);
    /**
        Num returns the numerator of x; it may be <= 0.
        The result is a reference to x's numerator; it
        may change if a new value is assigned to x, and vice versa.
        The sign of the numerator corresponds to the sign of x.
    **/
    @:native("Num") function num(): (go.Pointer<go.math.big.Int>);
    /**
        Quo sets z to the quotient x/y and returns z.
        If y == 0, Quo panics.
    **/
    @:native("Quo") function quo(x: go.Pointer<go.math.big.Rat>, y: go.Pointer<go.math.big.Rat>): (go.Pointer<go.math.big.Rat>);
    /**
        RatString returns a string representation of x in the form "a/b" if b != 1,
        and in the form "a" if b == 1.
    **/
    @:native("RatString") function ratString(): (String);
    /**
        Scan is a support routine for fmt.Scanner. It accepts the formats
        'e', 'E', 'f', 'F', 'g', 'G', and 'v'. All formats are equivalent.
    **/
    @:native("Scan") function scan(s: go.fmt.ScanState, ch: go.Rune): (go.Error);
    /**
        Set sets z to x (by making a copy of x) and returns z.
    **/
    @:native("Set") function set(x: go.Pointer<go.math.big.Rat>): (go.Pointer<go.math.big.Rat>);
    /**
        SetFloat64 sets z to exactly f and returns z.
        If f is not finite, SetFloat returns nil.
    **/
    @:native("SetFloat64") function setFloat64(f: Float): (go.Pointer<go.math.big.Rat>);
    /**
        SetFrac sets z to a/b and returns z.
        If b == 0, SetFrac panics.
    **/
    @:native("SetFrac") function setFrac(a: go.Pointer<go.math.big.Int>, b: go.Pointer<go.math.big.Int>): (go.Pointer<go.math.big.Rat>);
    /**
        SetFrac64 sets z to a/b and returns z.
        If b == 0, SetFrac64 panics.
    **/
    @:native("SetFrac64") function setFrac64(a: go.Int64, b: go.Int64): (go.Pointer<go.math.big.Rat>);
    /**
        SetInt sets z to x (by making a copy of x) and returns z.
    **/
    @:native("SetInt") function setInt(x: go.Pointer<go.math.big.Int>): (go.Pointer<go.math.big.Rat>);
    /**
        SetInt64 sets z to x and returns z.
    **/
    @:native("SetInt64") function setInt64(x: go.Int64): (go.Pointer<go.math.big.Rat>);
    /**
        SetString sets z to the value of s and returns z and a boolean indicating
        success. s can be given as a (possibly signed) fraction "a/b", or as a
        floating-point number optionally followed by an exponent.
        If a fraction is provided, both the dividend and the divisor may be a
        decimal integer or independently use a prefix of “0b”, “0” or “0o”,
        or “0x” (or their upper-case variants) to denote a binary, octal, or
        hexadecimal integer, respectively. The divisor may not be signed.
        If a floating-point number is provided, it may be in decimal form or
        use any of the same prefixes as above but for “0” to denote a non-decimal
        mantissa. A leading “0” is considered a decimal leading 0; it does not
        indicate octal representation in this case.
        An optional base-10 “e” or base-2 “p” (or their upper-case variants)
        exponent may be provided as well, except for hexadecimal floats which
        only accept an (optional) “p” exponent (because an “e” or “E” cannot
        be distinguished from a mantissa digit). If the exponent's absolute value
        is too large, the operation may fail.
        The entire string, not just a prefix, must be valid for success. If the
        operation failed, the value of z is undefined but the returned value is nil.
    **/
    @:go.Tuple("p0", "p1") @:native("SetString") function setString(s: String): (go.Tuple<{ p0: go.Pointer<go.math.big.Rat>, p1: Bool }>);
    /**
        SetUint64 sets z to x and returns z.
    **/
    @:native("SetUint64") function setUint64(x: go.UInt64): (go.Pointer<go.math.big.Rat>);
    /**
        Sign returns:
          - -1 if x < 0;
          - 0 if x == 0;
          - +1 if x > 0.
    **/
    @:native("Sign") function sign(): (go.GoInt);
    /**
        String returns a string representation of x in the form "a/b" (even if b == 1).
    **/
    @:native("String") function string(): (String);
    /**
        Sub sets z to the difference x-y and returns z.
    **/
    @:native("Sub") function sub(x: go.Pointer<go.math.big.Rat>, y: go.Pointer<go.math.big.Rat>): (go.Pointer<go.math.big.Rat>);
    /**
        UnmarshalText implements the [encoding.TextUnmarshaler] interface.
    **/
    @:native("UnmarshalText") function unmarshalText(text: go.Slice<go.Byte>): (go.Error);

}