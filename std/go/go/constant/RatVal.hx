package go.go.constant;

@:structInit
@:go.Type({ name: "ratVal", instanceName: "constant.ratVal", imports: ["go/constant"] })
extern class RatVal {

    @:native("ExactString") function exactString(): (std.String);
    @:native("Kind") function kind(): (go.go.constant.Kind);
    @:native("String") function string(): (std.String);

}