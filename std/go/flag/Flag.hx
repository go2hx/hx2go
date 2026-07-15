package go.flag;

@:structInit
@:go.Type({ name: "Flag", instanceName: "flag.Flag", imports: ["flag"] })
extern class Flag {

    @:native("Name") var name: String;
    @:native("Usage") var usage: String;
    @:native("Value") var value: go.flag.Value;
    @:native("DefValue") var defValue: String;

function new(name: String, usage: String, value: go.flag.Value, defValue: String);

}