package go.golang_org.x.term;

/**
    Terminal contains the state for running a VT100 terminal that is capable of
    reading lines of input.
**/
@:structInit
@:go.Type({ name: "Terminal", instanceName: "term.Terminal", imports: ["golang.org/x/term"] })
extern class Terminal {

    @:native("AutoCompleteCallback") var autoCompleteCallback: (line: String, pos: go.GoInt, key: go.Rune) -> (go.Tuple<{ newLine: String, newPos: go.GoInt, ok: Bool }>);
    @:native("Escape") var escape: go.Pointer<go.golang_org.x.term.EscapeCodes>;
    @:native("History") var history: go.golang_org.x.term.History;

    function new(autoCompleteCallback: (line: String, pos: go.GoInt, key: go.Rune) -> (go.Tuple<{ newLine: String, newPos: go.GoInt, ok: Bool }>)=null, escape: go.Pointer<go.golang_org.x.term.EscapeCodes>=null, history: go.golang_org.x.term.History=null);

    /**
        ReadLine returns a line of input from the terminal.
    **/
    @:native("ReadLine") function readLine(): (go.Result<String>);
    /**
        ReadPassword temporarily changes the prompt and reads a password, without
        echo, from the terminal.
        
        The AutoCompleteCallback is disabled during this call.
    **/
    @:native("ReadPassword") function readPassword(prompt: String): (go.Result<String>);
    /**
        SetBracketedPasteMode requests that the terminal bracket paste operations
        with markers. Not all terminals support this but, if it is supported, then
        enabling this mode will stop any autocomplete callback from running due to
        pastes. Additionally, any lines that are completely pasted will be returned
        from ReadLine with the error set to ErrPasteIndicator.
    **/
    @:native("SetBracketedPasteMode") function setBracketedPasteMode(on: Bool): Void;
    /**
        SetPrompt sets the prompt to be used when reading subsequent lines.
    **/
    @:native("SetPrompt") function setPrompt(prompt: String): Void;
    @:native("SetSize") function setSize(width: go.GoInt, height: go.GoInt): (go.Error);
    @:native("Write") function write(buf: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}