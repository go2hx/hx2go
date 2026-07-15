package go.mime.multipart;

@:structInit
@:go.Type({ name: "FileHeader", instanceName: "multipart.FileHeader", imports: ["mime/multipart"] })
extern class FileHeader {

    @:native("Filename") var filename: String;
    @:native("Header") var header: go.net.textproto.MIMEHeader;
    @:native("Size") var size: go.Int64;

function new(filename: String, header: go.net.textproto.MIMEHeader, size: go.Int64);

    @:native("Open") function open(): go.Result<go.mime.multipart.File>;

}