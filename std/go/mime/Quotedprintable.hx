package go.mime;

@:go.Type({ name: "quotedprintable", instanceName: "quotedprintable.quotedprintable", imports: ["mime/quotedprintable"] })
extern class Quotedprintable {

    @:native("NewReader") static function newReader(r: go.io.Reader): go.Pointer<go.mime.quotedprintable.Reader>;
    @:native("NewWriter") static function newWriter(w: go.io.Writer): go.Pointer<go.mime.quotedprintable.Writer>;

}