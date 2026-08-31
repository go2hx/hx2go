package go.os;

/**
    Root may be used to only access files within a single directory tree.
    
    Methods on Root can only access files and directories beneath a root directory.
    If any component of a file name passed to a method of Root references a location
    outside the root, the method returns an error.
    File names may reference the directory itself (.).
    
    Methods on Root will follow symbolic links, but symbolic links may not
    reference a location outside the root.
    Symbolic links must not be absolute.
    
    Methods on Root do not prohibit traversal of filesystem boundaries,
    Linux bind mounts, /proc special files, or access to Unix device files.
    
    Methods on Root are safe to be used from multiple goroutines simultaneously.
    
    On most platforms, creating a Root opens a file descriptor or handle referencing
    the directory. If the directory is moved, methods on Root reference the original
    directory in its new location.
    
    Root's behavior differs on some platforms:
    
      - When GOOS=windows, file names may not reference Windows reserved device names
        such as NUL and COM1.
      - On Unix, [Root.Chmod], [Root.Chown], and [Root.Chtimes] are vulnerable to a race condition.
        If the target of the operation is changed from a regular file to a symlink
        while the operation is in progress, the operation may be performed on the link
        rather than the link target.
      - When GOOS=js, Root is vulnerable to TOCTOU (time-of-check-time-of-use)
        attacks in symlink validation, and cannot ensure that operations will not
        escape the root.
      - When GOOS=plan9 or GOOS=js, Root does not track directories across renames.
        On these platforms, a Root references a directory name, not a file descriptor.
      - WASI preview 1 (GOOS=wasip1) does not support [Root.Chmod].
**/
@:structInit
@:go.Type({ name: "Root", instanceName: "os.Root", imports: ["os"] })
extern class Root {

    /**
        Chmod changes the mode of the named file in the root to mode.
        See [Chmod] for more details.
    **/
    @:native("Chmod") function chmod(name: String, mode: go.os.FileMode): (go.Error);
    /**
        Chown changes the numeric uid and gid of the named file in the root.
        See [Chown] for more details.
    **/
    @:native("Chown") function chown(name: String, uid: go.GoInt, gid: go.GoInt): (go.Error);
    /**
        Chtimes changes the access and modification times of the named file in the root.
        See [Chtimes] for more details.
    **/
    @:native("Chtimes") function chtimes(name: String, atime: go.time.Time, mtime: go.time.Time): (go.Error);
    /**
        Close closes the Root.
        After Close is called, methods on Root return errors.
    **/
    @:native("Close") function close(): (go.Error);
    /**
        Create creates or truncates the named file in the root.
        See [Create] for more details.
    **/
    @:native("Create") function create(name: String): (go.Result<go.Pointer<go.os.File>>);
    /**
        FS returns a file system (an fs.FS) for the tree of files in the root.
        
        The result implements [io/fs.StatFS], [io/fs.ReadFileFS],
        [io/fs.ReadDirFS], and [io/fs.ReadLinkFS].
    **/
    @:native("FS") function FS(): (go.io.fs.FS);
    /**
        Lchown changes the numeric uid and gid of the named file in the root.
        See [Lchown] for more details.
    **/
    @:native("Lchown") function lchown(name: String, uid: go.GoInt, gid: go.GoInt): (go.Error);
    /**
        Link creates newname as a hard link to the oldname file.
        Both paths are relative to the root.
        See [Link] for more details.
        
        If oldname is a symbolic link, Link creates new link to oldname and not its target.
        This behavior may differ from that of [Link] on some platforms.
        
        When GOOS=js, Link returns an error if oldname is a symbolic link.
    **/
    @:native("Link") function link(oldname: String, newname: String): (go.Error);
    /**
        Lstat returns a [FileInfo] describing the named file in the root.
        If the file is a symbolic link, the returned FileInfo
        describes the symbolic link.
        See [Lstat] for more details.
    **/
    @:native("Lstat") function lstat(name: String): (go.Result<go.os.FileInfo>);
    /**
        Mkdir creates a new directory in the root
        with the specified name and permission bits (before umask).
        See [Mkdir] for more details.
        
        If perm contains bits other than the nine least-significant bits (0o777),
        Mkdir returns an error.
    **/
    @:native("Mkdir") function mkdir(name: String, perm: go.os.FileMode): (go.Error);
    /**
        MkdirAll creates a new directory in the root, along with any necessary parents.
        See [MkdirAll] for more details.
        
        If perm contains bits other than the nine least-significant bits (0o777),
        MkdirAll returns an error.
    **/
    @:native("MkdirAll") function mkdirAll(name: String, perm: go.os.FileMode): (go.Error);
    /**
        Name returns the name of the directory presented to OpenRoot.
        
        It is safe to call Name after [Close].
    **/
    @:native("Name") function name(): (String);
    /**
        Open opens the named file in the root for reading.
        See [Open] for more details.
    **/
    @:native("Open") function open(name: String): (go.Result<go.Pointer<go.os.File>>);
    /**
        OpenFile opens the named file in the root.
        See [OpenFile] for more details.
        
        If perm contains bits other than the nine least-significant bits (0o777),
        OpenFile returns an error.
    **/
    @:native("OpenFile") function openFile(name: String, flag: go.GoInt, perm: go.os.FileMode): (go.Result<go.Pointer<go.os.File>>);
    /**
        OpenRoot opens the named directory in the root.
        If there is an error, it will be of type [*PathError].
    **/
    @:native("OpenRoot") function openRoot(name: String): (go.Result<go.Pointer<go.os.Root>>);
    /**
        ReadFile reads the named file in the root and returns its contents.
        See [ReadFile] for more details.
    **/
    @:native("ReadFile") function readFile(name: String): (go.Result<go.Slice<go.Byte>>);
    /**
        Readlink returns the destination of the named symbolic link in the root.
        See [Readlink] for more details.
    **/
    @:native("Readlink") function readlink(name: String): (go.Result<String>);
    /**
        Remove removes the named file or (empty) directory in the root.
        See [Remove] for more details.
    **/
    @:native("Remove") function remove(name: String): (go.Error);
    /**
        RemoveAll removes the named file or directory and any children that it contains.
        See [RemoveAll] for more details.
    **/
    @:native("RemoveAll") function removeAll(name: String): (go.Error);
    /**
        Rename renames (moves) oldname to newname.
        Both paths are relative to the root.
        See [Rename] for more details.
    **/
    @:native("Rename") function rename(oldname: String, newname: String): (go.Error);
    /**
        Stat returns a [FileInfo] describing the named file in the root.
        See [Stat] for more details.
    **/
    @:native("Stat") function stat(name: String): (go.Result<go.os.FileInfo>);
    /**
        Symlink creates newname as a symbolic link to oldname.
        See [Symlink] for more details.
        
        Symlink does not validate oldname,
        which may reference a location outside the root.
        
        On Windows, a directory link is created if oldname references
        a directory within the root. Otherwise a file link is created.
    **/
    @:native("Symlink") function symlink(oldname: String, newname: String): (go.Error);
    /**
        WriteFile writes data to the named file in the root, creating it if necessary.
        See [WriteFile] for more details.
    **/
    @:native("WriteFile") function writeFile(name: String, data: go.Slice<go.Byte>, perm: go.os.FileMode): (go.Error);

}