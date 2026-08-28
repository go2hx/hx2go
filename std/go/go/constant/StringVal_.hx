package go.go.constant;

@:structInit
@:go.Type({ name: "stringVal", instanceName: "constant.stringVal", imports: ["go/constant"] })
extern class StringVal_ {

    @:native("ExactString") function exactString(): (std.String);
    @:native("Kind") function kind(): (go.go.constant.Kind);
    @:native("String") function string(): (std.String);

}