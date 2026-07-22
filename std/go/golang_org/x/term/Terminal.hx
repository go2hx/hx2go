package go.golang_org.x.term;

@:structInit
@:go.Type({ name: "Terminal", instanceName: "term.Terminal", imports: ["golang.org/x/term"] })
extern class Terminal {

    @:native("AutoCompleteCallback") var autoCompleteCallback: (line: String, pos: go.GoInt, key: go.Rune) -> (go.Tuple<{ newLine: String, newPos: go.GoInt, ok: Bool }>);
    @:native("Escape") var escape: go.Pointer<go.golang_org.x.term.EscapeCodes>;
    @:native("History") var history: go.golang_org.x.term.History;

    function new(autoCompleteCallback: (line: String, pos: go.GoInt, key: go.Rune) -> (go.Tuple<{ newLine: String, newPos: go.GoInt, ok: Bool }>), escape: go.Pointer<go.golang_org.x.term.EscapeCodes>, history: go.golang_org.x.term.History);

    @:native("ReadLine") function readLine(): (go.Result<String>);
    @:native("ReadPassword") function readPassword(prompt: String): (go.Result<String>);
    @:native("SetBracketedPasteMode") function setBracketedPasteMode(on: Bool): Void;
    @:native("SetPrompt") function setPrompt(prompt: String): Void;
    @:native("SetSize") function setSize(width: go.GoInt, height: go.GoInt): (go.Error);
    @:native("Write") function write(buf: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}