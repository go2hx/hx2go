package go.mime.quotedprintable;

/**
    Reader is a quoted-printable decoder.
**/
@:structInit
@:go.Type({ name: "Reader", instanceName: "quotedprintable.Reader", imports: ["mime/quotedprintable"] })
extern class Reader {

    /**
        Read reads and decodes quoted-printable data from the underlying reader.
    **/
    @:native("Read") function read(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}