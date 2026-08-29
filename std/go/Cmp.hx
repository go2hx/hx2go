package go;

/**
    Package cmp provides types and functions related to comparing
    ordered values.
**/
@:go.Type({ name: "cmp", instanceName: "cmp.cmp", imports: ["cmp"] })
extern class Cmp {

    /**
        Compare returns
        
        	-1 if x is less than y,
        	 0 if x equals y,
        	+1 if x is greater than y.
        
        For floating-point types, a NaN is considered less than any non-NaN,
        a NaN is considered equal to a NaN, and -0.0 is equal to 0.0.
    **/
    @:native("Compare") static function compare<T: go.cmp.Ordered>(x: T, y: T): (go.GoInt);
    /**
        Less reports whether x is less than y.
        For floating-point types, a NaN is considered less than any non-NaN,
        and -0.0 is not less than (is equal to) 0.0.
    **/
    @:native("Less") static function less<T: go.cmp.Ordered>(x: T, y: T): (Bool);
    /**
        Or returns the first of its arguments that is not equal to the zero value.
        If no argument is non-zero, it returns the zero value.
    **/
    @:native("Or") static function or<T: go.Comparable>(vals: haxe.Rest<T>): (T);

}