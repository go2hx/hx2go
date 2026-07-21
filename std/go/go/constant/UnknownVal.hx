package go.go.constant;

@:structInit
@:go.Type({ name: "unknownVal", instanceName: "constant.unknownVal", imports: ["go/constant"] })
extern class UnknownVal {

    @:native("ExactString") function exactString(): (String);
    @:native("Kind") function kind(): (go.go.constant.Kind);
    @:native("String") function string(): (String);

}