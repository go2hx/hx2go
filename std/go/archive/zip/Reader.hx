package go.archive.zip;

@:structInit
@:go.Type({ name: "Reader", instanceName: "zip.Reader", imports: ["archive/zip"] })
extern class Reader {

    @:native("File") var file: go.Slice<go.Pointer<go.archive.zip.File>>;
    @:native("Comment") var comment: String;

function new(file: go.Slice<go.Pointer<go.archive.zip.File>>, comment: String);

    @:native("Open") function open(name: String): go.Result<go.io.fs.File>;
    @:native("RegisterDecompressor") function registerDecompressor(method: go.UInt16, dcomp: go.archive.zip.Decompressor): Void;

}