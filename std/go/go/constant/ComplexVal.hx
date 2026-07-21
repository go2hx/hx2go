package go.go.constant;

@:structInit
@:go.Type({ name: "complexVal", instanceName: "constant.complexVal", imports: ["go/constant"] })
extern class ComplexVal {

    @:native("ExactString") function exactString(): (String);
    @:native("Kind") function kind(): (go.go.constant.Kind);
    @:native("String") function string(): (String);

}