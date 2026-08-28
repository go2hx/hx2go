package go.debug.dwarf;

/**
    An Entry is a sequence of attribute/value pairs.
**/
@:structInit
@:go.Type({ name: "Entry", instanceName: "dwarf.Entry", imports: ["debug/dwarf"] })
extern class Entry {

    @:native("Offset") var offset: go.debug.dwarf.Offset;
    @:native("Tag") var tag: go.debug.dwarf.Tag;
    @:native("Children") var children: Bool;
    @:native("Field") var field: go.Slice<go.debug.dwarf.Field>;

    function new(offset: go.debug.dwarf.Offset=cast 0, tag: go.debug.dwarf.Tag=cast 0, children: Bool=false, field: go.Slice<go.debug.dwarf.Field>=null);

    /**
        AttrField returns the [Field] associated with attribute [Attr] in
        [Entry], or nil if there is no such attribute.
    **/
    @:native("AttrField") function attrField(a: go.debug.dwarf.Attr): (go.Pointer<go.debug.dwarf.Field>);
    /**
        Val returns the value associated with attribute [Attr] in [Entry],
        or nil if there is no such attribute.
        
        A common idiom is to merge the check for nil return with
        the check that the value has the expected dynamic type, as in:
        
        	v, ok := e.Val(AttrSibling).(int64)
    **/
    @:native("Val") function val(a: go.debug.dwarf.Attr): (Dynamic);

}