package go.math.rand.v2;

@:go.Type({ name: "rand", instanceName: "rand.rand", imports: ["math/rand/v2"] })
extern class Rand_ {

    /**
        ExpFloat64 returns an exponentially distributed float64 in the range
        (0, +math.MaxFloat64] with an exponential distribution whose rate parameter
        (lambda) is 1 and whose mean is 1/lambda (1) from the default Source.
        To produce a distribution with a different rate parameter,
        callers can adjust the output using:
        
        	sample = ExpFloat64() / desiredRateParameter
    **/
    @:native("ExpFloat64") static function expFloat64(): (Float);
    /**
        Float32 returns, as a float32, a pseudo-random number in the half-open interval [0.0,1.0)
        from the default Source.
    **/
    @:native("Float32") static function float32(): (go.Float32);
    /**
        Float64 returns, as a float64, a pseudo-random number in the half-open interval [0.0,1.0)
        from the default Source.
    **/
    @:native("Float64") static function float64(): (Float);
    /**
        Int returns a non-negative pseudo-random int from the default Source.
    **/
    @:native("Int") static function int(): (go.GoInt);
    /**
        Int32 returns a non-negative pseudo-random 31-bit integer as an int32
        from the default Source.
    **/
    @:native("Int32") static function int32(): (go.Int32);
    /**
        Int32N returns, as an int32, a pseudo-random number in the half-open interval [0,n)
        from the default Source.
        It panics if n <= 0.
    **/
    @:native("Int32N") static function int32N(n: go.Int32): (go.Int32);
    /**
        Int64 returns a non-negative pseudo-random 63-bit integer as an int64
        from the default Source.
    **/
    @:native("Int64") static function int64(): (go.Int64);
    /**
        Int64N returns, as an int64, a pseudo-random number in the half-open interval [0,n)
        from the default Source.
        It panics if n <= 0.
    **/
    @:native("Int64N") static function int64N(n: go.Int64): (go.Int64);
    /**
        IntN returns, as an int, a pseudo-random number in the half-open interval [0,n)
        from the default Source.
        It panics if n <= 0.
    **/
    @:native("IntN") static function intN(n: go.GoInt): (go.GoInt);
    /**
        N returns a pseudo-random number in the half-open interval [0,n) from the default Source.
        The type parameter Int can be any integer type.
        It panics if n <= 0.
    **/
    @:native("N") static function N<Int: go.math.rand.v2.IntType>(n: Int): (Int);
    /**
        New returns a new Rand that uses random values from src
        to generate other random values.
    **/
    @:native("New") static function _new(src: go.math.rand.v2.Source): (go.Pointer<go.math.rand.v2.Rand>);
    /**
        NewChaCha8 returns a new ChaCha8 seeded with the given seed.
    **/
    @:native("NewChaCha8") static function newChaCha8(seed: go.GoArray<go.Byte, 32>): (go.Pointer<go.math.rand.v2.ChaCha8>);
    /**
        NewPCG returns a new PCG seeded with the given values.
    **/
    @:native("NewPCG") static function newPCG(seed1: go.UInt64, seed2: go.UInt64): (go.Pointer<go.math.rand.v2.PCG>);
    /**
        NewZipf returns a Zipf variate generator.
        The generator generates values k ∈ [0, imax]
        such that P(k) is proportional to (v + k) ** (-s).
        Requirements: s > 1 and v >= 1.
    **/
    @:native("NewZipf") static function newZipf(r: go.Pointer<go.math.rand.v2.Rand>, s: Float, v: Float, imax: go.UInt64): (go.Pointer<go.math.rand.v2.Zipf>);
    /**
        NormFloat64 returns a normally distributed float64 in the range
        [-math.MaxFloat64, +math.MaxFloat64] with
        standard normal distribution (mean = 0, stddev = 1)
        from the default Source.
        To produce a different normal distribution, callers can
        adjust the output using:
        
        	sample = NormFloat64() * desiredStdDev + desiredMean
    **/
    @:native("NormFloat64") static function normFloat64(): (Float);
    /**
        Perm returns, as a slice of n ints, a pseudo-random permutation of the integers
        in the half-open interval [0,n) from the default Source.
    **/
    @:native("Perm") static function perm(n: go.GoInt): (go.Slice<go.GoInt>);
    /**
        Shuffle pseudo-randomizes the order of elements using the default Source.
        n is the number of elements. Shuffle panics if n < 0.
        swap swaps the elements with indexes i and j.
    **/
    @:native("Shuffle") static function shuffle(n: go.GoInt, swap: (i: go.GoInt, j: go.GoInt) -> Void): Void;
    /**
        Uint returns a pseudo-random uint from the default Source.
    **/
    @:native("Uint") static function uint(): (go.GoUInt);
    /**
        Uint32 returns a pseudo-random 32-bit value as a uint32
        from the default Source.
    **/
    @:native("Uint32") static function uint32(): (go.UInt32);
    /**
        Uint32N returns, as a uint32, a pseudo-random number in the half-open interval [0,n)
        from the default Source.
        It panics if n == 0.
    **/
    @:native("Uint32N") static function uint32N(n: go.UInt32): (go.UInt32);
    /**
        Uint64 returns a pseudo-random 64-bit value as a uint64
        from the default Source.
    **/
    @:native("Uint64") static function uint64(): (go.UInt64);
    /**
        Uint64N returns, as a uint64, a pseudo-random number in the half-open interval [0,n)
        from the default Source.
        It panics if n == 0.
    **/
    @:native("Uint64N") static function uint64N(n: go.UInt64): (go.UInt64);
    /**
        UintN returns, as a uint, a pseudo-random number in the half-open interval [0,n)
        from the default Source.
        It panics if n == 0.
    **/
    @:native("UintN") static function uintN(n: go.GoUInt): (go.GoUInt);

}