package go.os;

@:structInit
@:go.Type({ name: "LinkError", instanceName: "os.LinkError", imports: ["os"] })
extern class LinkError {

    @:native("Op") var op: String;
    @:native("Old") var old: String;
    @:native("New") var _new: String;
    @:native("Err") var err: go.Error;

function new(op: String, old: String, _new: String, err: go.Error);

    @:native("Error") function error(): String;
    @:native("Unwrap") function unwrap(): go.Error;

}