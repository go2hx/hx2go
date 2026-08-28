package go.expvar;

/**
    String is a string variable, and satisfies the [Var] interface.
**/
@:structInit
@:go.Type({ name: "String", instanceName: "expvar.String", imports: ["expvar"] })
extern class String {

    @:native("Set") function set(value: std.String): Void;
    /**
        String implements the [Var] interface. To get the unquoted string
        use [String.Value].
    **/
    @:native("String") function string(): (std.String);
    @:native("Value") function value(): (std.String);

}