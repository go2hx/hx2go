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

    function new(black: go.Slice<go.Byte>, red: go.Slice<go.Byte>, green: go.Slice<go.Byte>, yellow: go.Slice<go.Byte>, blue: go.Slice<go.Byte>, magenta: go.Slice<go.Byte>, cyan: go.Slice<go.Byte>, white: go.Slice<go.Byte>, reset: go.Slice<go.Byte>);

}