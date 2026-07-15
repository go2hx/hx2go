package go.net.textproto;

@:structInit
@:go.Type({ name: "Error", instanceName: "textproto.Error", imports: ["net/textproto"] })
extern class Error {

    @:native("Code") var code: go.GoInt;
    @:native("Msg") var msg: String;

function new(code: go.GoInt, msg: String);

    @:native("Error") function error(): String;

}