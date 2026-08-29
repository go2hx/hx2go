package go.flag;

/**
    A FlagSet represents a set of defined flags. The zero value of a FlagSet
    has no name and has [ContinueOnError] error handling.
    
    [Flag] names must be unique within a FlagSet. An attempt to define a flag whose
    name is already in use will cause a panic.
**/
@:structInit
@:go.Type({ name: "FlagSet", instanceName: "flag.FlagSet", imports: ["flag"] })
extern class FlagSet {

    @:native("Usage") var usage: () -> Void;

    function new(usage: () -> Void=null);

    /**
        Arg returns the i'th argument. Arg(0) is the first remaining argument
        after flags have been processed. Arg returns an empty string if the
        requested element does not exist.
    **/
    @:native("Arg") function arg(i: go.GoInt): (std.String);
    /**
        Args returns the non-flag arguments.
    **/
    @:native("Args") function args(): (go.Slice<std.String>);
    /**
        Bool defines a bool flag with specified name, default value, and usage string.
        The return value is the address of a bool variable that stores the value of the flag.
    **/
    @:native("Bool") function bool(name: std.String, value: Bool, usage: std.String): (go.Pointer<Bool>);
    /**
        BoolFunc defines a flag with the specified name and usage string without requiring values.
        Each time the flag is seen, fn is called with the value of the flag.
        If fn returns a non-nil error, it will be treated as a flag value parsing error.
    **/
    @:native("BoolFunc") function boolFunc(name: std.String, usage: std.String, fn: (p0: std.String) -> (go.Error)): Void;
    /**
        BoolVar defines a bool flag with specified name, default value, and usage string.
        The argument p points to a bool variable in which to store the value of the flag.
    **/
    @:native("BoolVar") function boolVar(p: go.Pointer<Bool>, name: std.String, value: Bool, usage: std.String): Void;
    /**
        Duration defines a time.Duration flag with specified name, default value, and usage string.
        The return value is the address of a time.Duration variable that stores the value of the flag.
        The flag accepts a value acceptable to time.ParseDuration.
    **/
    @:native("Duration") function duration(name: std.String, value: go.time.Duration, usage: std.String): (go.Pointer<go.time.Duration>);
    /**
        DurationVar defines a time.Duration flag with specified name, default value, and usage string.
        The argument p points to a time.Duration variable in which to store the value of the flag.
        The flag accepts a value acceptable to time.ParseDuration.
    **/
    @:native("DurationVar") function durationVar(p: go.Pointer<go.time.Duration>, name: std.String, value: go.time.Duration, usage: std.String): Void;
    /**
        ErrorHandling returns the error handling behavior of the flag set.
    **/
    @:native("ErrorHandling") function errorHandling(): (go.flag.ErrorHandling);
    /**
        Float64 defines a float64 flag with specified name, default value, and usage string.
        The return value is the address of a float64 variable that stores the value of the flag.
    **/
    @:native("Float64") function float64(name: std.String, value: Float, usage: std.String): (go.Pointer<Float>);
    /**
        Float64Var defines a float64 flag with specified name, default value, and usage string.
        The argument p points to a float64 variable in which to store the value of the flag.
    **/
    @:native("Float64Var") function float64Var(p: go.Pointer<Float>, name: std.String, value: Float, usage: std.String): Void;
    /**
        Func defines a flag with the specified name and usage string.
        Each time the flag is seen, fn is called with the value of the flag.
        If fn returns a non-nil error, it will be treated as a flag value parsing error.
    **/
    @:native("Func") function func(name: std.String, usage: std.String, fn: (p0: std.String) -> (go.Error)): Void;
    /**
        Init sets the name and error handling property for a flag set.
        By default, the zero [FlagSet] uses an empty name and the
        [ContinueOnError] error handling policy.
    **/
    @:native("Init") function init(name: std.String, errorHandling: go.flag.ErrorHandling): Void;
    /**
        Int defines an int flag with specified name, default value, and usage string.
        The return value is the address of an int variable that stores the value of the flag.
    **/
    @:native("Int") function int(name: std.String, value: go.GoInt, usage: std.String): (go.Pointer<go.GoInt>);
    /**
        Int64 defines an int64 flag with specified name, default value, and usage string.
        The return value is the address of an int64 variable that stores the value of the flag.
    **/
    @:native("Int64") function int64(name: std.String, value: go.Int64, usage: std.String): (go.Pointer<go.Int64>);
    /**
        Int64Var defines an int64 flag with specified name, default value, and usage string.
        The argument p points to an int64 variable in which to store the value of the flag.
    **/
    @:native("Int64Var") function int64Var(p: go.Pointer<go.Int64>, name: std.String, value: go.Int64, usage: std.String): Void;
    /**
        IntVar defines an int flag with specified name, default value, and usage string.
        The argument p points to an int variable in which to store the value of the flag.
    **/
    @:native("IntVar") function intVar(p: go.Pointer<go.GoInt>, name: std.String, value: go.GoInt, usage: std.String): Void;
    /**
        Lookup returns the [Flag] structure of the named flag, returning nil if none exists.
    **/
    @:native("Lookup") function lookup(name: std.String): (go.Pointer<go.flag.Flag>);
    /**
        NArg is the number of arguments remaining after flags have been processed.
    **/
    @:native("NArg") function nArg(): (go.GoInt);
    /**
        NFlag returns the number of flags that have been set.
    **/
    @:native("NFlag") function nFlag(): (go.GoInt);
    /**
        Name returns the name of the flag set.
    **/
    @:native("Name") function name(): (std.String);
    /**
        Output returns the destination for usage and error messages. [os.Stderr] is returned if
        output was not set or was set to nil.
    **/
    @:native("Output") function output(): (go.io.Writer);
    /**
        Parse parses flag definitions from the argument list, which should not
        include the command name. Must be called after all flags in the [FlagSet]
        are defined and before flags are accessed by the program.
        The return value will be [ErrHelp] if -help or -h were set but not defined.
    **/
    @:native("Parse") function parse(arguments: go.Slice<std.String>): (go.Error);
    /**
        Parsed reports whether f.Parse has been called.
    **/
    @:native("Parsed") function parsed(): (Bool);
    /**
        PrintDefaults prints, to standard error unless configured otherwise, the
        default values of all defined command-line flags in the set. See the
        documentation for the global function PrintDefaults for more information.
    **/
    @:native("PrintDefaults") function printDefaults(): Void;
    /**
        Set sets the value of the named flag.
    **/
    @:native("Set") function set(name: std.String, value: std.String): (go.Error);
    /**
        SetOutput sets the destination for usage and error messages.
        If output is nil, [os.Stderr] is used.
    **/
    @:native("SetOutput") function setOutput(output: go.io.Writer): Void;
    /**
        String defines a string flag with specified name, default value, and usage string.
        The return value is the address of a string variable that stores the value of the flag.
    **/
    @:native("String") function string(name: std.String, value: std.String, usage: std.String): (go.Pointer<std.String>);
    /**
        StringVar defines a string flag with specified name, default value, and usage string.
        The argument p points to a string variable in which to store the value of the flag.
    **/
    @:native("StringVar") function stringVar(p: go.Pointer<std.String>, name: std.String, value: std.String, usage: std.String): Void;
    /**
        TextVar defines a flag with a specified name, default value, and usage string.
        The argument p must be a pointer to a variable that will hold the value
        of the flag, and p must implement encoding.TextUnmarshaler.
        If the flag is used, the flag value will be passed to p's UnmarshalText method.
        The type of the default value must be the same as the type of p.
    **/
    @:native("TextVar") function textVar(p: go.encoding.TextUnmarshaler, name: std.String, value: go.encoding.TextMarshaler, usage: std.String): Void;
    /**
        Uint defines a uint flag with specified name, default value, and usage string.
        The return value is the address of a uint variable that stores the value of the flag.
    **/
    @:native("Uint") function uint(name: std.String, value: go.GoUInt, usage: std.String): (go.Pointer<go.GoUInt>);
    /**
        Uint64 defines a uint64 flag with specified name, default value, and usage string.
        The return value is the address of a uint64 variable that stores the value of the flag.
    **/
    @:native("Uint64") function uint64(name: std.String, value: go.UInt64, usage: std.String): (go.Pointer<go.UInt64>);
    /**
        Uint64Var defines a uint64 flag with specified name, default value, and usage string.
        The argument p points to a uint64 variable in which to store the value of the flag.
    **/
    @:native("Uint64Var") function uint64Var(p: go.Pointer<go.UInt64>, name: std.String, value: go.UInt64, usage: std.String): Void;
    /**
        UintVar defines a uint flag with specified name, default value, and usage string.
        The argument p points to a uint variable in which to store the value of the flag.
    **/
    @:native("UintVar") function uintVar(p: go.Pointer<go.GoUInt>, name: std.String, value: go.GoUInt, usage: std.String): Void;
    /**
        Var defines a flag with the specified name and usage string. The type and
        value of the flag are represented by the first argument, of type [Value], which
        typically holds a user-defined implementation of [Value]. For instance, the
        caller could create a flag that turns a comma-separated string into a slice
        of strings by giving the slice the methods of [Value]; in particular, [Set] would
        decompose the comma-separated string into the slice.
    **/
    @:native("Var") function _var(value: go.flag.Value, name: std.String, usage: std.String): Void;
    /**
        Visit visits the flags in lexicographical order, calling fn for each.
        It visits only those flags that have been set.
    **/
    @:native("Visit") function visit(fn: (p0: go.Pointer<go.flag.Flag>) -> Void): Void;
    /**
        VisitAll visits the flags in lexicographical order, calling fn for each.
        It visits all flags, even those not set.
    **/
    @:native("VisitAll") function visitAll(fn: (p0: go.Pointer<go.flag.Flag>) -> Void): Void;

}