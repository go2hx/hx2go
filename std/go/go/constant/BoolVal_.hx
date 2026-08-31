package go.go.constant;

@:go.Type({ name: "boolVal", instanceName: "constant.boolVal", imports: ["go/constant"] })
extern typedef BoolVal_ = haxe.extern.EitherType<Bool, {
    @:native("ExactString") function exactString(): (std.String);
    @:native("Kind") function kind(): (go.go.constant.Kind);
    @:native("String") function string(): (std.String);

}>