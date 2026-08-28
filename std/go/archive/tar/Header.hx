package go.archive.tar;

/**
    A Header represents a single header in a tar archive.
    Some fields may not be populated.
    
    For forward compatibility, users that retrieve a Header from Reader.Next,
    mutate it in some ways, and then pass it back to Writer.WriteHeader
    should do so by creating a new Header and copying the fields
    that they are interested in preserving.
**/
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

    function new(typeflag: go.Byte=0, name: String="", linkname: String="", size: go.Int64=0, mode: go.Int64=0, uid: go.GoInt=0, gid: go.GoInt=0, uname: String="", gname: String="", modTime: go.time.Time, accessTime: go.time.Time, changeTime: go.time.Time, devmajor: go.Int64=0, devminor: go.Int64=0, xattrs: go.Map<String, String>=null, pAXRecords: go.Map<String, String>=null, format: go.archive.tar.Format=cast 0);

    /**
        FileInfo returns an fs.FileInfo for the Header.
    **/
    @:native("FileInfo") function fileInfo(): (go.io.fs.FileInfo);

}