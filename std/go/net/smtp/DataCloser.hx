package go.net.smtp;

@:structInit
@:go.Type({ name: "dataCloser", instanceName: "smtp.dataCloser", imports: ["net/smtp"] })
extern class DataCloser {

    @:native("WriteCloser") var writeCloser: go.io.WriteCloser;

    function new(writeCloser: go.io.WriteCloser);

    @:native("Close") function close(): (go.Error);
    @:native("Write") function write(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}