package go.go.constant;

@:structInit
@:go.Type({ name: "floatVal", instanceName: "constant.floatVal", imports: ["go/constant"] })
extern class FloatVal {

    @:native("ExactString") function exactString(): (String);
    @:native("Kind") function kind(): (go.go.constant.Kind);
    @:native("String") function string(): (String);

}