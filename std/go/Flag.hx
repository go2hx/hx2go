package go;

/**
    Package flag implements command-line flag parsing.
    
    # Usage
    
    Define flags using [flag.String], [Bool], [Int], etc.
    
    This declares an integer flag, -n, stored in the pointer nFlag, with type *int:
    
    	import "flag"
    	var nFlag = flag.Int("n", 1234, "help message for flag n")
    
    If you like, you can bind the flag to a variable using the Var() functions.
    
    	var flagvar int
    	func init() {
    		flag.IntVar(&flagvar, "flagname", 1234, "help message for flagname")
    	}
    
    Or you can create custom flags that satisfy the Value interface (with
    pointer receivers) and couple them to flag parsing by
    
    	flag.Var(&flagVal, "name", "help message for flagname")
    
    For such flags, the default value is just the initial value of the variable.
    
    After all flags are defined, call
    
    	flag.Parse()
    
    to parse the command line into the defined flags.
    
    Flags may then be used directly. If you're using the flags themselves,
    they are all pointers; if you bind to variables, they're values.
    
    	fmt.Println("ip has value ", *ip)
    	fmt.Println("flagvar has value ", flagvar)
    
    After parsing, the arguments following the flags are available as the
    slice [flag.Args] or individually as [flag.Arg](i).
    The arguments are indexed from 0 through [flag.NArg]-1.
    
    # Command line flag syntax
    
    The following forms are permitted:
    
    	-flag
    	--flag   // double dashes are also permitted
    	-flag=x
    	-flag x  // non-boolean flags only
    
    One or two dashes may be used; they are equivalent.
    The last form is not permitted for boolean flags because the
    meaning of the command
    
    	cmd -x *
    
    where * is a Unix shell wildcard, will change if there is a file
    called 0, false, etc. You must use the -flag=false form to turn
    off a boolean flag.
    
    Flag parsing stops just before the first non-flag argument
    ("-" is a non-flag argument) or after the terminator "--".
    
    Integer flags accept 1234, 0664, 0x1234 and may be negative.
    Boolean flags may be:
    
    	1, 0, t, f, T, F, true, false, TRUE, FALSE, True, False
    
    Duration flags accept any input valid for time.ParseDuration.
    
    The default set of command-line flags is controlled by
    top-level functions.  The [FlagSet] type allows one to define
    independent sets of flags, such as to implement subcommands
    in a command-line interface. The methods of [FlagSet] are
    analogous to the top-level functions for the command-line
    flag set.
**/
@:go.Type({ name: "flag", instanceName: "flag.flag", imports: ["flag"] })
extern class Flag {

    /**
        These constants cause [FlagSet.Parse] to behave as described if the parse fails.
    **/
    @:native("ContinueOnError") static var continueOnError: go.flag.ErrorHandling;
    /**
        These constants cause [FlagSet.Parse] to behave as described if the parse fails.
    **/
    @:native("ExitOnError") static var exitOnError: go.flag.ErrorHandling;
    /**
        These constants cause [FlagSet.Parse] to behave as described if the parse fails.
    **/
    @:native("PanicOnError") static var panicOnError: go.flag.ErrorHandling;

    /**
        CommandLine is the default set of command-line flags, parsed from [os.Args].
        The top-level functions such as [BoolVar], [Arg], and so on are wrappers for the
        methods of CommandLine.
    **/
    @:native("CommandLine") static var commandLine: go.Pointer<go.flag.FlagSet>;
    /**
        Usage prints a usage message documenting all defined command-line flags
        to [CommandLine]'s output, which by default is [os.Stderr].
        It is called when an error occurs while parsing flags.
        The function is a variable that may be changed to point to a custom function.
        By default it prints a simple header and calls [PrintDefaults]; for details about the
        format of the output and how to control it, see the documentation for [PrintDefaults].
        Custom usage functions may choose to exit the program; by default exiting
        happens anyway as the command line's error handling strategy is set to
        [ExitOnError].
    **/
    @:native("Usage") static var usage: () -> Void;

    /**
        Arg returns the i'th command-line argument. Arg(0) is the first remaining argument
        after flags have been processed. Arg returns an empty string if the
        requested element does not exist.
    **/
    @:native("Arg") static function arg(i: go.GoInt): (std.String);
    /**
        Args returns the non-flag command-line arguments.
    **/
    @:native("Args") static function args(): (go.Slice<std.String>);
    /**
        Bool defines a bool flag with specified name, default value, and usage string.
        The return value is the address of a bool variable that stores the value of the flag.
    **/
    @:native("Bool") static function bool(name: std.String, value: Bool, usage: std.String): (go.Pointer<Bool>);
    /**
        BoolFunc defines a flag with the specified name and usage string without requiring values.
        Each time the flag is seen, fn is called with the value of the flag.
        If fn returns a non-nil error, it will be treated as a flag value parsing error.
    **/
    @:native("BoolFunc") static function boolFunc(name: std.String, usage: std.String, fn: (p0: std.String) -> (go.Error)): Void;
    /**
        BoolVar defines a bool flag with specified name, default value, and usage string.
        The argument p points to a bool variable in which to store the value of the flag.
    **/
    @:native("BoolVar") static function boolVar(p: go.Pointer<Bool>, name: std.String, value: Bool, usage: std.String): Void;
    /**
        Duration defines a time.Duration flag with specified name, default value, and usage string.
        The return value is the address of a time.Duration variable that stores the value of the flag.
        The flag accepts a value acceptable to time.ParseDuration.
    **/
    @:native("Duration") static function duration(name: std.String, value: go.time.Duration, usage: std.String): (go.Pointer<go.time.Duration>);
    /**
        DurationVar defines a time.Duration flag with specified name, default value, and usage string.
        The argument p points to a time.Duration variable in which to store the value of the flag.
        The flag accepts a value acceptable to time.ParseDuration.
    **/
    @:native("DurationVar") static function durationVar(p: go.Pointer<go.time.Duration>, name: std.String, value: go.time.Duration, usage: std.String): Void;
    /**
        Float64 defines a float64 flag with specified name, default value, and usage string.
        The return value is the address of a float64 variable that stores the value of the flag.
    **/
    @:native("Float64") static function float64(name: std.String, value: Float, usage: std.String): (go.Pointer<Float>);
    /**
        Float64Var defines a float64 flag with specified name, default value, and usage string.
        The argument p points to a float64 variable in which to store the value of the flag.
    **/
    @:native("Float64Var") static function float64Var(p: go.Pointer<Float>, name: std.String, value: Float, usage: std.String): Void;
    /**
        Func defines a flag with the specified name and usage string.
        Each time the flag is seen, fn is called with the value of the flag.
        If fn returns a non-nil error, it will be treated as a flag value parsing error.
    **/
    @:native("Func") static function func(name: std.String, usage: std.String, fn: (p0: std.String) -> (go.Error)): Void;
    /**
        Int defines an int flag with specified name, default value, and usage string.
        The return value is the address of an int variable that stores the value of the flag.
    **/
    @:native("Int") static function int(name: std.String, value: go.GoInt, usage: std.String): (go.Pointer<go.GoInt>);
    /**
        Int64 defines an int64 flag with specified name, default value, and usage string.
        The return value is the address of an int64 variable that stores the value of the flag.
    **/
    @:native("Int64") static function int64(name: std.String, value: go.Int64, usage: std.String): (go.Pointer<go.Int64>);
    /**
        Int64Var defines an int64 flag with specified name, default value, and usage string.
        The argument p points to an int64 variable in which to store the value of the flag.
    **/
    @:native("Int64Var") static function int64Var(p: go.Pointer<go.Int64>, name: std.String, value: go.Int64, usage: std.String): Void;
    /**
        IntVar defines an int flag with specified name, default value, and usage string.
        The argument p points to an int variable in which to store the value of the flag.
    **/
    @:native("IntVar") static function intVar(p: go.Pointer<go.GoInt>, name: std.String, value: go.GoInt, usage: std.String): Void;
    /**
        Lookup returns the [Flag] structure of the named command-line flag,
        returning nil if none exists.
    **/
    @:native("Lookup") static function lookup(name: std.String): (go.Pointer<go.flag.Flag>);
    /**
        NArg is the number of arguments remaining after flags have been processed.
    **/
    @:native("NArg") static function nArg(): (go.GoInt);
    /**
        NFlag returns the number of command-line flags that have been set.
    **/
    @:native("NFlag") static function nFlag(): (go.GoInt);
    /**
        NewFlagSet returns a new, empty flag set with the specified name and
        error handling property. If the name is not empty, it will be printed
        in the default usage message and in error messages.
    **/
    @:native("NewFlagSet") static function newFlagSet(name: std.String, errorHandling: go.flag.ErrorHandling): (go.Pointer<go.flag.FlagSet>);
    /**
        Parse parses the command-line flags from [os.Args][1:]. Must be called
        after all flags are defined and before flags are accessed by the program.
    **/
    @:native("Parse") static function parse(): Void;
    /**
        Parsed reports whether the command-line flags have been parsed.
    **/
    @:native("Parsed") static function parsed(): (Bool);
    /**
        PrintDefaults prints, to standard error unless configured otherwise,
        a usage message showing the default settings of all defined
        command-line flags.
        For an integer valued flag x, the default output has the form
        
        	-x int
        		usage-message-for-x (default 7)
        
        The usage message will appear on a separate line for anything but
        a bool flag with a one-byte name. For bool flags, the type is
        omitted and if the flag name is one byte the usage message appears
        on the same line. The parenthetical default is omitted if the
        default is the zero value for the type. The listed type, here int,
        can be changed by placing a back-quoted name in the flag's usage
        string; the first such item in the message is taken to be a parameter
        name to show in the message and the back quotes are stripped from
        the message when displayed. For instance, given
        
        	flag.String("I", "", "search `directory` for include files")
        
        the output will be
        
        	-I directory
        		search directory for include files.
        
        To change the destination for flag messages, call [CommandLine].SetOutput.
    **/
    @:native("PrintDefaults") static function printDefaults(): Void;
    /**
        Set sets the value of the named command-line flag.
    **/
    @:native("Set") static function set(name: std.String, value: std.String): (go.Error);
    /**
        String defines a string flag with specified name, default value, and usage string.
        The return value is the address of a string variable that stores the value of the flag.
    **/
    @:native("String") static function string(name: std.String, value: std.String, usage: std.String): (go.Pointer<std.String>);
    /**
        StringVar defines a string flag with specified name, default value, and usage string.
        The argument p points to a string variable in which to store the value of the flag.
    **/
    @:native("StringVar") static function stringVar(p: go.Pointer<std.String>, name: std.String, value: std.String, usage: std.String): Void;
    /**
        TextVar defines a flag with a specified name, default value, and usage string.
        The argument p must be a pointer to a variable that will hold the value
        of the flag, and p must implement encoding.TextUnmarshaler.
        If the flag is used, the flag value will be passed to p's UnmarshalText method.
        The type of the default value must be the same as the type of p.
    **/
    @:native("TextVar") static function textVar(p: go.encoding.TextUnmarshaler, name: std.String, value: go.encoding.TextMarshaler, usage: std.String): Void;
    /**
        Uint defines a uint flag with specified name, default value, and usage string.
        The return value is the address of a uint variable that stores the value of the flag.
    **/
    @:native("Uint") static function uint(name: std.String, value: go.GoUInt, usage: std.String): (go.Pointer<go.GoUInt>);
    /**
        Uint64 defines a uint64 flag with specified name, default value, and usage string.
        The return value is the address of a uint64 variable that stores the value of the flag.
    **/
    @:native("Uint64") static function uint64(name: std.String, value: go.UInt64, usage: std.String): (go.Pointer<go.UInt64>);
    /**
        Uint64Var defines a uint64 flag with specified name, default value, and usage string.
        The argument p points to a uint64 variable in which to store the value of the flag.
    **/
    @:native("Uint64Var") static function uint64Var(p: go.Pointer<go.UInt64>, name: std.String, value: go.UInt64, usage: std.String): Void;
    /**
        UintVar defines a uint flag with specified name, default value, and usage string.
        The argument p points to a uint variable in which to store the value of the flag.
    **/
    @:native("UintVar") static function uintVar(p: go.Pointer<go.GoUInt>, name: std.String, value: go.GoUInt, usage: std.String): Void;
    /**
        UnquoteUsage extracts a back-quoted name from the usage
        string for a flag and returns it and the un-quoted usage.
        Given "a `name` to show" it returns ("name", "a name to show").
        If there are no back quotes, the name is an educated guess of the
        type of the flag's value, or the empty string if the flag is boolean.
    **/
    @:go.Tuple("name", "usage") @:native("UnquoteUsage") static function unquoteUsage(flag: go.Pointer<go.flag.Flag>): (go.Tuple<{ name: std.String, usage: std.String }>);
    /**
        Var defines a flag with the specified name and usage string. The type and
        value of the flag are represented by the first argument, of type [Value], which
        typically holds a user-defined implementation of [Value]. For instance, the
        caller could create a flag that turns a comma-separated string into a slice
        of strings by giving the slice the methods of [Value]; in particular, [Set] would
        decompose the comma-separated string into the slice.
    **/
    @:native("Var") static function _var(value: go.flag.Value, name: std.String, usage: std.String): Void;
    /**
        Visit visits the command-line flags in lexicographical order, calling fn
        for each. It visits only those flags that have been set.
    **/
    @:native("Visit") static function visit(fn: (p0: go.Pointer<go.flag.Flag>) -> Void): Void;
    /**
        VisitAll visits the command-line flags in lexicographical order, calling
        fn for each. It visits all flags, even those not set.
    **/
    @:native("VisitAll") static function visitAll(fn: (p0: go.Pointer<go.flag.Flag>) -> Void): Void;

}