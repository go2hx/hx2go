package go.debug.dwarf;

@:structInit
@:go.Type({ name: "LineReader", instanceName: "dwarf.LineReader", imports: ["debug/dwarf"] })
extern class LineReader {

    @:native("Files") function files(): go.Slice<go.Pointer<go.debug.dwarf.LineFile>>;
    @:native("Next") function next(entry: go.Pointer<go.debug.dwarf.LineEntry>): go.Error;
    @:native("Reset") function reset(): Void;
    @:native("Seek") function seek(pos: go.debug.dwarf.LineReaderPos): Void;
    @:native("SeekPC") function seekPC(pc: go.UInt64, entry: go.Pointer<go.debug.dwarf.LineEntry>): go.Error;
    @:native("Tell") function tell(): go.debug.dwarf.LineReaderPos;

}