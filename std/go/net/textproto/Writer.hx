package go.net.textproto;

@:structInit
@:go.Type({ name: "Writer", instanceName: "textproto.Writer", imports: ["net/textproto"] })
extern class Writer {

    @:native("W") var W: go.Pointer<go.bufio.Writer>;

function new(W: go.Pointer<go.bufio.Writer>);

    @:native("DotWriter") function dotWriter(): go.io.WriteCloser;
    @:native("PrintfLine") function printfLine(format: String, args: haxe.Rest<Dynamic>): go.Error;

}