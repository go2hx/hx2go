package go.mime;

/**
    Package quotedprintable implements quoted-printable encoding as specified by
    RFC 2045.
**/
@:go.Type({ name: "quotedprintable", instanceName: "quotedprintable.quotedprintable", imports: ["mime/quotedprintable"] })
extern class Quotedprintable {

    /**
        NewReader returns a quoted-printable reader, decoding from r.
    **/
    @:native("NewReader") static function newReader(r: go.io.Reader): (go.Pointer<go.mime.quotedprintable.Reader>);
    /**
        NewWriter returns a new [Writer] that writes to w.
    **/
    @:native("NewWriter") static function newWriter(w: go.io.Writer): (go.Pointer<go.mime.quotedprintable.Writer>);

}