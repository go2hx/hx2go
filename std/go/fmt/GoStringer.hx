package go.fmt;

@:go.Type({ name: "GoStringer", instanceName: "fmt.GoStringer", imports: ["fmt"] })
extern typedef GoStringer = {

    @:native("GoString") function goString(): String;

}