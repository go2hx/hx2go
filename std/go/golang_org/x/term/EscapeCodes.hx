package go.golang_org.x.term;

@:structInit
@:go.Type({ name: "EscapeCodes", instanceName: "term.EscapeCodes", imports: ["golang.org/x/term"] })
extern class EscapeCodes {

    @:native("Black") var black: go.Slice<go.Byte>;
    @:native("Red") var red: go.Slice<go.Byte>;
    @:native("Green") var green: go.Slice<go.Byte>;
    @:native("Yellow") var yellow: go.Slice<go.Byte>;
    @:native("Blue") var blue: go.Slice<go.Byte>;
    @:native("Magenta") var magenta: go.Slice<go.Byte>;
    @:native("Cyan") var cyan: go.Slice<go.Byte>;
    @:native("White") var white: go.Slice<go.Byte>;
    @:native("Reset") var reset: go.Slice<go.Byte>;

    function new(black: go.Slice<go.Byte>=null, red: go.Slice<go.Byte>=null, green: go.Slice<go.Byte>=null, yellow: go.Slice<go.Byte>=null, blue: go.Slice<go.Byte>=null, magenta: go.Slice<go.Byte>=null, cyan: go.Slice<go.Byte>=null, white: go.Slice<go.Byte>=null, reset: go.Slice<go.Byte>=null);

}