package go.net.textproto;

/**
    A Writer implements convenience methods for writing
    requests or responses to a text protocol network connection.
**/
@:structInit
@:go.Type({ name: "Writer", instanceName: "textproto.Writer", imports: ["net/textproto"] })
extern class Writer {

    @:native("W") var W: go.Pointer<go.bufio.Writer>;

    function new(W: go.Pointer<go.bufio.Writer>=null);

    /**
        DotWriter returns a writer that can be used to write a dot-encoding to w.
        It takes care of inserting leading dots when necessary,
        translating line-ending \n into \r\n, and adding the final .\r\n line
        when the DotWriter is closed. The caller should close the
        DotWriter before the next call to a method on w.
        
        See the documentation for the [Reader.DotReader] method for details about dot-encoding.
    **/
    @:native("DotWriter") function dotWriter(): (go.io.WriteCloser);
    /**
        PrintfLine writes the formatted output followed by \r\n.
    **/
    @:native("PrintfLine") function printfLine(format: String, args: haxe.Rest<Dynamic>): (go.Error);

}