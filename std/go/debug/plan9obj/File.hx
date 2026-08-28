package go.debug.plan9obj;

/**
    A File represents an open Plan 9 a.out file.
**/
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

    /**
        Close closes the [File].
        If the [File] was created using [NewFile] directly instead of [Open],
        Close has no effect.
    **/
    @:native("Close") function close(): (go.Error);
    /**
        Section returns a section with the given name, or nil if no such
        section exists.
    **/
    @:native("Section") function section(name: String): (go.Pointer<go.debug.plan9obj.Section>);
    /**
        Symbols returns the symbol table for f.
    **/
    @:native("Symbols") function symbols(): (go.Result<go.Slice<go.debug.plan9obj.Sym>>);

}