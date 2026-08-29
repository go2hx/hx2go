package go.math.rand.v2;

/**
    A Rand is a source of random numbers.
**/
@:structInit
@:go.Type({ name: "Rand", instanceName: "rand.Rand", imports: ["math/rand/v2"] })
extern class Rand {

    /**
        ExpFloat64 returns an exponentially distributed float64 in the range
        (0, +math.MaxFloat64] with an exponential distribution whose rate parameter
        (lambda) is 1 and whose mean is 1/lambda (1).
        To produce a distribution with a different rate parameter,
        callers can adjust the output using:
        
        	sample = ExpFloat64() / desiredRateParameter
    **/
    @:native("ExpFloat64") function expFloat64(): (Float);
    /**
        Float32 returns, as a float32, a pseudo-random number in the half-open interval [0.0,1.0).
    **/
    @:native("Float32") function float32(): (go.Float32);
    /**
        Float64 returns, as a float64, a pseudo-random number in the half-open interval [0.0,1.0).
    **/
    @:native("Float64") function float64(): (Float);
    /**
        Int returns a non-negative pseudo-random int.
    **/
    @:native("Int") function int(): (go.GoInt);
    /**
        Int32 returns a non-negative pseudo-random 31-bit integer as an int32.
    **/
    @:native("Int32") function int32(): (go.Int32);
    /**
        Int32N returns, as an int32, a non-negative pseudo-random number in the half-open interval [0,n).
        It panics if n <= 0.
    **/
    @:native("Int32N") function int32N(n: go.Int32): (go.Int32);
    /**
        Int64 returns a non-negative pseudo-random 63-bit integer as an int64.
    **/
    @:native("Int64") function int64(): (go.Int64);
    /**
        Int64N returns, as an int64, a non-negative pseudo-random number in the half-open interval [0,n).
        It panics if n <= 0.
    **/
    @:native("Int64N") function int64N(n: go.Int64): (go.Int64);
    /**
        IntN returns, as an int, a non-negative pseudo-random number in the half-open interval [0,n).
        It panics if n <= 0.
    **/
    @:native("IntN") function intN(n: go.GoInt): (go.GoInt);
    /**
        NormFloat64 returns a normally distributed float64 in
        the range -math.MaxFloat64 through +math.MaxFloat64 inclusive,
        with standard normal distribution (mean = 0, stddev = 1).
        To produce a different normal distribution, callers can
        adjust the output using:
        
        	sample = NormFloat64() * desiredStdDev + desiredMean
    **/
    @:native("NormFloat64") function normFloat64(): (Float);
    /**
        Perm returns, as a slice of n ints, a pseudo-random permutation of the integers
        in the half-open interval [0,n).
    **/
    @:native("Perm") function perm(n: go.GoInt): (go.Slice<go.GoInt>);
    /**
        Shuffle pseudo-randomizes the order of elements.
        n is the number of elements. Shuffle panics if n < 0.
        swap swaps the elements with indexes i and j.
    **/
    @:native("Shuffle") function shuffle(n: go.GoInt, swap: (i: go.GoInt, j: go.GoInt) -> Void): Void;
    /**
        Uint returns a pseudo-random uint.
    **/
    @:native("Uint") function uint(): (go.GoUInt);
    /**
        Uint32 returns a pseudo-random 32-bit value as a uint32.
    **/
    @:native("Uint32") function uint32(): (go.UInt32);
    /**
        Uint32N returns, as a uint32, a non-negative pseudo-random number in the half-open interval [0,n).
        It panics if n == 0.
    **/
    @:native("Uint32N") function uint32N(n: go.UInt32): (go.UInt32);
    /**
        Uint64 returns a pseudo-random 64-bit value as a uint64.
    **/
    @:native("Uint64") function uint64(): (go.UInt64);
    /**
        Uint64N returns, as a uint64, a non-negative pseudo-random number in the half-open interval [0,n).
        It panics if n == 0.
    **/
    @:native("Uint64N") function uint64N(n: go.UInt64): (go.UInt64);
    /**
        UintN returns, as a uint, a non-negative pseudo-random number in the half-open interval [0,n).
        It panics if n == 0.
    **/
    @:native("UintN") function uintN(n: go.GoUInt): (go.GoUInt);

}