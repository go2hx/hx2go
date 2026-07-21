package go.go.types;

@:go.Type({ name: "termlist", instanceName: "types.termlist", imports: ["go/types"] })
extern class Termlist {

    @:native("String") function string(): (String);

}