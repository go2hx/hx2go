package go.os;

@:structInit
@:go.Type({ name: "root", instanceName: "os.root", imports: ["os"] })
extern class Root_ {

    @:native("Close") function close(): (go.Error);
    @:native("Name") function name(): (String);

}