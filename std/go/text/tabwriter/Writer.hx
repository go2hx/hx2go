package go.text.tabwriter;

@:structInit
@:go.Type({ name: "Writer", instanceName: "tabwriter.Writer", imports: ["text/tabwriter"] })
extern class Writer {

    @:native("Flush") function flush(): go.Error;
    @:native("Init") function init(output: go.io.Writer, minwidth: go.GoInt, tabwidth: go.GoInt, padding: go.GoInt, padchar: go.Byte, flags: go.GoUInt): go.Pointer<go.text.tabwriter.Writer>;
    @:native("Write") function write(buf: go.Slice<go.Byte>): go.Result<go.GoInt>;

}