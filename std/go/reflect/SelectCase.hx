package go.reflect;

@:structInit
@:go.Type({ name: "SelectCase", instanceName: "reflect.SelectCase", imports: ["reflect"] })
extern class SelectCase {

    @:native("Dir") var dir: go.reflect.SelectDir;
    @:native("Chan") var chan: go.reflect.Value;
    @:native("Send") var send: go.reflect.Value;

    function new(dir: go.reflect.SelectDir, chan: go.reflect.Value, send: go.reflect.Value);

}