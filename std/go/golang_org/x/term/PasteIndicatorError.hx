package go.golang_org.x.term;

@:structInit
@:go.Type({ name: "pasteIndicatorError", instanceName: "term.pasteIndicatorError", imports: ["golang.org/x/term"] })
extern class PasteIndicatorError {

    @:native("Error") function error(): (String);

}