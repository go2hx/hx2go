package go.debug.dwarf;

@:structInit
@:go.Type({ name: "Entry", instanceName: "dwarf.Entry", imports: ["debug/dwarf"] })
extern class Entry {

    @:native("Offset") var offset: go.debug.dwarf.Offset;
    @:native("Tag") var tag: go.debug.dwarf.Tag;
    @:native("Children") var children: Bool;
    @:native("Field") var field: go.Slice<go.debug.dwarf.Field>;

function new(offset: go.debug.dwarf.Offset, tag: go.debug.dwarf.Tag, children: Bool, field: go.Slice<go.debug.dwarf.Field>);

    @:native("AttrField") function attrField(a: go.debug.dwarf.Attr): go.Pointer<go.debug.dwarf.Field>;
    @:native("Val") function val(a: go.debug.dwarf.Attr): Dynamic;

}