package go.mime.multipart;

/**
    Reader is an iterator over parts in a MIME multipart body.
    Reader's underlying parser consumes its input as needed. Seeking
    isn't supported.
**/
@:structInit
@:go.Type({ name: "Reader", instanceName: "multipart.Reader", imports: ["mime/multipart"] })
extern class Reader {

    /**
        NextPart returns the next part in the multipart or an error.
        When there are no more parts, the error [io.EOF] is returned.
        
        As a special case, if the "Content-Transfer-Encoding" header
        has a value of "quoted-printable", that header is instead
        hidden and the body is transparently decoded during Read calls.
    **/
    @:native("NextPart") function nextPart(): (go.Result<go.Pointer<go.mime.multipart.Part>>);
    /**
        NextRawPart returns the next part in the multipart or an error.
        When there are no more parts, the error [io.EOF] is returned.
        
        Unlike [Reader.NextPart], it does not have special handling for
        "Content-Transfer-Encoding: quoted-printable".
    **/
    @:native("NextRawPart") function nextRawPart(): (go.Result<go.Pointer<go.mime.multipart.Part>>);
    /**
        ReadForm parses an entire multipart message whose parts have
        a Content-Disposition of "form-data".
        It stores up to maxMemory bytes + 10MB (reserved for non-file parts)
        in memory. File parts which can't be stored in memory will be stored on
        disk in temporary files.
        It returns [ErrMessageTooLarge] if all non-file parts can't be stored in
        memory.
    **/
    @:native("ReadForm") function readForm(maxMemory: go.Int64): (go.Result<go.Pointer<go.mime.multipart.Form>>);

}