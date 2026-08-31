package go.math;

/**
    Package big implements arbitrary-precision arithmetic (big numbers).
    The following numeric types are supported:
    
    	Int    signed integers
    	Rat    rational numbers
    	Float  floating-point numbers
    
    The zero value for an [Int], [Rat], or [Float] correspond to 0. Thus, new
    values can be declared in the usual ways and denote 0 without further
    initialization:
    
    	var x Int        // &x is an *Int of value 0
    	var r = &Rat{}   // r is a *Rat of value 0
    	y := new(Float)  // y is a *Float of value 0
    
    Alternatively, new values can be allocated and initialized with factory
    functions of the form:
    
    	func NewT(v V) *T
    
    For instance, [NewInt](x) returns an *[Int] set to the value of the int64
    argument x, [NewRat](a, b) returns a *[Rat] set to the fraction a/b where
    a and b are int64 values, and [NewFloat](f) returns a *[Float] initialized
    to the float64 argument f. More flexibility is provided with explicit
    setters, for instance:
    
    	var z1 Int
    	z1.SetUint64(123)                 // z1 := 123
    	z2 := new(Rat).SetFloat64(1.25)   // z2 := 5/4
    	z3 := new(Float).SetInt(z1)       // z3 := 123.0
    
    Setters, numeric operations and predicates are represented as methods of
    the form:
    
    	func (z *T) SetV(v V) *T          // z = v
    	func (z *T) Unary(x *T) *T        // z = unary x
    	func (z *T) Binary(x, y *T) *T    // z = x binary y
    	func (x *T) Pred() P              // p = pred(x)
    
    with T one of [Int], [Rat], or [Float]. For unary and binary operations, the
    result is the receiver (usually named z in that case; see below); if it
    is one of the operands x or y it may be safely overwritten (and its memory
    reused).
    
    Arithmetic expressions are typically written as a sequence of individual
    method calls, with each call corresponding to an operation. The receiver
    denotes the result and the method arguments are the operation's operands.
    For instance, given three *Int values a, b and c, the invocation
    
    	c.Add(a, b)
    
    computes the sum a + b and stores the result in c, overwriting whatever
    value was held in c before. Unless specified otherwise, operations permit
    aliasing of parameters, so it is perfectly ok to write
    
    	sum.Add(sum, x)
    
    to accumulate values x in a sum.
    
    (By always passing in a result value via the receiver, memory use can be
    much better controlled. Instead of having to allocate new memory for each
    result, an operation can reuse the space allocated for the result value,
    and overwrite that value with the new result in the process.)
    
    Notational convention: Incoming method parameters (including the receiver)
    are named consistently in the API to clarify their use. Incoming operands
    are usually named x, y, a, b, and so on, but never z. A parameter specifying
    the result is named z (typically the receiver).
    
    For instance, the arguments for (*Int).Add are named x and y, and because
    the receiver specifies the result destination, it is called z:
    
    	func (z *Int) Add(x, y *Int) *Int
    
    Methods of this form typically return the incoming receiver as well, to
    enable simple call chaining.
    
    Methods which don't require a result value to be passed in (for instance,
    [Int.Sign]), simply return the result. In this case, the receiver is typically
    the first operand, named x:
    
    	func (x *Int) Sign() int
    
    Various methods support conversions between strings and corresponding
    numeric values, and vice versa: *[Int], *[Rat], and *[Float] values implement
    the Stringer interface for a (default) string representation of the value,
    but also provide SetString methods to initialize a value from a string in
    a variety of supported formats (see the respective SetString documentation).
    
    Finally, *[Int], *[Rat], and *[Float] satisfy [fmt.Scanner] for scanning
    and (except for *[Rat]) the Formatter interface for formatted printing.
**/
@:go.Type({ name: "big", instanceName: "big.big", imports: ["math/big"] })
extern class Big {

    /**
        Constants describing the [Accuracy] of a [Float].
    **/
    @:native("Above") static var above: go.math.big.Accuracy;
    /**
        These constants define supported rounding modes.
    **/
    @:native("AwayFromZero") static var awayFromZero: go.math.big.RoundingMode;
    /**
        Constants describing the [Accuracy] of a [Float].
    **/
    @:native("Below") static var below: go.math.big.Accuracy;
    /**
        Constants describing the [Accuracy] of a [Float].
    **/
    @:native("Exact") static var exact: go.math.big.Accuracy;
    /**
        MaxBase is the largest number base accepted for string conversions.
    **/
    @:native("MaxBase") static var maxBase: go.Rune;
    /**
        Exponent and precision limits.
    **/
    @:native("MaxExp") static var maxExp: go.GoInt;
    /**
        Exponent and precision limits.
    **/
    @:native("MaxPrec") static var maxPrec: go.GoInt;
    /**
        Exponent and precision limits.
    **/
    @:native("MinExp") static var minExp: go.GoInt;
    /**
        These constants define supported rounding modes.
    **/
    @:native("ToNearestAway") static var toNearestAway: go.math.big.RoundingMode;
    /**
        These constants define supported rounding modes.
    **/
    @:native("ToNearestEven") static var toNearestEven: go.math.big.RoundingMode;
    /**
        These constants define supported rounding modes.
    **/
    @:native("ToNegativeInf") static var toNegativeInf: go.math.big.RoundingMode;
    /**
        These constants define supported rounding modes.
    **/
    @:native("ToPositiveInf") static var toPositiveInf: go.math.big.RoundingMode;
    /**
        These constants define supported rounding modes.
    **/
    @:native("ToZero") static var toZero: go.math.big.RoundingMode;

    /**
        Jacobi returns the Jacobi symbol (x/y), either +1, -1, or 0.
        The y argument must be an odd integer.
    **/
    @:native("Jacobi") static function jacobi(x: go.Pointer<go.math.big.Int>, y: go.Pointer<go.math.big.Int>): (go.GoInt);
    /**
        NewFloat allocates and returns a new [Float] set to x,
        with precision 53 and rounding mode [ToNearestEven].
        NewFloat panics with [ErrNaN] if x is a NaN.
    **/
    @:native("NewFloat") static function newFloat(x: Float): (go.Pointer<go.math.big.Float>);
    /**
        NewInt allocates and returns a new [Int] set to x.
    **/
    @:native("NewInt") static function newInt(x: go.Int64): (go.Pointer<go.math.big.Int>);
    /**
        NewRat creates a new [Rat] with numerator a and denominator b.
    **/
    @:native("NewRat") static function newRat(a: go.Int64, b: go.Int64): (go.Pointer<go.math.big.Rat>);
    /**
        ParseFloat is like f.Parse(s, base) with f set to the given precision
        and rounding mode.
    **/
    @:go.Tuple("f", "b", "err") @:native("ParseFloat") static function parseFloat(s: String, base: go.GoInt, prec: go.GoUInt, mode: go.math.big.RoundingMode): (go.Tuple<{ f: go.Pointer<go.math.big.Float>, b: go.GoInt, err: go.Error }>);

}