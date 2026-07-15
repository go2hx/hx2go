package go.mime.multipart;

@:structInit
@:go.Type({ name: "Writer", instanceName: "multipart.Writer", imports: ["mime/multipart"] })
extern class Writer {

    @:native("Boundary") function boundary(): String;
    @:native("Close") function close(): go.Error;
    @:native("CreateFormField") function createFormField(fieldname: String): go.Result<go.io.Writer>;
    @:native("CreateFormFile") function createFormFile(fieldname: String, filename: String): go.Result<go.io.Writer>;
    @:native("CreatePart") function createPart(header: go.net.textproto.MIMEHeader): go.Result<go.io.Writer>;
    @:native("FormDataContentType") function formDataContentType(): String;
    @:native("SetBoundary") function setBoundary(boundary: String): go.Error;
    @:native("WriteField") function writeField(fieldname: String, value: String): go.Error;

}