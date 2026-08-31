package go.go;

/**
    Package constant implements Values representing untyped
    Go constants and their corresponding operations.
    
    A special Unknown value may be used when a value
    is unknown due to an error. Operations on unknown
    values produce unknown values unless specified
    otherwise.
**/
@:go.Type({ name: "constant", instanceName: "constant.constant", imports: ["go/constant"] })
extern class Constant {

    @:native("Bool") static var bool: go.go.constant.Kind;
    @:native("Complex") static var complex: go.go.constant.Kind;
    @:native("Float") static var float: go.go.constant.Kind;
    @:native("Int") static var int: go.go.constant.Kind;
    @:native("String") static var string: go.go.constant.Kind;
    @:native("Unknown") static var unknown: go.go.constant.Kind;

    /**
        BinaryOp returns the result of the binary expression x op y.
        The operation must be defined for the operands. If one of the
        operands is [Unknown], the result is [Unknown].
        BinaryOp doesn't handle comparisons or shifts; use [Compare]
        or [Shift] instead.
        
        To force integer division of [Int] operands, use op == [token.QUO_ASSIGN]
        instead of [token.QUO]; the result is guaranteed to be [Int] in this case.
        Division by zero leads to a run-time panic.
    **/
    @:native("BinaryOp") static function binaryOp(x_: go.go.constant.Value, op: go.go.token.Token, y_: go.go.constant.Value): (go.go.constant.Value);
    /**
        BitLen returns the number of bits required to represent
        the absolute value x in binary representation; x must be an [Int] or an [Unknown].
        If x is [Unknown], the result is 0.
    **/
    @:native("BitLen") static function bitLen(x: go.go.constant.Value): (go.GoInt);
    /**
        BoolVal returns the Go boolean value of x, which must be a [Bool] or an [Unknown].
        If x is [Unknown], the result is false.
    **/
    @:native("BoolVal") static function boolVal(x: go.go.constant.Value): (Bool);
    /**
        Bytes returns the bytes for the absolute value of x in little-
        endian binary representation; x must be an [Int].
    **/
    @:native("Bytes") static function bytes(x: go.go.constant.Value): (go.Slice<go.Byte>);
    /**
        Compare returns the result of the comparison x op y.
        The comparison must be defined for the operands.
        If one of the operands is [Unknown], the result is
        false.
    **/
    @:native("Compare") static function compare(x_: go.go.constant.Value, op: go.go.token.Token, y_: go.go.constant.Value): (Bool);
    /**
        Denom returns the denominator of x; x must be [Int], [Float], or [Unknown].
        If x is [Unknown], or if it is too large or small to represent as a
        fraction, the result is [Unknown]. Otherwise the result is an [Int] >= 1.
    **/
    @:native("Denom") static function denom(x: go.go.constant.Value): (go.go.constant.Value);
    /**
        Float32Val is like [Float64Val] but for float32 instead of float64.
    **/
    @:go.Tuple("p0", "p1") @:native("Float32Val") static function float32Val(x: go.go.constant.Value): (go.Tuple<{ p0: go.Float32, p1: Bool }>);
    /**
        Float64Val returns the nearest Go float64 value of x and whether the result is exact;
        x must be numeric or an [Unknown], but not [Complex]. For values too small (too close to 0)
        to represent as float64, [Float64Val] silently underflows to 0. The result sign always
        matches the sign of x, even for 0.
        If x is [Unknown], the result is (0, false).
    **/
    @:go.Tuple("p0", "p1") @:native("Float64Val") static function float64Val(x: go.go.constant.Value): (go.Tuple<{ p0: Float, p1: Bool }>);
    /**
        Imag returns the imaginary part of x, which must be a numeric or unknown value.
        If x is [Unknown], the result is [Unknown].
    **/
    @:native("Imag") static function imag(x: go.go.constant.Value): (go.go.constant.Value);
    /**
        Int64Val returns the Go int64 value of x and whether the result is exact;
        x must be an [Int] or an [Unknown]. If the result is not exact, its value is undefined.
        If x is [Unknown], the result is (0, false).
    **/
    @:go.Tuple("p0", "p1") @:native("Int64Val") static function int64Val(x: go.go.constant.Value): (go.Tuple<{ p0: go.Int64, p1: Bool }>);
    /**
        Make returns the [Value] for x.
        
        	type of x        result Kind
        	----------------------------
        	bool             Bool
        	string           String
        	int64            Int
        	*big.Int         Int
        	*big.Float       Float
        	*big.Rat         Float
        	anything else    Unknown
    **/
    @:native("Make") static function make(x: Dynamic): (go.go.constant.Value);
    /**
        MakeBool returns the [Bool] value for b.
    **/
    @:native("MakeBool") static function makeBool(b: Bool): (go.go.constant.Value);
    /**
        MakeFloat64 returns the [Float] value for x.
        If x is -0.0, the result is 0.0.
        If x is not finite, the result is an [Unknown].
    **/
    @:native("MakeFloat64") static function makeFloat64(x: Float): (go.go.constant.Value);
    /**
        MakeFromBytes returns the [Int] value given the bytes of its little-endian
        binary representation. An empty byte slice argument represents 0.
    **/
    @:native("MakeFromBytes") static function makeFromBytes(bytes: go.Slice<go.Byte>): (go.go.constant.Value);
    /**
        MakeFromLiteral returns the corresponding integer, floating-point,
        imaginary, character, or string value for a Go literal string. The
        tok value must be one of [token.INT], [token.FLOAT], [token.IMAG],
        [token.CHAR], or [token.STRING]. The final argument must be zero.
        If the literal string syntax is invalid, the result is an [Unknown].
    **/
    @:native("MakeFromLiteral") static function makeFromLiteral(lit: std.String, tok: go.go.token.Token, zero: go.GoUInt): (go.go.constant.Value);
    /**
        MakeImag returns the [Complex] value x*i;
        x must be [Int], [Float], or [Unknown].
        If x is [Unknown], the result is [Unknown].
    **/
    @:native("MakeImag") static function makeImag(x: go.go.constant.Value): (go.go.constant.Value);
    /**
        MakeInt64 returns the [Int] value for x.
    **/
    @:native("MakeInt64") static function makeInt64(x: go.Int64): (go.go.constant.Value);
    /**
        MakeString returns the [String] value for s.
    **/
    @:native("MakeString") static function makeString(s: std.String): (go.go.constant.Value);
    /**
        MakeUint64 returns the [Int] value for x.
    **/
    @:native("MakeUint64") static function makeUint64(x: go.UInt64): (go.go.constant.Value);
    /**
        MakeUnknown returns the [Unknown] value.
    **/
    @:native("MakeUnknown") static function makeUnknown(): (go.go.constant.Value);
    /**
        Num returns the numerator of x; x must be [Int], [Float], or [Unknown].
        If x is [Unknown], or if it is too large or small to represent as a
        fraction, the result is [Unknown]. Otherwise the result is an [Int]
        with the same sign as x.
    **/
    @:native("Num") static function num(x: go.go.constant.Value): (go.go.constant.Value);
    /**
        Real returns the real part of x, which must be a numeric or unknown value.
        If x is [Unknown], the result is [Unknown].
    **/
    @:native("Real") static function real(x: go.go.constant.Value): (go.go.constant.Value);
    /**
        Shift returns the result of the shift expression x op s
        with op == [token.SHL] or [token.SHR] (<< or >>). x must be
        an [Int] or an [Unknown]. If x is [Unknown], the result is x.
    **/
    @:native("Shift") static function shift(x: go.go.constant.Value, op: go.go.token.Token, s: go.GoUInt): (go.go.constant.Value);
    /**
        Sign returns -1, 0, or 1 depending on whether x < 0, x == 0, or x > 0;
        x must be numeric or [Unknown]. For complex values x, the sign is 0 if x == 0,
        otherwise it is != 0. If x is [Unknown], the result is 1.
    **/
    @:native("Sign") static function sign(x: go.go.constant.Value): (go.GoInt);
    /**
        StringVal returns the Go string value of x, which must be a [String] or an [Unknown].
        If x is [Unknown], the result is "".
    **/
    @:native("StringVal") static function stringVal(x: go.go.constant.Value): (std.String);
    /**
        ToComplex converts x to a [Complex] value if x is representable as a [Complex].
        Otherwise it returns an [Unknown].
    **/
    @:native("ToComplex") static function toComplex(x: go.go.constant.Value): (go.go.constant.Value);
    /**
        ToFloat converts x to a [Float] value if x is representable as a [Float].
        Otherwise it returns an [Unknown].
    **/
    @:native("ToFloat") static function toFloat(x: go.go.constant.Value): (go.go.constant.Value);
    /**
        ToInt converts x to an [Int] value if x is representable as an [Int].
        Otherwise it returns an [Unknown].
    **/
    @:native("ToInt") static function toInt(x: go.go.constant.Value): (go.go.constant.Value);
    /**
        Uint64Val returns the Go uint64 value of x and whether the result is exact;
        x must be an [Int] or an [Unknown]. If the result is not exact, its value is undefined.
        If x is [Unknown], the result is (0, false).
    **/
    @:go.Tuple("p0", "p1") @:native("Uint64Val") static function uint64Val(x: go.go.constant.Value): (go.Tuple<{ p0: go.UInt64, p1: Bool }>);
    /**
        UnaryOp returns the result of the unary expression op y.
        The operation must be defined for the operand.
        If prec > 0 it specifies the ^ (xor) result size in bits.
        If y is [Unknown], the result is [Unknown].
    **/
    @:native("UnaryOp") static function unaryOp(op: go.go.token.Token, y: go.go.constant.Value, prec: go.GoUInt): (go.go.constant.Value);
    /**
        Val returns the underlying value for a given constant. Since it returns an
        interface, it is up to the caller to type assert the result to the expected
        type. The possible dynamic return types are:
        
        	x Kind             type of result
        	-----------------------------------------
        	Bool               bool
        	String             string
        	Int                int64 or *big.Int
        	Float              *big.Float or *big.Rat
        	everything else    nil
    **/
    @:native("Val") static function val(x: go.go.constant.Value): (Dynamic);

}