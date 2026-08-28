package go.debug.dwarf;

/**
    A Reader allows reading [Entry] structures from a DWARF “info” section.
    The [Entry] structures are arranged in a tree. The [Reader.Next] function
    return successive entries from a pre-order traversal of the tree.
    If an entry has children, its Children field will be true, and the children
    follow, terminated by an [Entry] with [Tag] 0.
**/
@:structInit
@:go.Type({ name: "Reader", instanceName: "dwarf.Reader", imports: ["debug/dwarf"] })
extern class Reader {

    /**
        AddressSize returns the size in bytes of addresses in the current compilation
        unit.
    **/
    @:native("AddressSize") function addressSize(): (go.GoInt);
    /**
        ByteOrder returns the byte order in the current compilation unit.
    **/
    @:native("ByteOrder") function byteOrder(): (go.encoding.binary.ByteOrder);
    /**
        Next reads the next entry from the encoded entry stream.
        It returns nil, nil when it reaches the end of the section.
        It returns an error if the current offset is invalid or the data at the
        offset cannot be decoded as a valid [Entry].
    **/
    @:native("Next") function next(): (go.Result<go.Pointer<go.debug.dwarf.Entry>>);
    /**
        Seek positions the [Reader] at offset off in the encoded entry stream.
        Offset 0 can be used to denote the first entry.
    **/
    @:native("Seek") function seek(off: go.debug.dwarf.Offset): Void;
    /**
        SeekPC returns the [Entry] for the compilation unit that includes pc,
        and positions the reader to read the children of that unit.  If pc
        is not covered by any unit, SeekPC returns [ErrUnknownPC] and the
        position of the reader is undefined.
        
        Because compilation units can describe multiple regions of the
        executable, in the worst case SeekPC must search through all the
        ranges in all the compilation units. Each call to SeekPC starts the
        search at the compilation unit of the last call, so in general
        looking up a series of PCs will be faster if they are sorted. If
        the caller wishes to do repeated fast PC lookups, it should build
        an appropriate index using the Ranges method.
    **/
    @:native("SeekPC") function seekPC(pc: go.UInt64): (go.Result<go.Pointer<go.debug.dwarf.Entry>>);
    /**
        SkipChildren skips over the child entries associated with
        the last [Entry] returned by [Reader.Next]. If that [Entry] did not have
        children or [Reader.Next] has not been called, SkipChildren is a no-op.
    **/
    @:native("SkipChildren") function skipChildren(): Void;

}