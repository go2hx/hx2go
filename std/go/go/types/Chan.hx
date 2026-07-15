package go.go.types;

@:structInit
@:go.Type({ name: "Chan", instanceName: "types.Chan", imports: ["go/types"] })
extern class Chan {

    @:native("Dir") function dir(): go.go.types.ChanDir;
    @:native("Elem") function elem(): go.go.types.Type;
    @:native("String") function string(): String;
    @:native("Underlying") function underlying(): go.go.types.Type;

}