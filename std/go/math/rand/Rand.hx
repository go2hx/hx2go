package go.math.rand;

/**
    A Rand is a source of random numbers.
**/
@:structInit
@:go.Type({ name: "Rand", instanceName: "rand.Rand", imports: ["math/rand"] })
extern class Rand {

    /**
        ExpFloat64 returns an exponentially distributed float64 in the range
        (0, +[math.MaxFloat64]] with an exponential distribution whose rate parameter
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
        Int31 returns a non-negative pseudo-random 31-bit integer as an int32.
    **/
    @:native("Int31") function int31(): (go.Int32);
    /**
        Int31n returns, as an int32, a non-negative pseudo-random number in the half-open interval [0,n).
        It panics if n <= 0.
    **/
    @:native("Int31n") function int31n(n: go.Int32): (go.Int32);
    /**
        Int63 returns a non-negative pseudo-random 63-bit integer as an int64.
    **/
    @:native("Int63") function int63(): (go.Int64);
    /**
        Int63n returns, as an int64, a non-negative pseudo-random number in the half-open interval [0,n).
        It panics if n <= 0.
    **/
    @:native("Int63n") function int63n(n: go.Int64): (go.Int64);
    /**
        Intn returns, as an int, a non-negative pseudo-random number in the half-open interval [0,n).
        It panics if n <= 0.
    **/
    @:native("Intn") function intn(n: go.GoInt): (go.GoInt);
    /**
        NormFloat64 returns a normally distributed float64 in
        the range -[math.MaxFloat64] through +[math.MaxFloat64] inclusive,
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
        Read generates len(p) random bytes and writes them into p. It
        always returns len(p) and a nil error.
        Read should not be called concurrently with any other Rand method.
    **/
    @:native("Read") function read(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);
    /**
        Seed uses the provided seed value to initialize the generator to a deterministic state.
        Seed should not be called concurrently with any other [Rand] method.
    **/
    @:native("Seed") function seed(seed: go.Int64): Void;
    /**
        Shuffle pseudo-randomizes the order of elements.
        n is the number of elements. Shuffle panics if n < 0.
        swap swaps the elements with indexes i and j.
    **/
    @:native("Shuffle") function shuffle(n: go.GoInt, swap: (i: go.GoInt, j: go.GoInt) -> Void): Void;
    /**
        Uint32 returns a pseudo-random 32-bit value as a uint32.
    **/
    @:native("Uint32") function uint32(): (go.UInt32);
    /**
        Uint64 returns a pseudo-random 64-bit value as a uint64.
    **/
    @:native("Uint64") function uint64(): (go.UInt64);

}