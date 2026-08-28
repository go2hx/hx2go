package go.net.textproto;

/**
    A Conn represents a textual network protocol connection.
    It consists of a [Reader] and [Writer] to manage I/O
    and a [Pipeline] to sequence concurrent requests on the connection.
    These embedded types carry methods with them;
    see the documentation of those types for details.
**/
@:structInit
@:go.Type({ name: "Conn", instanceName: "textproto.Conn", imports: ["net/textproto"] })
extern class Conn {

    @:native("Reader") var reader: go.net.textproto.Reader;
    @:native("Writer") var writer: go.net.textproto.Writer;
    @:native("Pipeline") var pipeline: go.net.textproto.Pipeline;
    @:native("R") var R: go.Pointer<go.bufio.Reader>;
    @:native("W") var W: go.Pointer<go.bufio.Writer>;

    function new(reader: go.net.textproto.Reader, writer: go.net.textproto.Writer, pipeline: go.net.textproto.Pipeline);

    /**
        Close closes the connection.
    **/
    @:native("Close") function close(): (go.Error);
    /**
        Cmd is a convenience method that sends a command after
        waiting its turn in the pipeline. The command text is the
        result of formatting format with args and appending \r\n.
        Cmd returns the id of the command, for use with StartResponse and EndResponse.
        
        For example, a client might run a HELP command that returns a dot-body
        by using:
        
        	id, err := c.Cmd("HELP")
        	if err != nil {
        		return nil, err
        	}
        
        	c.StartResponse(id)
        	defer c.EndResponse(id)
        
        	if _, _, err = c.ReadCodeLine(110); err != nil {
        		return nil, err
        	}
        	text, err := c.ReadDotBytes()
        	if err != nil {
        		return nil, err
        	}
        	return c.ReadCodeLine(250)
    **/
    @:native("Cmd") function cmd(format: String, args: haxe.Rest<Dynamic>): (go.Result<go.GoUInt>);
    @:native("DotReader") function dotReader(): (go.io.Reader);
    @:native("DotWriter") function dotWriter(): (go.io.WriteCloser);
    @:native("EndRequest") function endRequest(id: go.GoUInt): Void;
    @:native("EndResponse") function endResponse(id: go.GoUInt): Void;
    @:native("Next") function next(): (go.GoUInt);
    @:native("PrintfLine") function printfLine(format: String, args: haxe.Rest<Dynamic>): (go.Error);
    @:go.Tuple("code", "message", "err") @:native("ReadCodeLine") function readCodeLine(expectCode: go.GoInt): (go.Tuple<{ code: go.GoInt, message: String, err: go.Error }>);
    @:native("ReadContinuedLine") function readContinuedLine(): (go.Result<String>);
    @:native("ReadContinuedLineBytes") function readContinuedLineBytes(): (go.Result<go.Slice<go.Byte>>);
    @:native("ReadDotBytes") function readDotBytes(): (go.Result<go.Slice<go.Byte>>);
    @:native("ReadDotLines") function readDotLines(): (go.Result<go.Slice<String>>);
    @:native("ReadLine") function readLine(): (go.Result<String>);
    @:native("ReadLineBytes") function readLineBytes(): (go.Result<go.Slice<go.Byte>>);
    @:native("ReadMIMEHeader") function readMIMEHeader(): (go.Result<go.net.textproto.MIMEHeader>);
    @:go.Tuple("code", "message", "err") @:native("ReadResponse") function readResponse(expectCode: go.GoInt): (go.Tuple<{ code: go.GoInt, message: String, err: go.Error }>);
    @:native("StartRequest") function startRequest(id: go.GoUInt): Void;
    @:native("StartResponse") function startResponse(id: go.GoUInt): Void;

}