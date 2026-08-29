package go.io.fs;

/**
    ReadLinkFS is the interface implemented by a file system
    that supports reading symbolic links.
**/
@:go.Type({ name: "ReadLinkFS", instanceName: "fs.ReadLinkFS", imports: ["io/fs"] })
extern typedef ReadLinkFS = {

    @:native("Lstat") function lstat(name: String): (go.Result<go.io.fs.FileInfo>);
    @:native("Open") function open(name: String): (go.Result<go.io.fs.File>);
    @:native("ReadLink") function readLink(name: String): (go.Result<String>);

}