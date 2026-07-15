package go.go.types;

@:structInit
@:go.Type({ name: "Basic", instanceName: "types.Basic", imports: ["go/types"] })
extern class Basic {

    @:native("Info") function info(): go.go.types.BasicInfo;
    @:native("Kind") function kind(): go.go.types.BasicKind;
    @:native("Name") function name(): String;
    @:native("String") function string(): String;
    @:native("Underlying") function underlying(): go.go.types.Type;

}