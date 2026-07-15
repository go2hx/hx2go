package go.archive.tar;

@:structInit
@:go.Type({ name: "Header", instanceName: "tar.Header", imports: ["archive/tar"] })
extern class Header {

    @:native("Typeflag") var typeflag: go.Byte;
    @:native("Name") var name: String;
    @:native("Linkname") var linkname: String;
    @:native("Size") var size: go.Int64;
    @:native("Mode") var mode: go.Int64;
    @:native("Uid") var uid: go.GoInt;
    @:native("Gid") var gid: go.GoInt;
    @:native("Uname") var uname: String;
    @:native("Gname") var gname: String;
    @:native("ModTime") var modTime: go.time.Time;
    @:native("AccessTime") var accessTime: go.time.Time;
    @:native("ChangeTime") var changeTime: go.time.Time;
    @:native("Devmajor") var devmajor: go.Int64;
    @:native("Devminor") var devminor: go.Int64;
    @:native("Xattrs") var xattrs: go.Map<String, String>;
    @:native("PAXRecords") var pAXRecords: go.Map<String, String>;
    @:native("Format") var format: go.archive.tar.Format;

function new(typeflag: go.Byte, name: String, linkname: String, size: go.Int64, mode: go.Int64, uid: go.GoInt, gid: go.GoInt, uname: String, gname: String, modTime: go.time.Time, accessTime: go.time.Time, changeTime: go.time.Time, devmajor: go.Int64, devminor: go.Int64, xattrs: go.Map<String, String>, pAXRecords: go.Map<String, String>, format: go.archive.tar.Format);

    @:native("FileInfo") function fileInfo(): go.io.fs.FileInfo;

}