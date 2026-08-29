package go.go.doc;

/**
    A Note represents a marked comment starting with "MARKER(uid): note body".
    Any note with a marker of 2 or more upper case [A-Z] letters and a uid of
    at least one character is recognized. The ":" following the uid is optional.
    Notes are collected in the Package.Notes map indexed by the notes marker.
**/
@:structInit
@:go.Type({ name: "Note", instanceName: "doc.Note", imports: ["go/doc"] })
extern class Note {

    @:native("Pos") var pos: go.go.token.Pos;
    @:native("End") var end: go.go.token.Pos;
    @:native("UID") var UID: String;
    @:native("Body") var body: String;

    function new(pos: go.go.token.Pos=cast 0, end: go.go.token.Pos=cast 0, UID: String="", body: String="");

}