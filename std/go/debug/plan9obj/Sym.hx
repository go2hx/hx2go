package go.debug.plan9obj;

/**
    A Symbol represents an entry in a Plan 9 a.out symbol table section.
**/
@:structInit
@:go.Type({ name: "Sym", instanceName: "plan9obj.Sym", imports: ["debug/plan9obj"] })
extern class Sym {

    @:native("Value") var value: go.UInt64;
    @:native("Type") var type: go.Rune;
    @:native("Name") var name: String;

    function new(value: go.UInt64=0, type: go.Rune=0, name: String="");

}