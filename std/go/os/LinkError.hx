package go.os;

/**
    LinkError records an error during a link or symlink or rename
    system call and the paths that caused it.
**/
@:structInit
@:go.Type({ name: "LinkError", instanceName: "os.LinkError", imports: ["os"] })
extern class LinkError {

    @:native("Op") var op: String;
    @:native("Old") var old: String;
    @:native("New") var _new: String;
    @:native("Err") var err: go.Error;

    function new(op: String="", old: String="", _new: String="", err: go.Error=null);

    @:native("Error") function error(): (String);
    @:native("Unwrap") function unwrap(): (go.Error);

}