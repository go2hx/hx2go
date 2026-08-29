package go.archive.tar;

/**
    Reader provides sequential access to the contents of a tar archive.
    Reader.Next advances to the next file in the archive (including the first),
    and then Reader can be treated as an io.Reader to access the file's data.
**/
@:structInit
@:go.Type({ name: "Reader", instanceName: "tar.Reader", imports: ["archive/tar"] })
extern class Reader {

    /**
        Next advances to the next entry in the tar archive.
        The Header.Size determines how many bytes can be read for the next file.
        Any remaining data in the current file is automatically discarded.
        At the end of the archive, Next returns the error io.EOF.
        
        If Next encounters a non-local name (as defined by [filepath.IsLocal])
        and the GODEBUG environment variable contains `tarinsecurepath=0`,
        Next returns the header with an [ErrInsecurePath] error.
        A future version of Go may introduce this behavior by default.
        Programs that want to accept non-local names can ignore
        the [ErrInsecurePath] error and use the returned header.
    **/
    @:native("Next") function next(): (go.Result<go.Pointer<go.archive.tar.Header>>);
    /**
        Read reads from the current file in the tar archive.
        It returns (0, io.EOF) when it reaches the end of that file,
        until [Next] is called to advance to the next file.
        
        If the current file is sparse, then the regions marked as a hole
        are read back as NUL-bytes.
        
        Calling Read on special types like [TypeLink], [TypeSymlink], [TypeChar],
        [TypeBlock], [TypeDir], and [TypeFifo] returns (0, [io.EOF]) regardless of what
        the [Header.Size] claims.
    **/
    @:native("Read") function read(b: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}