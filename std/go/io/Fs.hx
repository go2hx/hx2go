package go.io;

/**
    Package fs defines basic interfaces to a file system.
    A file system can be provided by the host operating system
    but also by other packages.
    
    # Path Names
    
    The interfaces in this package all operate on the same
    path name syntax, regardless of the host operating system.
    
    Path names are UTF-8-encoded,
    unrooted, slash-separated sequences of path elements, like “x/y/z”.
    Path names must not contain an element that is “.” or “..” or the empty string,
    except for the special case that the name "." may be used for the root directory.
    Paths must not start or end with a slash: “/x” and “x/” are invalid.
    
    # Testing
    
    See the [testing/fstest] package for support with testing
    implementations of file systems.
**/
@:go.Type({ name: "fs", instanceName: "fs.fs", imports: ["io/fs"] })
extern class Fs {

    /**
        The defined file mode bits are the most significant bits of the [FileMode].
        The nine least-significant bits are the standard Unix rwxrwxrwx permissions.
        The values of these bits should be considered part of the public API and
        may be used in wire protocols or disk representations: they must not be
        changed, although new bits might be added.
    **/
    @:native("ModeAppend") static var modeAppend: go.io.fs.FileMode;
    /**
        The defined file mode bits are the most significant bits of the [FileMode].
        The nine least-significant bits are the standard Unix rwxrwxrwx permissions.
        The values of these bits should be considered part of the public API and
        may be used in wire protocols or disk representations: they must not be
        changed, although new bits might be added.
    **/
    @:native("ModeCharDevice") static var modeCharDevice: go.io.fs.FileMode;
    /**
        The defined file mode bits are the most significant bits of the [FileMode].
        The nine least-significant bits are the standard Unix rwxrwxrwx permissions.
        The values of these bits should be considered part of the public API and
        may be used in wire protocols or disk representations: they must not be
        changed, although new bits might be added.
    **/
    @:native("ModeDevice") static var modeDevice: go.io.fs.FileMode;
    /**
        The defined file mode bits are the most significant bits of the [FileMode].
        The nine least-significant bits are the standard Unix rwxrwxrwx permissions.
        The values of these bits should be considered part of the public API and
        may be used in wire protocols or disk representations: they must not be
        changed, although new bits might be added.
    **/
    @:native("ModeDir") static var modeDir: go.io.fs.FileMode;
    /**
        The defined file mode bits are the most significant bits of the [FileMode].
        The nine least-significant bits are the standard Unix rwxrwxrwx permissions.
        The values of these bits should be considered part of the public API and
        may be used in wire protocols or disk representations: they must not be
        changed, although new bits might be added.
    **/
    @:native("ModeExclusive") static var modeExclusive: go.io.fs.FileMode;
    /**
        The defined file mode bits are the most significant bits of the [FileMode].
        The nine least-significant bits are the standard Unix rwxrwxrwx permissions.
        The values of these bits should be considered part of the public API and
        may be used in wire protocols or disk representations: they must not be
        changed, although new bits might be added.
    **/
    @:native("ModeIrregular") static var modeIrregular: go.io.fs.FileMode;
    /**
        The defined file mode bits are the most significant bits of the [FileMode].
        The nine least-significant bits are the standard Unix rwxrwxrwx permissions.
        The values of these bits should be considered part of the public API and
        may be used in wire protocols or disk representations: they must not be
        changed, although new bits might be added.
    **/
    @:native("ModeNamedPipe") static var modeNamedPipe: go.io.fs.FileMode;
    /**
        The defined file mode bits are the most significant bits of the [FileMode].
        The nine least-significant bits are the standard Unix rwxrwxrwx permissions.
        The values of these bits should be considered part of the public API and
        may be used in wire protocols or disk representations: they must not be
        changed, although new bits might be added.
    **/
    @:native("ModePerm") static var modePerm: go.io.fs.FileMode;
    /**
        The defined file mode bits are the most significant bits of the [FileMode].
        The nine least-significant bits are the standard Unix rwxrwxrwx permissions.
        The values of these bits should be considered part of the public API and
        may be used in wire protocols or disk representations: they must not be
        changed, although new bits might be added.
    **/
    @:native("ModeSetgid") static var modeSetgid: go.io.fs.FileMode;
    /**
        The defined file mode bits are the most significant bits of the [FileMode].
        The nine least-significant bits are the standard Unix rwxrwxrwx permissions.
        The values of these bits should be considered part of the public API and
        may be used in wire protocols or disk representations: they must not be
        changed, although new bits might be added.
    **/
    @:native("ModeSetuid") static var modeSetuid: go.io.fs.FileMode;
    /**
        The defined file mode bits are the most significant bits of the [FileMode].
        The nine least-significant bits are the standard Unix rwxrwxrwx permissions.
        The values of these bits should be considered part of the public API and
        may be used in wire protocols or disk representations: they must not be
        changed, although new bits might be added.
    **/
    @:native("ModeSocket") static var modeSocket: go.io.fs.FileMode;
    /**
        The defined file mode bits are the most significant bits of the [FileMode].
        The nine least-significant bits are the standard Unix rwxrwxrwx permissions.
        The values of these bits should be considered part of the public API and
        may be used in wire protocols or disk representations: they must not be
        changed, although new bits might be added.
    **/
    @:native("ModeSticky") static var modeSticky: go.io.fs.FileMode;
    /**
        The defined file mode bits are the most significant bits of the [FileMode].
        The nine least-significant bits are the standard Unix rwxrwxrwx permissions.
        The values of these bits should be considered part of the public API and
        may be used in wire protocols or disk representations: they must not be
        changed, although new bits might be added.
    **/
    @:native("ModeSymlink") static var modeSymlink: go.io.fs.FileMode;
    /**
        The defined file mode bits are the most significant bits of the [FileMode].
        The nine least-significant bits are the standard Unix rwxrwxrwx permissions.
        The values of these bits should be considered part of the public API and
        may be used in wire protocols or disk representations: they must not be
        changed, although new bits might be added.
    **/
    @:native("ModeTemporary") static var modeTemporary: go.io.fs.FileMode;
    /**
        The defined file mode bits are the most significant bits of the [FileMode].
        The nine least-significant bits are the standard Unix rwxrwxrwx permissions.
        The values of these bits should be considered part of the public API and
        may be used in wire protocols or disk representations: they must not be
        changed, although new bits might be added.
    **/
    @:native("ModeType") static var modeType: go.io.fs.FileMode;

    /**
        FileInfoToDirEntry returns a [DirEntry] that returns information from info.
        If info is nil, FileInfoToDirEntry returns nil.
    **/
    @:native("FileInfoToDirEntry") static function fileInfoToDirEntry(info: go.io.fs.FileInfo): (go.io.fs.DirEntry);
    /**
        FormatDirEntry returns a formatted version of dir for human readability.
        Implementations of [DirEntry] can call this from a String method.
        The outputs for a directory named subdir and a file named hello.go are:
        
        	d subdir/
        	- hello.go
    **/
    @:native("FormatDirEntry") static function formatDirEntry(dir: go.io.fs.DirEntry): (String);
    /**
        FormatFileInfo returns a formatted version of info for human readability.
        Implementations of [FileInfo] can call this from a String method.
        The output for a file named "hello.go", 100 bytes, mode 0o644, created
        January 1, 1970 at noon is
        
        	-rw-r--r-- 100 1970-01-01 12:00:00 hello.go
    **/
    @:native("FormatFileInfo") static function formatFileInfo(info: go.io.fs.FileInfo): (String);
    /**
        Glob returns the names of all files matching pattern or nil
        if there is no matching file. The syntax of patterns is the same
        as in [path.Match]. The pattern may describe hierarchical names such as
        usr/* /bin/ed.
        
        Glob ignores file system errors such as I/O errors reading directories.
        The only possible returned error is [path.ErrBadPattern], reporting that
        the pattern is malformed.
        
        If fs implements [GlobFS], Glob calls fs.Glob.
        Otherwise, Glob uses [ReadDir] to traverse the directory tree
        and look for matches for the pattern.
    **/
    @:native("Glob") static function glob(fsys: go.io.fs.FS, pattern: String): (go.Result<go.Slice<String>>);
    /**
        Lstat returns a [FileInfo] describing the named file.
        If the file is a symbolic link, the returned [FileInfo] describes the symbolic link.
        Lstat makes no attempt to follow the link.
        
        If fsys does not implement [ReadLinkFS], then Lstat is identical to [Stat].
    **/
    @:native("Lstat") static function lstat(fsys: go.io.fs.FS, name: String): (go.Result<go.io.fs.FileInfo>);
    /**
        ReadDir reads the named directory
        and returns a list of directory entries sorted by filename.
        
        If fs implements [ReadDirFS], ReadDir calls fs.ReadDir.
        Otherwise ReadDir calls fs.Open and uses ReadDir and Close
        on the returned file.
    **/
    @:native("ReadDir") static function readDir(fsys: go.io.fs.FS, name: String): (go.Result<go.Slice<go.io.fs.DirEntry>>);
    /**
        ReadFile reads the named file from the file system fs and returns its contents.
        A successful call returns a nil error, not [io.EOF].
        (Because ReadFile reads the whole file, the expected EOF
        from the final Read is not treated as an error to be reported.)
        
        If fs implements [ReadFileFS], ReadFile calls fs.ReadFile.
        Otherwise ReadFile calls fs.Open and uses Read and Close
        on the returned [File].
    **/
    @:native("ReadFile") static function readFile(fsys: go.io.fs.FS, name: String): (go.Result<go.Slice<go.Byte>>);
    /**
        ReadLink returns the destination of the named symbolic link.
        
        If fsys does not implement [ReadLinkFS], then ReadLink returns an error.
    **/
    @:native("ReadLink") static function readLink(fsys: go.io.fs.FS, name: String): (go.Result<String>);
    /**
        Stat returns a [FileInfo] describing the named file from the file system.
        
        If fs implements [StatFS], Stat calls fs.Stat.
        Otherwise, Stat opens the [File] to stat it.
    **/
    @:native("Stat") static function stat(fsys: go.io.fs.FS, name: String): (go.Result<go.io.fs.FileInfo>);
    /**
        Sub returns an [FS] corresponding to the subtree rooted at fsys's dir.
        
        If dir is ".", Sub returns fsys unchanged.
        Otherwise, if fs implements [SubFS], Sub returns fsys.Sub(dir).
        Otherwise, Sub returns a new [FS] implementation sub that,
        in effect, implements sub.Open(name) as fsys.Open(path.Join(dir, name)).
        The implementation also translates calls to ReadDir, ReadFile,
        ReadLink, Lstat, and Glob appropriately.
        
        Note that Sub(os.DirFS("/"), "prefix") is equivalent to os.DirFS("/prefix")
        and that neither of them guarantees to avoid operating system
        accesses outside "/prefix", because the implementation of [os.DirFS]
        does not check for symbolic links inside "/prefix" that point to
        other directories. That is, [os.DirFS] is not a general substitute for a
        chroot-style security mechanism, and Sub does not change that fact.
    **/
    @:native("Sub") static function sub(fsys: go.io.fs.FS, dir: String): (go.Result<go.io.fs.FS>);
    /**
        ValidPath reports whether the given path name
        is valid for use in a call to Open.
        
        Note that paths are slash-separated on all systems, even Windows.
        Paths containing other characters such as backslash and colon
        are accepted as valid, but those characters must never be
        interpreted by an [FS] implementation as path element separators.
        See the [Path Names] section for more details.
        
        [Path Names]: https://pkg.go.dev/io/fs#hdr-Path_Names
    **/
    @:native("ValidPath") static function validPath(name: String): (Bool);
    /**
        WalkDir walks the file tree rooted at root, calling fn for each file or
        directory in the tree, including root.
        
        All errors that arise visiting files and directories are filtered by fn:
        see the [fs.WalkDirFunc] documentation for details.
        
        The files are walked in lexical order, which makes the output deterministic
        but requires WalkDir to read an entire directory into memory before proceeding
        to walk that directory.
        
        WalkDir does not follow symbolic links found in directories,
        but if root itself is a symbolic link, its target will be walked.
    **/
    @:native("WalkDir") static function walkDir(fsys: go.io.fs.FS, root: String, fn: go.io.fs.WalkDirFunc): (go.Error);

}