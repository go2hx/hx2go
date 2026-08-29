package go.debug.dwarf;

/**
    A LineReader reads a sequence of [LineEntry] structures from a DWARF
    "line" section for a single compilation unit. LineEntries occur in
    order of increasing PC and each [LineEntry] gives metadata for the
    instructions from that [LineEntry]'s PC to just before the next
    [LineEntry]'s PC. The last entry will have the [LineEntry.EndSequence] field set.
**/
@:structInit
@:go.Type({ name: "LineReader", instanceName: "dwarf.LineReader", imports: ["debug/dwarf"] })
extern class LineReader {

    /**
        Files returns the file name table of this compilation unit as of
        the current position in the line table. The file name table may be
        referenced from attributes in this compilation unit such as
        [AttrDeclFile].
        
        Entry 0 is always nil, since file index 0 represents "no file".
        
        The file name table of a compilation unit is not fixed. Files
        returns the file table as of the current position in the line
        table. This may contain more entries than the file table at an
        earlier position in the line table, though existing entries never
        change.
    **/
    @:native("Files") function files(): (go.Slice<go.Pointer<go.debug.dwarf.LineFile>>);
    /**
        Next sets *entry to the next row in this line table and moves to
        the next row. If there are no more entries and the line table is
        properly terminated, it returns [io.EOF].
        
        Rows are always in order of increasing entry.Address, but
        entry.Line may go forward or backward.
    **/
    @:native("Next") function next(entry: go.Pointer<go.debug.dwarf.LineEntry>): (go.Error);
    /**
        Reset repositions the line table reader at the beginning of the
        line table.
    **/
    @:native("Reset") function reset(): Void;
    /**
        Seek restores the line table reader to a position returned by [LineReader.Tell].
        
        The argument pos must have been returned by a call to [LineReader.Tell] on this
        line table.
    **/
    @:native("Seek") function seek(pos: go.debug.dwarf.LineReaderPos): Void;
    /**
        SeekPC sets *entry to the [LineEntry] that includes pc and positions
        the reader on the next entry in the line table. If necessary, this
        will seek backwards to find pc.
        
        If pc is not covered by any entry in this line table, SeekPC
        returns [ErrUnknownPC]. In this case, *entry and the final seek
        position are unspecified.
        
        Note that DWARF line tables only permit sequential, forward scans.
        Hence, in the worst case, this takes time linear in the size of the
        line table. If the caller wishes to do repeated fast PC lookups, it
        should build an appropriate index of the line table.
    **/
    @:native("SeekPC") function seekPC(pc: go.UInt64, entry: go.Pointer<go.debug.dwarf.LineEntry>): (go.Error);
    /**
        Tell returns the current position in the line table.
    **/
    @:native("Tell") function tell(): (go.debug.dwarf.LineReaderPos);

}