package go.go.token;

/**
    A File is a handle for a file belonging to a [FileSet].
    A File has a name, size, and line offset table.
    
    Use [FileSet.AddFile] to create a File.
    A File may belong to more than one FileSet; see [FileSet.AddExistingFiles].
**/
@:structInit
@:go.Type({ name: "File", instanceName: "token.File", imports: ["go/token"] })
extern class File {

    /**
        AddLine adds the line offset for a new line.
        The line offset must be larger than the offset for the previous line
        and smaller than the file size; otherwise the line offset is ignored.
    **/
    @:native("AddLine") function addLine(offset: go.GoInt): Void;
    /**
        AddLineColumnInfo adds alternative file, line, and column number
        information for a given file offset. The offset must be larger
        than the offset for the previously added alternative line info
        and smaller than the file size; otherwise the information is
        ignored.
        
        AddLineColumnInfo is typically used to register alternative position
        information for line directives such as //line filename:line:column.
    **/
    @:native("AddLineColumnInfo") function addLineColumnInfo(offset: go.GoInt, filename: std.String, line: go.GoInt, column: go.GoInt): Void;
    /**
        AddLineInfo is like [File.AddLineColumnInfo] with a column = 1 argument.
        It is here for backward-compatibility for code prior to Go 1.11.
    **/
    @:native("AddLineInfo") function addLineInfo(offset: go.GoInt, filename: std.String, line: go.GoInt): Void;
    /**
        Base returns the base offset of file f as registered with AddFile.
    **/
    @:native("Base") function base(): (go.GoInt);
    /**
        End returns the end position of file f as registered with AddFile.
    **/
    @:native("End") function end(): (go.go.token.Pos);
    /**
        Line returns the line number for the given file position p;
        p must be a [Pos] value in that file or [NoPos].
    **/
    @:native("Line") function line(p: go.go.token.Pos): (go.GoInt);
    /**
        LineCount returns the number of lines in file f.
    **/
    @:native("LineCount") function lineCount(): (go.GoInt);
    /**
        LineStart returns the [Pos] value of the start of the specified line.
        It ignores any alternative positions set using [File.AddLineColumnInfo].
        LineStart panics if the 1-based line number is invalid.
    **/
    @:native("LineStart") function lineStart(line: go.GoInt): (go.go.token.Pos);
    /**
        Lines returns the effective line offset table of the form described by [File.SetLines].
        Callers must not mutate the result.
    **/
    @:native("Lines") function lines(): (go.Slice<go.GoInt>);
    /**
        MergeLine merges a line with the following line. It is akin to replacing
        the newline character at the end of the line with a space (to not change the
        remaining offsets). To obtain the line number, consult e.g. [Position.Line].
        MergeLine will panic if given an invalid line number.
    **/
    @:native("MergeLine") function mergeLine(line: go.GoInt): Void;
    /**
        Name returns the file name of file f as registered with AddFile.
    **/
    @:native("Name") function name(): (std.String);
    /**
        Offset returns the offset for the given file position p.
        
        If p is before the file's start position (or if p is NoPos),
        the result is 0; if p is past the file's end position,
        the result is the file size (see also go.dev/issue/57490).
        
        The following invariant, though not true for offset values
        in general, holds for the result offset:
        f.Offset(f.Pos(offset)) == offset
    **/
    @:native("Offset") function offset(p: go.go.token.Pos): (go.GoInt);
    /**
        Pos returns the Pos value for the given file offset.
        
        If offset is negative, the result is the file's start
        position; if the offset is too large, the result is
        the file's end position (see also go.dev/issue/57490).
        
        The following invariant, though not true for Pos values
        in general, holds for the result p:
        f.Pos(f.Offset(p)) == p.
    **/
    @:native("Pos") function pos(offset: go.GoInt): (go.go.token.Pos);
    /**
        Position returns the Position value for the given file position p.
        If p is out of bounds, it is adjusted to match the File.Offset behavior.
        Calling f.Position(p) is equivalent to calling f.PositionFor(p, true).
    **/
    @:native("Position") function position(p: go.go.token.Pos): (go.go.token.Position);
    /**
        PositionFor returns the Position value for the given file position p.
        If p is out of bounds, it is adjusted to match the File.Offset behavior.
        If adjusted is set, the position may be adjusted by position-altering
        //line comments; otherwise those comments are ignored.
        p must be a Pos value in f or NoPos.
    **/
    @:native("PositionFor") function positionFor(p: go.go.token.Pos, adjusted: Bool): (go.go.token.Position);
    /**
        SetLines sets the line offsets for a file and reports whether it succeeded.
        The line offsets are the offsets of the first character of each line;
        for instance for the content "ab\nc\n" the line offsets are {0, 3}.
        An empty file has an empty line offset table.
        Each line offset must be larger than the offset for the previous line
        and smaller than the file size; otherwise SetLines fails and returns
        false.
        Callers must not mutate the provided slice after SetLines returns.
    **/
    @:native("SetLines") function setLines(lines: go.Slice<go.GoInt>): (Bool);
    /**
        SetLinesForContent sets the line offsets for the given file content.
        It ignores position-altering //line comments.
    **/
    @:native("SetLinesForContent") function setLinesForContent(content: go.Slice<go.Byte>): Void;
    /**
        Size returns the size of file f as registered with AddFile.
    **/
    @:native("Size") function size(): (go.GoInt);

}