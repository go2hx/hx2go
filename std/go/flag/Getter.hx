package go.flag;

/**
    Getter is an interface that allows the contents of a [Value] to be retrieved.
    It wraps the [Value] interface, rather than being part of it, because it
    appeared after Go 1 and its compatibility rules. All [Value] types provided
    by this package satisfy the [Getter] interface, except the type used by [Func].
**/
@:go.Type({ name: "Getter", instanceName: "flag.Getter", imports: ["flag"] })
extern typedef Getter = {

    @:native("Get") function get(): (Dynamic);
    @:native("Set") function set(p0: std.String): (go.Error);
    @:native("String") function string(): (std.String);

}