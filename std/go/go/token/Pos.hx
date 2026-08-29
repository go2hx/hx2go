package go.go.token;

/**
    Pos is a compact encoding of a source position within a file set.
    It can be converted into a [Position] for a more convenient, but much
    larger, representation.
    
    The Pos value for a given file is a number in the range [base, base+size],
    where base and size are specified when a file is added to the file set.
    The difference between a Pos value and the corresponding file base
    corresponds to the byte offset of that position (represented by the Pos value)
    from the beginning of the file. Thus, the file base offset is the Pos value
    representing the first byte in the file.
    
    To create the Pos value for a specific source offset (measured in bytes),
    first add the respective file to the current file set using [FileSet.AddFile]
    and then call [File.Pos](offset) for that file. Given a Pos value p
    for a specific file set fset, the corresponding [Position] value is
    obtained by calling fset.Position(p).
    
    Pos values can be compared directly with the usual comparison operators:
    If two Pos values p and q are in the same file, comparing p and q is
    equivalent to comparing the respective source file offsets. If p and q
    are in different files, p < q is true if the file implied by p was added
    to the respective file set before the file implied by q.
**/
@:go.Type({ name: "Pos", instanceName: "token.Pos", imports: ["go/token"] })
extern typedef Pos = haxe.extern.EitherType<go.GoInt, {
    /**
        IsValid reports whether the position is valid.
    **/
    @:native("IsValid") function isValid(): (Bool);

}>