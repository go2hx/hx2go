package go.go.token;

/**
    A FileSet represents a set of source files.
    Methods of file sets are synchronized; multiple goroutines
    may invoke them concurrently.
    
    The byte offsets for each file in a file set are mapped into
    distinct (integer) intervals, one interval [base, base+size]
    per file. [FileSet.Base] represents the first byte in the file, and size
    is the corresponding file size. A [Pos] value is a value in such
    an interval. By determining the interval a [Pos] value belongs
    to, the file, its file base, and thus the byte offset (position)
    the [Pos] value is representing can be computed.
    
    When adding a new file, a file base must be provided. That can
    be any integer value that is past the end of any interval of any
    file already in the file set. For convenience, [FileSet.Base] provides
    such a value, which is simply the end of the Pos interval of the most
    recently added file, plus one. Unless there is a need to extend an
    interval later, using the [FileSet.Base] should be used as argument
    for [FileSet.AddFile].
    
    A [File] may be removed from a FileSet when it is no longer needed.
    This may reduce memory usage in a long-running application.
**/
@:structInit
@:go.Type({ name: "FileSet", instanceName: "token.FileSet", imports: ["go/token"] })
extern class FileSet {

    /**
        AddExistingFiles adds the specified files to the
        FileSet if they are not already present.
        The caller must ensure that no pair of Files that
        would appear in the resulting FileSet overlap.
    **/
    @:native("AddExistingFiles") function addExistingFiles(files: haxe.Rest<go.Pointer<go.go.token.File>>): Void;
    /**
        AddFile adds a new file with a given filename, base offset, and file size
        to the file set s and returns the file. Multiple files may have the same
        name. The base offset must not be smaller than the [FileSet.Base], and
        size must not be negative. As a special case, if a negative base is provided,
        the current value of the [FileSet.Base] is used instead.
        
        Adding the file will set the file set's [FileSet.Base] value to base + size + 1
        as the minimum base value for the next file. The following relationship
        exists between a [Pos] value p for a given file offset offs:
        
        	int(p) = base + offs
        
        with offs in the range [0, size] and thus p in the range [base, base+size].
        For convenience, [File.Pos] may be used to create file-specific position
        values from a file offset.
    **/
    @:native("AddFile") function addFile(filename: std.String, base: go.GoInt, size: go.GoInt): (go.Pointer<go.go.token.File>);
    /**
        Base returns the minimum base offset that must be provided to
        [FileSet.AddFile] when adding the next file.
    **/
    @:native("Base") function base(): (go.GoInt);
    /**
        File returns the file that contains the position p.
        If no such file is found (for instance for p == [NoPos]),
        the result is nil.
    **/
    @:native("File") function file(p: go.go.token.Pos): (go.Pointer<go.go.token.File>);
    /**
        Iterate calls yield for the files in the file set in ascending Base
        order until yield returns false.
    **/
    @:native("Iterate") function iterate(yield: (p0: go.Pointer<go.go.token.File>) -> (Bool)): Void;
    /**
        Position converts a [Pos] p in the fileset into a Position value.
        Calling s.Position(p) is equivalent to calling s.PositionFor(p, true).
    **/
    @:native("Position") function position(p: go.go.token.Pos): (go.go.token.Position);
    /**
        PositionFor converts a [Pos] p in the fileset into a [Position] value.
        If adjusted is set, the position may be adjusted by position-altering
        //line comments; otherwise those comments are ignored.
        p must be a [Pos] value in s or [NoPos].
    **/
    @:native("PositionFor") function positionFor(p: go.go.token.Pos, adjusted: Bool): (go.go.token.Position);
    /**
        Read calls decode to deserialize a file set into s; s must not be nil.
    **/
    @:native("Read") function read(decode: (p0: Dynamic) -> (go.Error)): (go.Error);
    /**
        RemoveFile removes a file from the [FileSet] so that subsequent
        queries for its [Pos] interval yield a negative result.
        This reduces the memory usage of a long-lived [FileSet] that
        encounters an unbounded stream of files.
        
        Removing a file that does not belong to the set has no effect.
    **/
    @:native("RemoveFile") function removeFile(file: go.Pointer<go.go.token.File>): Void;
    /**
        Write calls encode to serialize the file set s.
    **/
    @:native("Write") function write(encode: (p0: Dynamic) -> (go.Error)): (go.Error);

}