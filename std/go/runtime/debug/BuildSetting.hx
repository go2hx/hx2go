package go.runtime.debug;

@:structInit
@:go.Type({ name: "BuildSetting", instanceName: "debug.BuildSetting", imports: ["runtime/debug"] })
extern class BuildSetting {

    @:native("Key") var key: String;
    @:native("Value") var value: String;

function new(key: String, value: String);

}