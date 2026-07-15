package go.mime.multipart;

@:structInit
@:go.Type({ name: "Part", instanceName: "multipart.Part", imports: ["mime/multipart"] })
extern class Part {

    @:native("Header") var header: go.net.textproto.MIMEHeader;

function new(header: go.net.textproto.MIMEHeader);

    @:native("Close") function close(): go.Error;
    @:native("FileName") function fileName(): String;
    @:native("FormName") function formName(): String;
    @:native("Read") function read(d: go.Slice<go.Byte>): go.Result<go.GoInt>;

}