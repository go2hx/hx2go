package go.debug.plan9obj;

@:structInit
@:go.Type({ name: "File", instanceName: "plan9obj.File", imports: ["debug/plan9obj"] })
extern class File {

    @:native("FileHeader") var fileHeader: go.debug.plan9obj.FileHeader;
    @:native("Sections") var sections: go.Slice<go.Pointer<go.debug.plan9obj.Section>>;
    @:native("Magic") var magic: go.UInt32;
    @:native("Bss") var bss: go.UInt32;
    @:native("Entry") var entry: go.UInt64;
    @:native("PtrSize") var ptrSize: go.GoInt;
    @:native("LoadAddress") var loadAddress: go.UInt64;
    @:native("HdrSize") var hdrSize: go.UInt64;

    function new(fileHeader: go.debug.plan9obj.FileHeader, sections: go.Slice<go.Pointer<go.debug.plan9obj.Section>>=null);

    @:native("Close") function close(): (go.Error);
    @:native("Section") function section(name: String): (go.Pointer<go.debug.plan9obj.Section>);
    @:native("Symbols") function symbols(): (go.Result<go.Slice<go.debug.plan9obj.Sym>>);

}