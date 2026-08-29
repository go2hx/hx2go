package go.os;

/**
    File represents an open file descriptor.
    
    The methods of File are safe for concurrent use.
**/
@:structInit
@:go.Type({ name: "File", instanceName: "os.File", imports: ["os"] })
extern class File {

    /**
        Chdir changes the current working directory to the file,
        which must be a directory.
        If there is an error, it will be of type [*PathError].
    **/
    @:native("Chdir") function chdir(): (go.Error);
    /**
        Chmod changes the mode of the file to mode.
        If there is an error, it will be of type [*PathError].
    **/
    @:native("Chmod") function chmod(mode: go.os.FileMode): (go.Error);
    /**
        Chown changes the numeric uid and gid of the named file.
        If there is an error, it will be of type [*PathError].
        
        On Windows, it always returns the [syscall.EWINDOWS] error, wrapped
        in [*PathError].
    **/
    @:native("Chown") function chown(uid: go.GoInt, gid: go.GoInt): (go.Error);
    /**
        Close closes the [File], rendering it unusable for I/O.
        On files that support [File.SetDeadline], any pending I/O operations will
        be canceled and return immediately with an [ErrClosed] error.
        Close will return an error if it has already been called.
    **/
    @:native("Close") function close(): (go.Error);
    /**
        Fd returns the system file descriptor or handle referencing the open file.
        If f is closed, the descriptor becomes invalid.
        If f is garbage collected, a finalizer may close the descriptor,
        making it invalid; see [runtime.SetFinalizer] for more information on when
        a finalizer might be run.
        
        Do not close the returned descriptor; that could cause a later
        close of f to close an unrelated descriptor.
        
        Fd's behavior differs on some platforms:
        
          - On Unix and Windows, [File.SetDeadline] methods will stop working.
          - On Windows, the file descriptor will be disassociated from the
            Go runtime I/O completion port if there are no concurrent I/O
            operations on the file.
        
        For most uses prefer the f.SyscallConn method.
    **/
    @:native("Fd") function fd(): (go.UIntPtr);
    /**
        Name returns the name of the file as presented to Open.
        
        It is safe to call Name after [Close].
    **/
    @:native("Name") function name(): (String);
    /**
        Read reads up to len(b) bytes from the File and stores them in b.
        It returns the number of bytes read and any error encountered.
        At end of file, Read returns 0, io.EOF.
    **/
    @:native("Read") function read(b: go.Slice<go.Byte>): (go.Result<go.GoInt>);
    /**
        ReadAt reads len(b) bytes from the File starting at byte offset off.
        It returns the number of bytes read and the error, if any.
        ReadAt always returns a non-nil error when n < len(b).
        At end of file, that error is io.EOF.
    **/
    @:native("ReadAt") function readAt(b: go.Slice<go.Byte>, off: go.Int64): (go.Result<go.GoInt>);
    /**
        ReadDir reads the contents of the directory associated with the file f
        and returns a slice of [DirEntry] values in directory order.
        Subsequent calls on the same file will yield later DirEntry records in the directory.
        
        If n > 0, ReadDir returns at most n DirEntry records.
        In this case, if ReadDir returns an empty slice, it will return an error explaining why.
        At the end of a directory, the error is [io.EOF].
        
        If n <= 0, ReadDir returns all the DirEntry records remaining in the directory.
        When it succeeds, it returns a nil error (not io.EOF).
    **/
    @:native("ReadDir") function readDir(n: go.GoInt): (go.Result<go.Slice<go.os.DirEntry>>);
    /**
        ReadFrom implements io.ReaderFrom.
    **/
    @:native("ReadFrom") function readFrom(r: go.io.Reader): (go.Result<go.Int64>);
    /**
        Readdir reads the contents of the directory associated with file and
        returns a slice of up to n [FileInfo] values, as would be returned
        by [Lstat], in directory order. Subsequent calls on the same file will yield
        further FileInfos.
        
        If n > 0, Readdir returns at most n FileInfo structures. In this case, if
        Readdir returns an empty slice, it will return a non-nil error
        explaining why. At the end of a directory, the error is [io.EOF].
        
        If n <= 0, Readdir returns all the FileInfo from the directory in
        a single slice. In this case, if Readdir succeeds (reads all
        the way to the end of the directory), it returns the slice and a
        nil error. If it encounters an error before the end of the
        directory, Readdir returns the FileInfo read until that point
        and a non-nil error.
        
        Most clients are better served by the more efficient ReadDir method.
    **/
    @:native("Readdir") function readdir(n: go.GoInt): (go.Result<go.Slice<go.os.FileInfo>>);
    /**
        Readdirnames reads the contents of the directory associated with file
        and returns a slice of up to n names of files in the directory,
        in directory order. Subsequent calls on the same file will yield
        further names.
        
        If n > 0, Readdirnames returns at most n names. In this case, if
        Readdirnames returns an empty slice, it will return a non-nil error
        explaining why. At the end of a directory, the error is [io.EOF].
        
        If n <= 0, Readdirnames returns all the names from the directory in
        a single slice. In this case, if Readdirnames succeeds (reads all
        the way to the end of the directory), it returns the slice and a
        nil error. If it encounters an error before the end of the
        directory, Readdirnames returns the names read until that point and
        a non-nil error.
    **/
    @:native("Readdirnames") function readdirnames(n: go.GoInt): (go.Result<go.Slice<String>>);
    /**
        Seek sets the offset for the next Read or Write on file to offset, interpreted
        according to whence: 0 means relative to the origin of the file, 1 means
        relative to the current offset, and 2 means relative to the end.
        It returns the new offset and an error, if any.
        The behavior of Seek on a file opened with [O_APPEND] is not specified.
    **/
    @:native("Seek") function seek(offset: go.Int64, whence: go.GoInt): (go.Result<go.Int64>);
    /**
        SetDeadline sets the read and write deadlines for a File.
        It is equivalent to calling both SetReadDeadline and SetWriteDeadline.
        
        Only some kinds of files support setting a deadline. Calls to SetDeadline
        for files that do not support deadlines will return ErrNoDeadline.
        On most systems ordinary files do not support deadlines, but pipes do.
        
        A deadline is an absolute time after which I/O operations fail with an
        error instead of blocking. The deadline applies to all future and pending
        I/O, not just the immediately following call to Read or Write.
        After a deadline has been exceeded, the connection can be refreshed
        by setting a deadline in the future.
        
        If the deadline is exceeded a call to Read or Write or to other I/O
        methods will return an error that wraps ErrDeadlineExceeded.
        This can be tested using errors.Is(err, os.ErrDeadlineExceeded).
        That error implements the Timeout method, and calling the Timeout
        method will return true, but there are other possible errors for which
        the Timeout will return true even if the deadline has not been exceeded.
        
        An idle timeout can be implemented by repeatedly extending
        the deadline after successful Read or Write calls.
        
        A zero value for t means I/O operations will not time out.
    **/
    @:native("SetDeadline") function setDeadline(t: go.time.Time): (go.Error);
    /**
        SetReadDeadline sets the deadline for future Read calls and any
        currently-blocked Read call.
        A zero value for t means Read will not time out.
        Not all files support setting deadlines; see SetDeadline.
    **/
    @:native("SetReadDeadline") function setReadDeadline(t: go.time.Time): (go.Error);
    /**
        SetWriteDeadline sets the deadline for any future Write calls and any
        currently-blocked Write call.
        Even if Write times out, it may return n > 0, indicating that
        some of the data was successfully written.
        A zero value for t means Write will not time out.
        Not all files support setting deadlines; see SetDeadline.
    **/
    @:native("SetWriteDeadline") function setWriteDeadline(t: go.time.Time): (go.Error);
    /**
        Stat returns the [FileInfo] structure describing file.
        If there is an error, it will be of type [*PathError].
    **/
    @:native("Stat") function stat(): (go.Result<go.os.FileInfo>);
    /**
        Sync commits the current contents of the file to stable storage.
        Typically, this means flushing the file system's in-memory copy
        of recently written data to disk.
    **/
    @:native("Sync") function sync(): (go.Error);
    /**
        SyscallConn returns a raw file.
        This implements the syscall.Conn interface.
    **/
    @:native("SyscallConn") function syscallConn(): (go.Result<go.syscall.RawConn>);
    /**
        Truncate changes the size of the file.
        It does not change the I/O offset.
        If there is an error, it will be of type [*PathError].
    **/
    @:native("Truncate") function truncate(size: go.Int64): (go.Error);
    /**
        Write writes len(b) bytes from b to the File.
        It returns the number of bytes written and an error, if any.
        Write returns a non-nil error when n != len(b).
    **/
    @:native("Write") function write(b: go.Slice<go.Byte>): (go.Result<go.GoInt>);
    /**
        WriteAt writes len(b) bytes to the File starting at byte offset off.
        It returns the number of bytes written and an error, if any.
        WriteAt returns a non-nil error when n != len(b).
        
        If file was opened with the [O_APPEND] flag, WriteAt returns an error.
    **/
    @:native("WriteAt") function writeAt(b: go.Slice<go.Byte>, off: go.Int64): (go.Result<go.GoInt>);
    /**
        WriteString is like Write, but writes the contents of string s rather than
        a slice of bytes.
    **/
    @:native("WriteString") function writeString(s: String): (go.Result<go.GoInt>);
    /**
        WriteTo implements io.WriterTo.
    **/
    @:native("WriteTo") function writeTo(w: go.io.Writer): (go.Result<go.Int64>);

}