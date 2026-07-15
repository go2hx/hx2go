package go.debug.plan9obj;

@:structInit
@:go.Type({ name: "Sym", instanceName: "plan9obj.Sym", imports: ["debug/plan9obj"] })
extern class Sym {

    @:native("Value") var value: go.UInt64;
    @:native("Type") var type: go.Rune;
    @:native("Name") var name: String;

function new(value: go.UInt64, type: go.Rune, name: String);

}