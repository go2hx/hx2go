package go.mime;

@:go.Type({ name: "multipart", instanceName: "multipart.multipart", imports: ["mime/multipart"] })
extern class Multipart {

    @:native("FileContentDisposition") static function fileContentDisposition(fieldname: String, filename: String): String;
    @:native("NewReader") static function newReader(r: go.io.Reader, boundary: String): go.Pointer<go.mime.multipart.Reader>;
    @:native("NewWriter") static function newWriter(w: go.io.Writer): go.Pointer<go.mime.multipart.Writer>;

}