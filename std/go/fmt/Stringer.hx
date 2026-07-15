package go.fmt;

@:go.Type({ name: "Stringer", instanceName: "fmt.Stringer", imports: ["fmt"] })
extern typedef Stringer = {

    @:native("String") function string(): String;

}