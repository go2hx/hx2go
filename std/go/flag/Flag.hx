package go.flag;

/**
    A Flag represents the state of a flag.
**/
@:structInit
@:go.Type({ name: "Flag", instanceName: "flag.Flag", imports: ["flag"] })
extern class Flag {

    @:native("Name") var name: std.String;
    @:native("Usage") var usage: std.String;
    @:native("Value") var value: go.flag.Value;
    @:native("DefValue") var defValue: std.String;

    function new(name: std.String="", usage: std.String="", value: go.flag.Value=null, defValue: std.String="");

}