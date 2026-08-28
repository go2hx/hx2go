package go.go.token;

/**
    Position describes an arbitrary source position
    including the file, line, and column location.
    A Position is valid if the line number is > 0.
**/
@:structInit
@:go.Type({ name: "Position", instanceName: "token.Position", imports: ["go/token"] })
extern class Position {

    @:native("Filename") var filename: std.String;
    @:native("Offset") var offset: go.GoInt;
    @:native("Line") var line: go.GoInt;
    @:native("Column") var column: go.GoInt;

    function new(filename: std.String="", offset: go.GoInt=0, line: go.GoInt=0, column: go.GoInt=0);

    /**
        IsValid reports whether the position is valid.
    **/
    @:native("IsValid") function isValid(): (Bool);
    /**
        String returns a string in one of several forms:
        
        	file:line:column    valid position with file name
        	file:line           valid position with file name but no column (column == 0)
        	line:column         valid position without file name
        	line                valid position without file name and no column (column == 0)
        	file                invalid position with file name
        	-                   invalid position without file name
    **/
    @:native("String") function string(): (std.String);

}