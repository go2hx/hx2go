package go.go.constant;

@:go.Type({ name: "Value", instanceName: "constant.Value", imports: ["go/constant"] })
extern typedef Value = {

    @:native("ExactString") function exactString(): String;
    @:native("Kind") function kind(): go.go.constant.Kind;
    @:native("String") function string(): String;

}