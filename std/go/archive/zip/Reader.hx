package go.archive.zip;

/**
    A Reader serves content from a ZIP archive.
**/
@:structInit
@:go.Type({ name: "Reader", instanceName: "zip.Reader", imports: ["archive/zip"] })
extern class Reader {

    @:native("File") var file: go.Slice<go.Pointer<go.archive.zip.File>>;
    @:native("Comment") var comment: String;

    function new(file: go.Slice<go.Pointer<go.archive.zip.File>>=null, comment: String="");

    /**
        Open opens the named file in the ZIP archive,
        using the semantics of fs.FS.Open:
        paths are always slash separated, with no
        leading / or ../ elements.
    **/
    @:native("Open") function open(name: String): (go.Result<go.io.fs.File>);
    /**
        RegisterDecompressor registers or overrides a custom decompressor for a
        specific method ID. If a decompressor for a given method is not found,
        [Reader] will default to looking up the decompressor at the package level.
    **/
    @:native("RegisterDecompressor") function registerDecompressor(method: go.UInt16, dcomp: go.archive.zip.Decompressor): Void;

}