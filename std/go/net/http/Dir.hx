package go.net.http;

/**
    A Dir implements [FileSystem] using the native file system restricted to a
    specific directory tree.
    
    While the [FileSystem.Open] method takes '/'-separated paths, a Dir's string
    value is a directory path on the native file system, not a URL, so it is separated
    by [filepath.Separator], which isn't necessarily '/'.
    
    Note that Dir could expose sensitive files and directories. Dir will follow
    symlinks pointing out of the directory tree, which can be especially dangerous
    if serving from a directory in which users are able to create arbitrary symlinks.
    Dir will also allow access to files and directories starting with a period,
    which could expose sensitive directories like .git or sensitive files like
    .htpasswd. To exclude files with a leading period, remove the files/directories
    from the server or create a custom FileSystem implementation.
    
    An empty Dir is treated as ".".
**/
@:go.Type({ name: "Dir", instanceName: "http.Dir", imports: ["net/http"] })
extern typedef Dir = haxe.extern.EitherType<String, {
    /**
        Open implements [FileSystem] using [os.Open], opening files for reading rooted
        and relative to the directory d.
    **/
    @:native("Open") function open(name: String): (go.Result<go.net.http.File>);

}>