package go.go.constant;

@:go.Type({ name: "int64Val", instanceName: "constant.int64Val", imports: ["go/constant"] })
extern typedef Int64Val_ = haxe.extern.EitherType<go.Int64, {
    @:native("ExactString") function exactString(): (String);
    @:native("Kind") function kind(): (go.go.constant.Kind);
    @:native("String") function string(): (String);

}>