package go.go.doc;

@:structInit
@:go.Type({ name: "Note", instanceName: "doc.Note", imports: ["go/doc"] })
extern class Note {

    @:native("Pos") var pos: go.go.token.Pos;
    @:native("End") var end: go.go.token.Pos;
    @:native("UID") var UID: String;
    @:native("Body") var body: String;

function new(pos: go.go.token.Pos, end: go.go.token.Pos, UID: String, body: String);

}