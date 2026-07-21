package go.go.token;

@:structInit
@:go.Type({ name: "FileSet", instanceName: "token.FileSet", imports: ["go/token"] })
extern class FileSet {

    @:native("AddExistingFiles") function addExistingFiles(files: haxe.Rest<go.Pointer<go.go.token.File>>): Void;
    @:native("AddFile") function addFile(filename: String, base: go.GoInt, size: go.GoInt): (go.Pointer<go.go.token.File>);
    @:native("Base") function base(): (go.GoInt);
    @:native("File") function file(p: go.go.token.Pos): (go.Pointer<go.go.token.File>);
    @:native("Iterate") function iterate(yield: (p0: go.Pointer<go.go.token.File>) -> (Bool)): Void;
    @:native("Position") function position(p: go.go.token.Pos): (go.go.token.Position);
    @:native("PositionFor") function positionFor(p: go.go.token.Pos, adjusted: Bool): (go.go.token.Position);
    @:native("Read") function read(decode: (p0: Dynamic) -> (go.Error)): (go.Error);
    @:native("RemoveFile") function removeFile(file: go.Pointer<go.go.token.File>): Void;
    @:native("Write") function write(encode: (p0: Dynamic) -> (go.Error)): (go.Error);

}