package go.mime.multipart;

/**
    A FileHeader describes a file part of a multipart request.
**/
@:structInit
@:go.Type({ name: "FileHeader", instanceName: "multipart.FileHeader", imports: ["mime/multipart"] })
extern class FileHeader {

    @:native("Filename") var filename: String;
    @:native("Header") var header: go.net.textproto.MIMEHeader;
    @:native("Size") var size: go.Int64;

    function new(filename: String="", header: go.net.textproto.MIMEHeader=null, size: go.Int64=0);

    /**
        Open opens and returns the [FileHeader]'s associated File.
    **/
    @:native("Open") function open(): (go.Result<go.mime.multipart.File>);

}