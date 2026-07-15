package go.debug.dwarf;

@:structInit
@:go.Type({ name: "Data", instanceName: "dwarf.Data", imports: ["debug/dwarf"] })
extern class Data {

    @:native("AddSection") function addSection(name: String, contents: go.Slice<go.Byte>): go.Error;
    @:native("AddTypes") function addTypes(name: String, types: go.Slice<go.Byte>): go.Error;
    @:native("LineReader") function lineReader(cu: go.Pointer<go.debug.dwarf.Entry>): go.Result<go.Pointer<go.debug.dwarf.LineReader>>;
    @:native("Ranges") function ranges(e: go.Pointer<go.debug.dwarf.Entry>): go.Result<go.Slice<go.GoArray<go.UInt64, 2>>>;
    @:native("Reader") function reader(): go.Pointer<go.debug.dwarf.Reader>;
    @:native("Type") function type(off: go.debug.dwarf.Offset): go.Result<go.debug.dwarf.Type>;

}