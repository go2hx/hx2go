package go.testing;

/**
    Package quick implements utility functions to help with black box testing.
    
    The testing/quick package is frozen and is not accepting new features.
**/
@:go.Type({ name: "quick", instanceName: "quick.quick", imports: ["testing/quick"] })
extern class Quick {

    /**
        Check looks for an input to f, any function that returns bool,
        such that f returns false. It calls f repeatedly, with arbitrary
        values for each argument. If f returns false on a given input,
        Check returns that input as a *[CheckError].
        For example:
        
        	func TestOddMultipleOfThree(t *testing.T) {
        		f := func(x int) bool {
        			y := OddMultipleOfThree(x)
        			return y%2 == 1 && y%3 == 0
        		}
        		if err := quick.Check(f, nil); err != nil {
        			t.Error(err)
        		}
        	}
    **/
    @:native("Check") static function check(f: Dynamic, config: go.Pointer<go.testing.quick.Config>): (go.Error);
    /**
        CheckEqual looks for an input on which f and g return different results.
        It calls f and g repeatedly with arbitrary values for each argument.
        If f and g return different answers, CheckEqual returns a *[CheckEqualError]
        describing the input and the outputs.
    **/
    @:native("CheckEqual") static function checkEqual(f: Dynamic, g: Dynamic, config: go.Pointer<go.testing.quick.Config>): (go.Error);
    /**
        Value returns an arbitrary value of the given type.
        If the type implements the [Generator] interface, that will be used.
        Note: To create arbitrary values for structs, all the fields must be exported.
    **/
    @:go.Tuple("value", "ok") @:native("Value") static function value(t: go.reflect.Type, rand: go.Pointer<go.math.rand.Rand>): (go.Tuple<{ value: go.reflect.Value, ok: Bool }>);

}