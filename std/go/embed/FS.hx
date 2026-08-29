package go.embed;

/**
    An FS is a read-only collection of files, usually initialized with a //go:embed directive.
    When declared without a //go:embed directive, an FS is an empty file system.
    
    An FS is a read-only value, so it is safe to use from multiple goroutines
    simultaneously and also safe to assign values of type FS to each other.
    
    FS implements fs.FS, so it can be used with any package that understands
    file system interfaces, including net/http, text/template, and html/template.
    
    See the package documentation for more details about initializing an FS.
**/
@:structInit
@:go.Type({ name: "FS", instanceName: "embed.FS", imports: ["embed"] })
extern class FS {

    /**
        Open opens the named file for reading and returns it as an [fs.File].
        
        The returned file implements [io.Seeker] and [io.ReaderAt] when the file is not a directory.
    **/
    @:native("Open") function open(name: String): (go.Result<go.io.fs.File>);
    /**
        ReadDir reads and returns the entire named directory.
    **/
    @:native("ReadDir") function readDir(name: String): (go.Result<go.Slice<go.io.fs.DirEntry>>);
    /**
        ReadFile reads and returns the content of the named file.
    **/
    @:native("ReadFile") function readFile(name: String): (go.Result<go.Slice<go.Byte>>);

}