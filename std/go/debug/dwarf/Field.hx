package go.debug.dwarf;

@:structInit
@:go.Type({ name: "Field", instanceName: "dwarf.Field", imports: ["debug/dwarf"] })
extern class Field {

    @:native("Attr") var attr: go.debug.dwarf.Attr;
    @:native("Val") var val: Dynamic;
    @:native("Class") var _class: go.debug.dwarf.Class;

function new(attr: go.debug.dwarf.Attr, val: Dynamic, _class: go.debug.dwarf.Class);

}