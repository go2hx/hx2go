package go.flag;

/**
    Value is the interface to the dynamic value stored in a flag.
    (The default value is represented as a string.)
    
    If a Value has an IsBoolFlag() bool method returning true,
    the command-line parser makes -name equivalent to -name=true
    rather than using the next command-line argument.
    
    Set is called once, in command line order, for each flag present.
    The flag package may call the [String] method with a zero-valued receiver,
    such as a nil pointer.
**/
@:go.Type({ name: "Value", instanceName: "flag.Value", imports: ["flag"] })
extern typedef Value = {

    @:native("Set") function set(p0: std.String): (go.Error);
    @:native("String") function string(): (std.String);

}