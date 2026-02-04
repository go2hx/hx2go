package go;

@:coreType
/**
 * Represents a multi-return-type in Haxe, these are to be used for interop and cannot be directly instantiated.
 * Whenever the return type of an extern function is a tuple, hx2go will do the necessary transformations to return multiple values.
 * Given `go.Tuple<{ first: Int, second: Bool }>` the function will return two values: an `Int` and a `Bool`. Order is important as the naming does not map to named return values in Go.
 **/
@:go.TypeAccess({}) // in some cases this may be required.
typedef Tuple<T> = T;

