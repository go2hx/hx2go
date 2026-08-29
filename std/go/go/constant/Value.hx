package go.go.constant;

/**
    A Value represents the value of a Go constant.
**/
@:go.Type({ name: "Value", instanceName: "constant.Value", imports: ["go/constant"] })
extern typedef Value = {

    @:native("ExactString") function exactString(): (std.String);
    @:native("Kind") function kind(): (go.go.constant.Kind);
    @:native("String") function string(): (std.String);

}