package go.net.textproto;

@:structInit
@:go.Type({ name: "Reader", instanceName: "textproto.Reader", imports: ["net/textproto"] })
extern class Reader {

    @:native("R") var R: go.Pointer<go.bufio.Reader>;

function new(R: go.Pointer<go.bufio.Reader>);

    @:native("DotReader") function dotReader(): go.io.Reader;
    @:go.Tuple("code", "message", "err") @:native("ReadCodeLine") function readCodeLine(expectCode: go.GoInt): go.Tuple<{ code: go.GoInt, message: String, err: go.Error }>;
    @:native("ReadContinuedLine") function readContinuedLine(): go.Result<String>;
    @:native("ReadContinuedLineBytes") function readContinuedLineBytes(): go.Result<go.Slice<go.Byte>>;
    @:native("ReadDotBytes") function readDotBytes(): go.Result<go.Slice<go.Byte>>;
    @:native("ReadDotLines") function readDotLines(): go.Result<go.Slice<String>>;
    @:native("ReadLine") function readLine(): go.Result<String>;
    @:native("ReadLineBytes") function readLineBytes(): go.Result<go.Slice<go.Byte>>;
    @:native("ReadMIMEHeader") function readMIMEHeader(): go.Result<go.net.textproto.MIMEHeader>;
    @:go.Tuple("code", "message", "err") @:native("ReadResponse") function readResponse(expectCode: go.GoInt): go.Tuple<{ code: go.GoInt, message: String, err: go.Error }>;

}