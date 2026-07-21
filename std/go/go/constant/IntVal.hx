package go.go.constant;

@:structInit
@:go.Type({ name: "intVal", instanceName: "constant.intVal", imports: ["go/constant"] })
extern class IntVal {

    @:native("ExactString") function exactString(): (String);
    @:native("Kind") function kind(): (go.go.constant.Kind);
    @:native("String") function string(): (String);

}