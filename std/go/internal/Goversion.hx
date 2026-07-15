package go.internal;

@:go.Type({ name: "goversion", instanceName: "goversion.goversion", imports: ["internal/goversion"] })
extern class Goversion {

    @:native("Version") static var Version: go.GoInt;

}