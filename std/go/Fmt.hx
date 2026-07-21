package go;

@:structInit
@:go.Type({ name: "fmt", instanceName: "fmt.fmt", imports: ["fmt"] })
extern class Fmt {

    @:native("Append") static function append(b: go.Slice<go.Byte>, a: haxe.Rest<Dynamic>): (go.Slice<go.Byte>);
    @:native("Appendf") static function appendf(b: go.Slice<go.Byte>, format: String, a: haxe.Rest<Dynamic>): (go.Slice<go.Byte>);
    @:native("Appendln") static function appendln(b: go.Slice<go.Byte>, a: haxe.Rest<Dynamic>): (go.Slice<go.Byte>);
    @:native("Errorf") static function errorf(format: String, a: haxe.Rest<Dynamic>): (go.Error);
    @:native("FormatString") static function formatString(state: go.fmt.State, verb: go.Rune): (String);
    @:native("Fprint") static function fprint(w: go.io.Writer, a: haxe.Rest<Dynamic>): (go.Result<go.GoInt>);
    @:native("Fprintf") static function fprintf(w: go.io.Writer, format: String, a: haxe.Rest<Dynamic>): (go.Result<go.GoInt>);
    @:native("Fprintln") static function fprintln(w: go.io.Writer, a: haxe.Rest<Dynamic>): (go.Result<go.GoInt>);
    @:native("Fscan") static function fscan(r: go.io.Reader, a: haxe.Rest<Dynamic>): (go.Result<go.GoInt>);
    @:native("Fscanf") static function fscanf(r: go.io.Reader, format: String, a: haxe.Rest<Dynamic>): (go.Result<go.GoInt>);
    @:native("Fscanln") static function fscanln(r: go.io.Reader, a: haxe.Rest<Dynamic>): (go.Result<go.GoInt>);
    @:native("Print") static function print(a: haxe.Rest<Dynamic>): (go.Result<go.GoInt>);
    @:native("Printf") static function printf(format: String, a: haxe.Rest<Dynamic>): (go.Result<go.GoInt>);
    @:native("Println") static function println(a: haxe.Rest<Dynamic>): (go.Result<go.GoInt>);
    @:native("Scan") static function scan(a: haxe.Rest<Dynamic>): (go.Result<go.GoInt>);
    @:native("Scanf") static function scanf(format: String, a: haxe.Rest<Dynamic>): (go.Result<go.GoInt>);
    @:native("Scanln") static function scanln(a: haxe.Rest<Dynamic>): (go.Result<go.GoInt>);
    @:native("Sprint") static function sprint(a: haxe.Rest<Dynamic>): (String);
    @:native("Sprintf") static function sprintf(format: String, a: haxe.Rest<Dynamic>): (String);
    @:native("Sprintln") static function sprintln(a: haxe.Rest<Dynamic>): (String);
    @:native("Sscan") static function sscan(str: String, a: haxe.Rest<Dynamic>): (go.Result<go.GoInt>);
    @:native("Sscanf") static function sscanf(str: String, format: String, a: haxe.Rest<Dynamic>): (go.Result<go.GoInt>);
    @:native("Sscanln") static function sscanln(str: String, a: haxe.Rest<Dynamic>): (go.Result<go.GoInt>);

}