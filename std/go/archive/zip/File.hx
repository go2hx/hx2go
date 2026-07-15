package go.archive.zip;

@:structInit
@:go.Type({ name: "File", instanceName: "zip.File", imports: ["archive/zip"] })
extern class File {

    @:native("FileHeader") var fileHeader: go.archive.zip.FileHeader;

function new(fileHeader: go.archive.zip.FileHeader);

    @:native("DataOffset") function dataOffset(): go.Result<go.Int64>;
    @:native("FileInfo") function fileInfo(): go.io.fs.FileInfo;
    @:native("ModTime") function modTime(): go.time.Time;
    @:native("Mode") function mode(): go.io.fs.FileMode;
    @:native("Open") function open(): go.Result<go.io.ReadCloser>;
    @:native("OpenRaw") function openRaw(): go.Result<go.io.Reader>;
    @:native("SetModTime") function setModTime(t: go.time.Time): Void;
    @:native("SetMode") function setMode(mode: go.io.fs.FileMode): Void;

}