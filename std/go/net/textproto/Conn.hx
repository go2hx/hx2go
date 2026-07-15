package go.net.textproto;

@:structInit
@:go.Type({ name: "Conn", instanceName: "textproto.Conn", imports: ["net/textproto"] })
extern class Conn {

    @:native("Reader") var reader: go.net.textproto.Reader;
    @:native("Writer") var writer: go.net.textproto.Writer;
    @:native("Pipeline") var pipeline: go.net.textproto.Pipeline;

function new(reader: go.net.textproto.Reader, writer: go.net.textproto.Writer, pipeline: go.net.textproto.Pipeline);

    @:native("Close") function close(): go.Error;
    @:native("Cmd") function cmd(format: String, args: haxe.Rest<Dynamic>): go.Result<go.GoUInt>;
    @:native("DotReader") function dotReader(): go.io.Reader;
    @:native("DotWriter") function dotWriter(): go.io.WriteCloser;
    @:native("EndRequest") function endRequest(id: go.GoUInt): Void;
    @:native("EndResponse") function endResponse(id: go.GoUInt): Void;
    @:native("Next") function next(): go.GoUInt;
    @:native("PrintfLine") function printfLine(format: String, args: haxe.Rest<Dynamic>): go.Error;
    @:go.Tuple("code", "message", "err") @:native("ReadCodeLine") function readCodeLine(expectCode: go.GoInt): go.Tuple<{ code: go.GoInt, message: String, err: go.Error }>;
    @:native("ReadContinuedLine") function readContinuedLine(): go.Result<String>;
    @:native("ReadContinuedLineBytes") function readContinuedLineBytes(): go.Result<go.Slice<go.Byte>>;
    @:native("ReadDotBytes") function readDotBytes(): go.Result<go.Slice<go.Byte>>;
    @:native("ReadDotLines") function readDotLines(): go.Result<go.Slice<String>>;
    @:native("ReadLine") function readLine(): go.Result<String>;
    @:native("ReadLineBytes") function readLineBytes(): go.Result<go.Slice<go.Byte>>;
    @:native("ReadMIMEHeader") function readMIMEHeader(): go.Result<go.net.textproto.MIMEHeader>;
    @:go.Tuple("code", "message", "err") @:native("ReadResponse") function readResponse(expectCode: go.GoInt): go.Tuple<{ code: go.GoInt, message: String, err: go.Error }>;
    @:native("StartRequest") function startRequest(id: go.GoUInt): Void;
    @:native("StartResponse") function startResponse(id: go.GoUInt): Void;

}