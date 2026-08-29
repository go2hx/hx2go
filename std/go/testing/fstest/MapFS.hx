package go.testing.fstest;

/**
    A MapFS is a simple in-memory file system for use in tests,
    represented as a map from path names (arguments to Open)
    to information about the files, directories, or symbolic links they represent.
    
    The map need not include parent directories for files contained
    in the map; those will be synthesized if needed.
    But a directory can still be included by setting the [MapFile.Mode]'s [fs.ModeDir] bit;
    this may be necessary for detailed control over the directory's [fs.FileInfo]
    or to create an empty directory.
    
    File system operations read directly from the map,
    so that the file system can be changed by editing the map as needed.
    An implication is that file system operations must not run concurrently
    with changes to the map, which would be a race.
    Another implication is that opening or reading a directory requires
    iterating over the entire map, so a MapFS should typically be used with not more
    than a few hundred entries or directory reads.
**/
@:go.Type({ name: "MapFS", instanceName: "fstest.MapFS", imports: ["testing/fstest"] })
extern class MapFS {

    @:native("Glob") function glob(pattern: String): (go.Result<go.Slice<String>>);
    /**
        Lstat returns a FileInfo describing the named file.
        If the file is a symbolic link, the returned FileInfo describes the symbolic link.
        Lstat makes no attempt to follow the link.
    **/
    @:native("Lstat") function lstat(name: String): (go.Result<go.io.fs.FileInfo>);
    /**
        Open opens the named file after following any symbolic links.
    **/
    @:native("Open") function open(name: String): (go.Result<go.io.fs.File>);
    @:native("ReadDir") function readDir(name: String): (go.Result<go.Slice<go.io.fs.DirEntry>>);
    @:native("ReadFile") function readFile(name: String): (go.Result<go.Slice<go.Byte>>);
    /**
        ReadLink returns the destination of the named symbolic link.
    **/
    @:native("ReadLink") function readLink(name: String): (go.Result<String>);
    @:native("Stat") function stat(name: String): (go.Result<go.io.fs.FileInfo>);
    @:native("Sub") function sub(dir: String): (go.Result<go.io.fs.FS>);

}