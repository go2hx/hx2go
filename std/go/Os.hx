package go;

/**
    Package os provides a platform-independent interface to operating system
    functionality. The design is Unix-like, although the error handling is
    Go-like; failing calls return values of type error rather than error numbers.
    Often, more information is available within the error. For example,
    if a call that takes a file name fails, such as [Open] or [Stat], the error
    will include the failing file name when printed and will be of type
    [*PathError], which may be unpacked for more information.
    
    The os interface is intended to be uniform across all operating systems.
    Features not generally available appear in the system-specific package syscall.
    
    Here is a simple example, opening a file and reading some of it.
    
    	file, err := os.Open("file.go") // For read access.
    	if err != nil {
    		log.Fatal(err)
    	}
    
    If the open fails, the error string will be self-explanatory, like
    
    	open file.go: no such file or directory
    
    The file's data can then be read into a slice of bytes. Read and
    Write take their byte counts from the length of the argument slice.
    
    	data := make([]byte, 100)
    	count, err := file.Read(data)
    	if err != nil {
    		log.Fatal(err)
    	}
    	fmt.Printf("read %d bytes: %q\n", count, data[:count])
    
    # Concurrency
    
    The methods of [File] correspond to file system operations. All are
    safe for concurrent use. The maximum number of concurrent
    operations on a File may be limited by the OS or the system. The
    number should be high, but exceeding it may degrade performance or
    cause other issues.
**/
@:go.Type({ name: "os", instanceName: "os.os", imports: ["os"] })
extern class Os {

    /**
        DevNull is the name of the operating system's “null device.”
        On Unix-like systems, it is "/dev/null"; on Windows, "NUL".
    **/
    @:native("DevNull") static var devNull: String;
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
        Flags to OpenFile wrapping those of the underlying system. Not all
        flags may be implemented on a given system.
    **/
    @:native("O_APPEND") static var O_APPEND: go.GoInt;
    /**
        Flags to OpenFile wrapping those of the underlying system. Not all
        flags may be implemented on a given system.
    **/
    @:native("O_CREATE") static var O_CREATE: go.GoInt;
    /**
        Flags to OpenFile wrapping those of the underlying system. Not all
        flags may be implemented on a given system.
    **/
    @:native("O_EXCL") static var O_EXCL: go.GoInt;
    /**
        Flags to OpenFile wrapping those of the underlying system. Not all
        flags may be implemented on a given system.
    **/
    @:native("O_RDONLY") static var O_RDONLY: go.GoInt;
    /**
        Flags to OpenFile wrapping those of the underlying system. Not all
        flags may be implemented on a given system.
    **/
    @:native("O_RDWR") static var O_RDWR: go.GoInt;
    /**
        Flags to OpenFile wrapping those of the underlying system. Not all
        flags may be implemented on a given system.
    **/
    @:native("O_SYNC") static var O_SYNC: go.GoInt;
    /**
        Flags to OpenFile wrapping those of the underlying system. Not all
        flags may be implemented on a given system.
    **/
    @:native("O_TRUNC") static var O_TRUNC: go.GoInt;
    /**
        Flags to OpenFile wrapping those of the underlying system. Not all
        flags may be implemented on a given system.
    **/
    @:native("O_WRONLY") static var O_WRONLY: go.GoInt;
    @:native("PathListSeparator") static var pathListSeparator: go.Rune;
    @:native("PathSeparator") static var pathSeparator: go.Rune;
    /**
        Seek whence values.
        
        Deprecated: Use io.SeekStart, io.SeekCurrent, and io.SeekEnd.
    **/
    @:native("SEEK_CUR") static var SEEK_CUR: go.GoInt;
    /**
        Seek whence values.
        
        Deprecated: Use io.SeekStart, io.SeekCurrent, and io.SeekEnd.
    **/
    @:native("SEEK_END") static var SEEK_END: go.GoInt;
    /**
        Seek whence values.
        
        Deprecated: Use io.SeekStart, io.SeekCurrent, and io.SeekEnd.
    **/
    @:native("SEEK_SET") static var SEEK_SET: go.GoInt;

    /**
        Args hold the command-line arguments, starting with the program name.
    **/
    @:native("Args") static var args: go.Slice<String>;
    /**
        The only signal values guaranteed to be present in the os package on all
        systems are os.Interrupt (send the process an interrupt) and os.Kill (force
        the process to exit). On Windows, sending os.Interrupt to a process with
        os.Process.Signal is not implemented; it will return an error instead of
        sending a signal.
    **/
    @:native("Interrupt") static var interrupt: go.os.Signal;
    /**
        The only signal values guaranteed to be present in the os package on all
        systems are os.Interrupt (send the process an interrupt) and os.Kill (force
        the process to exit). On Windows, sending os.Interrupt to a process with
        os.Process.Signal is not implemented; it will return an error instead of
        sending a signal.
    **/
    @:native("Kill") static var kill: go.os.Signal;
    /**
        Stdin, Stdout, and Stderr are open Files pointing to the standard input,
        standard output, and standard error file descriptors.
        
        Note that the Go runtime writes to standard error for panics and crashes;
        closing Stderr may cause those messages to go elsewhere, perhaps
        to a file opened later.
    **/
    @:native("Stderr") static var stderr: go.Pointer<go.os.File>;
    /**
        Stdin, Stdout, and Stderr are open Files pointing to the standard input,
        standard output, and standard error file descriptors.
        
        Note that the Go runtime writes to standard error for panics and crashes;
        closing Stderr may cause those messages to go elsewhere, perhaps
        to a file opened later.
    **/
    @:native("Stdin") static var stdin: go.Pointer<go.os.File>;
    /**
        Stdin, Stdout, and Stderr are open Files pointing to the standard input,
        standard output, and standard error file descriptors.
        
        Note that the Go runtime writes to standard error for panics and crashes;
        closing Stderr may cause those messages to go elsewhere, perhaps
        to a file opened later.
    **/
    @:native("Stdout") static var stdout: go.Pointer<go.os.File>;

    /**
        Chdir changes the current working directory to the named directory.
        If there is an error, it will be of type [*PathError].
    **/
    @:native("Chdir") static function chdir(dir: String): (go.Error);
    /**
        Chmod changes the mode of the named file to mode.
        If the file is a symbolic link, it changes the mode of the link's target.
        If there is an error, it will be of type [*PathError].
        
        A different subset of the mode bits are used, depending on the
        operating system.
        
        On Unix, the mode's permission bits, [ModeSetuid], [ModeSetgid], and
        [ModeSticky] are used.
        
        On Windows, only the 0o200 bit (owner writable) of mode is used; it
        controls whether the file's read-only attribute is set or cleared.
        The other bits are currently unused. For compatibility with Go 1.12
        and earlier, use a non-zero mode. Use mode 0o400 for a read-only
        file and 0o600 for a readable+writable file.
        
        On Plan 9, the mode's permission bits, [ModeAppend], [ModeExclusive],
        and [ModeTemporary] are used.
    **/
    @:native("Chmod") static function chmod(name: String, mode: go.os.FileMode): (go.Error);
    /**
        Chown changes the numeric uid and gid of the named file.
        If the file is a symbolic link, it changes the uid and gid of the link's target.
        A uid or gid of -1 means to not change that value.
        If there is an error, it will be of type [*PathError].
        
        On Windows or Plan 9, Chown always returns the [syscall.EWINDOWS] or
        [syscall.EPLAN9] error, wrapped in [*PathError].
    **/
    @:native("Chown") static function chown(name: String, uid: go.GoInt, gid: go.GoInt): (go.Error);
    /**
        Chtimes changes the access and modification times of the named
        file, similar to the Unix utime() or utimes() functions.
        A zero [time.Time] value will leave the corresponding file time unchanged.
        
        The underlying filesystem may truncate or round the values to a
        less precise time unit.
        If there is an error, it will be of type [*PathError].
    **/
    @:native("Chtimes") static function chtimes(name: String, atime: go.time.Time, mtime: go.time.Time): (go.Error);
    /**
        Clearenv deletes all environment variables.
    **/
    @:native("Clearenv") static function clearenv(): Void;
    /**
        CopyFS copies the file system fsys into the directory dir,
        creating dir if necessary.
        
        Files are created with mode 0o666 plus any execute permissions
        from the source, and directories are created with mode 0o777
        (before umask).
        
        CopyFS will not overwrite existing files. If a file name in fsys
        already exists in the destination, CopyFS will return an error
        such that errors.Is(err, fs.ErrExist) will be true.
        
        Symbolic links in dir are followed.
        
        New files added to fsys (including if dir is a subdirectory of fsys)
        while CopyFS is running are not guaranteed to be copied.
        
        Copying stops at and returns the first error encountered.
    **/
    @:native("CopyFS") static function copyFS(dir: String, fsys: go.io.fs.FS): (go.Error);
    /**
        Create creates or truncates the named file. If the file already exists,
        it is truncated. If the file does not exist, it is created with mode 0o666
        (before umask). If successful, methods on the returned File can
        be used for I/O; the associated file descriptor has mode [O_RDWR].
        The directory containing the file must already exist.
        If there is an error, it will be of type [*PathError].
    **/
    @:native("Create") static function create(name: String): (go.Result<go.Pointer<go.os.File>>);
    /**
        CreateTemp creates a new temporary file in the directory dir,
        opens the file for reading and writing, and returns the resulting file.
        The filename is generated by taking pattern and adding a random string to the end.
        If pattern includes a "*", the random string replaces the last "*".
        The file is created with mode 0o600 (before umask).
        If dir is the empty string, CreateTemp uses the default directory for temporary files, as returned by [TempDir].
        Multiple programs or goroutines calling CreateTemp simultaneously will not choose the same file.
        The caller can use the file's Name method to find the pathname of the file.
        It is the caller's responsibility to remove the file when it is no longer needed.
    **/
    @:native("CreateTemp") static function createTemp(dir: String, pattern: String): (go.Result<go.Pointer<go.os.File>>);
    /**
        DirFS returns a file system (an fs.FS) for the tree of files rooted at the directory dir.
        
        Note that DirFS("/prefix") only guarantees that the Open calls it makes to the
        operating system will begin with "/prefix": DirFS("/prefix").Open("file") is the
        same as os.Open("/prefix/file"). So if /prefix/file is a symbolic link pointing outside
        the /prefix tree, then using DirFS does not stop the access any more than using
        os.Open does. Additionally, the root of the fs.FS returned for a relative path,
        DirFS("prefix"), will be affected by later calls to Chdir. DirFS is therefore not
        a general substitute for a chroot-style security mechanism when the directory tree
        contains arbitrary content.
        
        Use [Root.FS] to obtain a fs.FS that prevents escapes from the tree via symbolic links.
        
        The directory dir must not be "".
        
        The result implements [io/fs.StatFS], [io/fs.ReadFileFS], [io/fs.ReadDirFS], and
        [io/fs.ReadLinkFS].
    **/
    @:native("DirFS") static function dirFS(dir: String): (go.io.fs.FS);
    /**
        Environ returns a copy of strings representing the environment,
        in the form "key=value".
    **/
    @:native("Environ") static function environ(): (go.Slice<String>);
    /**
        Executable returns the path name for the executable that started
        the current process. There is no guarantee that the path is still
        pointing to the correct executable. If a symlink was used to start
        the process, depending on the operating system, the result might
        be the symlink or the path it pointed to. If a stable result is
        needed, [path/filepath.EvalSymlinks] might help.
        
        Executable returns an absolute path unless an error occurred.
        
        The main use case is finding resources located relative to an
        executable.
    **/
    @:native("Executable") static function executable(): (go.Result<String>);
    /**
        Exit causes the current program to exit with the given status code.
        Conventionally, code zero indicates success, non-zero an error.
        The program terminates immediately; deferred functions are not run.
        
        For portability, the status code should be in the range [0, 125].
    **/
    @:native("Exit") static function exit(code: go.GoInt): Void;
    /**
        Expand replaces ${var} or $var in the string based on the mapping function.
        For example, [os.ExpandEnv](s) is equivalent to [os.Expand](s, [os.Getenv]).
    **/
    @:native("Expand") static function expand(s: String, mapping: (p0: String) -> (String)): (String);
    /**
        ExpandEnv replaces ${var} or $var in the string according to the values
        of the current environment variables. References to undefined
        variables are replaced by the empty string.
    **/
    @:native("ExpandEnv") static function expandEnv(s: String): (String);
    /**
        FindProcess looks for a running process by its pid.
        
        The [Process] it returns can be used to obtain information
        about the underlying operating system process.
        
        On Unix systems, FindProcess always succeeds and returns a Process
        for the given pid, regardless of whether the process exists. To test whether
        the process actually exists, see whether p.Signal(syscall.Signal(0)) reports
        an error.
    **/
    @:native("FindProcess") static function findProcess(pid: go.GoInt): (go.Result<go.Pointer<go.os.Process>>);
    /**
        Getegid returns the numeric effective group id of the caller.
        
        On Windows, it returns -1.
    **/
    @:native("Getegid") static function getegid(): (go.GoInt);
    /**
        Getenv retrieves the value of the environment variable named by the key.
        It returns the value, which will be empty if the variable is not present.
        To distinguish between an empty value and an unset value, use [LookupEnv].
    **/
    @:native("Getenv") static function getenv(key: String): (String);
    /**
        Geteuid returns the numeric effective user id of the caller.
        
        On Windows, it returns -1.
    **/
    @:native("Geteuid") static function geteuid(): (go.GoInt);
    /**
        Getgid returns the numeric group id of the caller.
        
        On Windows, it returns -1.
    **/
    @:native("Getgid") static function getgid(): (go.GoInt);
    /**
        Getgroups returns a list of the numeric ids of groups that the caller belongs to.
        
        On Windows, it returns [syscall.EWINDOWS]. See the [os/user] package
        for a possible alternative.
    **/
    @:native("Getgroups") static function getgroups(): (go.Result<go.Slice<go.GoInt>>);
    /**
        Getpagesize returns the underlying system's memory page size.
    **/
    @:native("Getpagesize") static function getpagesize(): (go.GoInt);
    /**
        Getpid returns the process id of the caller.
    **/
    @:native("Getpid") static function getpid(): (go.GoInt);
    /**
        Getppid returns the process id of the caller's parent.
    **/
    @:native("Getppid") static function getppid(): (go.GoInt);
    /**
        Getuid returns the numeric user id of the caller.
        
        On Windows, it returns -1.
    **/
    @:native("Getuid") static function getuid(): (go.GoInt);
    /**
        Getwd returns an absolute path name corresponding to the
        current directory. If the current directory can be
        reached via multiple paths (due to symbolic links),
        Getwd may return any one of them.
        
        On Unix platforms, if the environment variable PWD
        provides an absolute name, and it is a name of the
        current directory, it is returned.
    **/
    @:native("Getwd") static function getwd(): (go.Result<String>);
    /**
        Hostname returns the host name reported by the kernel.
    **/
    @:native("Hostname") static function hostname(): (go.Result<String>);
    /**
        IsExist returns a boolean indicating whether its argument is known to report
        that a file or directory already exists. It is satisfied by [ErrExist] as
        well as some syscall errors.
        
        This function predates [errors.Is]. It only supports errors returned by
        the os package. New code should use errors.Is(err, fs.ErrExist).
    **/
    @:native("IsExist") static function isExist(err: go.Error): (Bool);
    /**
        IsNotExist returns a boolean indicating whether its argument is known to
        report that a file or directory does not exist. It is satisfied by
        [ErrNotExist] as well as some syscall errors.
        
        This function predates [errors.Is]. It only supports errors returned by
        the os package. New code should use errors.Is(err, fs.ErrNotExist).
    **/
    @:native("IsNotExist") static function isNotExist(err: go.Error): (Bool);
    /**
        IsPathSeparator reports whether c is a directory separator character.
    **/
    @:native("IsPathSeparator") static function isPathSeparator(c: go.UInt8): (Bool);
    /**
        IsPermission returns a boolean indicating whether its argument is known to
        report that permission is denied. It is satisfied by [ErrPermission] as well
        as some syscall errors.
        
        This function predates [errors.Is]. It only supports errors returned by
        the os package. New code should use errors.Is(err, fs.ErrPermission).
    **/
    @:native("IsPermission") static function isPermission(err: go.Error): (Bool);
    /**
        IsTimeout returns a boolean indicating whether its argument is known
        to report that a timeout occurred.
        
        This function predates [errors.Is], and the notion of whether an
        error indicates a timeout can be ambiguous. For example, the Unix
        error EWOULDBLOCK sometimes indicates a timeout and sometimes does not.
        New code should use errors.Is with a value appropriate to the call
        returning the error, such as [os.ErrDeadlineExceeded].
    **/
    @:native("IsTimeout") static function isTimeout(err: go.Error): (Bool);
    /**
        Lchown changes the numeric uid and gid of the named file.
        If the file is a symbolic link, it changes the uid and gid of the link itself.
        If there is an error, it will be of type [*PathError].
        
        On Windows, it always returns the [syscall.EWINDOWS] error, wrapped
        in [*PathError].
    **/
    @:native("Lchown") static function lchown(name: String, uid: go.GoInt, gid: go.GoInt): (go.Error);
    /**
        Link creates newname as a hard link to the oldname file.
        If there is an error, it will be of type *LinkError.
    **/
    @:native("Link") static function link(oldname: String, newname: String): (go.Error);
    /**
        LookupEnv retrieves the value of the environment variable named
        by the key. If the variable is present in the environment the
        value (which may be empty) is returned and the boolean is true.
        Otherwise the returned value will be empty and the boolean will
        be false.
    **/
    @:go.Tuple("p0", "p1") @:native("LookupEnv") static function lookupEnv(key: String): (go.Tuple<{ p0: String, p1: Bool }>);
    /**
        Lstat returns a [FileInfo] describing the named file.
        If the file is a symbolic link, the returned FileInfo
        describes the symbolic link. Lstat makes no attempt to follow the link.
        If there is an error, it will be of type [*PathError].
        
        On Windows, if the file is a reparse point that is a surrogate for another
        named entity (such as a symbolic link or mounted folder), the returned
        FileInfo describes the reparse point, and makes no attempt to resolve it.
    **/
    @:native("Lstat") static function lstat(name: String): (go.Result<go.os.FileInfo>);
    /**
        Mkdir creates a new directory with the specified name and permission
        bits (before umask).
        If there is an error, it will be of type [*PathError].
    **/
    @:native("Mkdir") static function mkdir(name: String, perm: go.os.FileMode): (go.Error);
    /**
        MkdirAll creates a directory named path,
        along with any necessary parents, and returns nil,
        or else returns an error.
        The permission bits perm (before umask) are used for all
        directories that MkdirAll creates.
        If path is already a directory, MkdirAll does nothing
        and returns nil.
    **/
    @:native("MkdirAll") static function mkdirAll(path: String, perm: go.os.FileMode): (go.Error);
    /**
        MkdirTemp creates a new temporary directory in the directory dir
        and returns the pathname of the new directory.
        The new directory's name is generated by adding a random string to the end of pattern.
        If pattern includes a "*", the random string replaces the last "*" instead.
        The directory is created with mode 0o700 (before umask).
        If dir is the empty string, MkdirTemp uses the default directory for temporary files, as returned by TempDir.
        Multiple programs or goroutines calling MkdirTemp simultaneously will not choose the same directory.
        It is the caller's responsibility to remove the directory when it is no longer needed.
    **/
    @:native("MkdirTemp") static function mkdirTemp(dir: String, pattern: String): (go.Result<String>);
    /**
        NewFile returns a new [File] with the given file descriptor and name.
        The returned value will be nil if fd is not a valid file descriptor.
        
        NewFile's behavior differs on some platforms:
        
          - On Unix, if fd is in non-blocking mode, NewFile will attempt to return a pollable file.
          - On Windows, if fd is opened for asynchronous I/O (that is, [syscall.FILE_FLAG_OVERLAPPED]
            has been specified in the [syscall.CreateFile] call), NewFile will attempt to return a pollable
            file by associating fd with the Go runtime I/O completion port.
            The I/O operations will be performed synchronously if the association fails.
        
        Only pollable files support [File.SetDeadline], [File.SetReadDeadline], and [File.SetWriteDeadline].
        
        After passing it to NewFile, fd may become invalid under the same conditions described
        in the comments of [File.Fd], and the same constraints apply.
    **/
    @:native("NewFile") static function newFile(fd: go.UIntPtr, name: String): (go.Pointer<go.os.File>);
    /**
        NewSyscallError returns, as an error, a new [SyscallError]
        with the given system call name and error details.
        As a convenience, if err is nil, NewSyscallError returns nil.
    **/
    @:native("NewSyscallError") static function newSyscallError(syscall: String, err: go.Error): (go.Error);
    /**
        Open opens the named file for reading. If successful, methods on
        the returned file can be used for reading; the associated file
        descriptor has mode [O_RDONLY].
        If there is an error, it will be of type [*PathError].
    **/
    @:native("Open") static function open(name: String): (go.Result<go.Pointer<go.os.File>>);
    /**
        OpenFile is the generalized open call; most users will use Open
        or Create instead. It opens the named file with specified flag
        ([O_RDONLY] etc.). If the file does not exist, and the [O_CREATE] flag
        is passed, it is created with mode perm (before umask);
        the containing directory must exist. If successful,
        methods on the returned File can be used for I/O.
        If there is an error, it will be of type [*PathError].
    **/
    @:native("OpenFile") static function openFile(name: String, flag: go.GoInt, perm: go.os.FileMode): (go.Result<go.Pointer<go.os.File>>);
    /**
        OpenInRoot opens the file name in the directory dir.
        It is equivalent to OpenRoot(dir) followed by opening the file in the root.
        
        OpenInRoot returns an error if any component of the name
        references a location outside of dir.
        
        See [Root] for details and limitations.
    **/
    @:native("OpenInRoot") static function openInRoot(dir: String, name: String): (go.Result<go.Pointer<go.os.File>>);
    /**
        OpenRoot opens the named directory.
        It follows symbolic links in the directory name.
        If there is an error, it will be of type [*PathError].
    **/
    @:native("OpenRoot") static function openRoot(name: String): (go.Result<go.Pointer<go.os.Root>>);
    /**
        Pipe returns a connected pair of Files; reads from r return bytes written to w.
        It returns the files and an error, if any.
    **/
    @:go.Tuple("r", "w", "err") @:native("Pipe") static function pipe(): (go.Tuple<{ r: go.Pointer<go.os.File>, w: go.Pointer<go.os.File>, err: go.Error }>);
    /**
        ReadDir reads the named directory,
        returning all its directory entries sorted by filename.
        If an error occurs reading the directory,
        ReadDir returns the entries it was able to read before the error,
        along with the error.
    **/
    @:native("ReadDir") static function readDir(name: String): (go.Result<go.Slice<go.os.DirEntry>>);
    /**
        ReadFile reads the named file and returns the contents.
        A successful call returns err == nil, not err == EOF.
        Because ReadFile reads the whole file, it does not treat an EOF from Read
        as an error to be reported.
    **/
    @:native("ReadFile") static function readFile(name: String): (go.Result<go.Slice<go.Byte>>);
    /**
        Readlink returns the destination of the named symbolic link.
        If there is an error, it will be of type [*PathError].
        
        If the link destination is relative, Readlink returns the relative path
        without resolving it to an absolute one.
    **/
    @:native("Readlink") static function readlink(name: String): (go.Result<String>);
    /**
        Remove removes the named file or (empty) directory.
        If there is an error, it will be of type [*PathError].
    **/
    @:native("Remove") static function remove(name: String): (go.Error);
    /**
        RemoveAll removes path and any children it contains.
        It removes everything it can but returns the first error
        it encounters. If the path does not exist, RemoveAll
        returns nil (no error).
        If there is an error, it will be of type [*PathError].
    **/
    @:native("RemoveAll") static function removeAll(path: String): (go.Error);
    /**
        Rename renames (moves) oldpath to newpath.
        If newpath already exists and is not a directory, Rename replaces it.
        If newpath already exists and is a directory, Rename returns an error.
        OS-specific restrictions may apply when oldpath and newpath are in different directories.
        Even within the same directory, on non-Unix platforms Rename is not an atomic operation.
        If there is an error, it will be of type *LinkError.
    **/
    @:native("Rename") static function rename(oldpath: String, newpath: String): (go.Error);
    /**
        SameFile reports whether fi1 and fi2 describe the same file.
        For example, on Unix this means that the device and inode fields
        of the two underlying structures are identical; on other systems
        the decision may be based on the path names.
        SameFile only applies to results returned by this package's [Stat].
        It returns false in other cases.
    **/
    @:native("SameFile") static function sameFile(fi1: go.os.FileInfo, fi2: go.os.FileInfo): (Bool);
    /**
        Setenv sets the value of the environment variable named by the key.
        It returns an error, if any.
    **/
    @:native("Setenv") static function setenv(key: String, value: String): (go.Error);
    /**
        StartProcess starts a new process with the program, arguments and attributes
        specified by name, argv and attr. The argv slice will become [os.Args] in the
        new process, so it normally starts with the program name.
        
        If the calling goroutine has locked the operating system thread
        with [runtime.LockOSThread] and modified any inheritable OS-level
        thread state (for example, Linux or Plan 9 name spaces), the new
        process will inherit the caller's thread state.
        
        StartProcess is a low-level interface. The [os/exec] package provides
        higher-level interfaces.
        
        If there is an error, it will be of type [*PathError].
    **/
    @:native("StartProcess") static function startProcess(name: String, argv: go.Slice<String>, attr: go.Pointer<go.os.ProcAttr>): (go.Result<go.Pointer<go.os.Process>>);
    /**
        Stat returns a [FileInfo] describing the named file.
        If there is an error, it will be of type [*PathError].
    **/
    @:native("Stat") static function stat(name: String): (go.Result<go.os.FileInfo>);
    /**
        Symlink creates newname as a symbolic link to oldname.
        On Windows, a symlink to a non-existent oldname creates a file symlink;
        if oldname is later created as a directory the symlink will not work.
        If there is an error, it will be of type *LinkError.
    **/
    @:native("Symlink") static function symlink(oldname: String, newname: String): (go.Error);
    /**
        TempDir returns the default directory to use for temporary files.
        
        On Unix systems, it returns $TMPDIR if non-empty, else /tmp.
        On Windows, it uses GetTempPath, returning the first non-empty
        value from %TMP%, %TEMP%, %USERPROFILE%, or the Windows directory.
        On Plan 9, it returns /tmp.
        
        The directory is neither guaranteed to exist nor have accessible
        permissions.
    **/
    @:native("TempDir") static function tempDir(): (String);
    /**
        Truncate changes the size of the named file.
        If the file is a symbolic link, it changes the size of the link's target.
        If there is an error, it will be of type [*PathError].
    **/
    @:native("Truncate") static function truncate(name: String, size: go.Int64): (go.Error);
    /**
        Unsetenv unsets a single environment variable.
    **/
    @:native("Unsetenv") static function unsetenv(key: String): (go.Error);
    /**
        UserCacheDir returns the default root directory to use for user-specific
        cached data. Users should create their own application-specific subdirectory
        within this one and use that.
        
        On Unix systems, it returns $XDG_CACHE_HOME as specified by
        https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html if
        non-empty, else $HOME/.cache.
        On Darwin, it returns $HOME/Library/Caches.
        On Windows, it returns %LocalAppData%.
        On Plan 9, it returns $home/lib/cache.
        
        If the location cannot be determined (for example, $HOME is not defined) or
        the path in $XDG_CACHE_HOME is relative, then it will return an error.
    **/
    @:native("UserCacheDir") static function userCacheDir(): (go.Result<String>);
    /**
        UserConfigDir returns the default root directory to use for user-specific
        configuration data. Users should create their own application-specific
        subdirectory within this one and use that.
        
        On Unix systems, it returns $XDG_CONFIG_HOME as specified by
        https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html if
        non-empty, else $HOME/.config.
        On Darwin, it returns $HOME/Library/Application Support.
        On Windows, it returns %AppData%.
        On Plan 9, it returns $home/lib.
        
        If the location cannot be determined (for example, $HOME is not defined) or
        the path in $XDG_CONFIG_HOME is relative, then it will return an error.
    **/
    @:native("UserConfigDir") static function userConfigDir(): (go.Result<String>);
    /**
        UserHomeDir returns the current user's home directory.
        
        On Unix, including macOS, it returns the $HOME environment variable.
        On Windows, it returns %USERPROFILE%.
        On Plan 9, it returns the $home environment variable.
        
        If the expected variable is not set in the environment, UserHomeDir
        returns either a platform-specific default value or a non-nil error.
    **/
    @:native("UserHomeDir") static function userHomeDir(): (go.Result<String>);
    /**
        WriteFile writes data to the named file, creating it if necessary.
        If the file does not exist, WriteFile creates it with permissions perm (before umask);
        otherwise WriteFile truncates it before writing, without changing permissions.
        Since WriteFile requires multiple system calls to complete, a failure mid-operation
        can leave the file in a partially written state.
    **/
    @:native("WriteFile") static function writeFile(name: String, data: go.Slice<go.Byte>, perm: go.os.FileMode): (go.Error);

}