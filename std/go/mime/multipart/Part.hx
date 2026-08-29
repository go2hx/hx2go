package go.mime.multipart;

/**
    A Part represents a single part in a multipart body.
**/
@:structInit
@:go.Type({ name: "Part", instanceName: "multipart.Part", imports: ["mime/multipart"] })
extern class Part {

    @:native("Header") var header: go.net.textproto.MIMEHeader;

    function new(header: go.net.textproto.MIMEHeader=null);

    @:native("Close") function close(): (go.Error);
    /**
        FileName returns the filename parameter of the [Part]'s Content-Disposition
        header. If not empty, the filename is passed through filepath.Base (which is
        platform dependent) before being returned.
    **/
    @:native("FileName") function fileName(): (String);
    /**
        FormName returns the name parameter if p has a Content-Disposition
        of type "form-data".  Otherwise it returns the empty string.
    **/
    @:native("FormName") function formName(): (String);
    /**
        Read reads the body of a part, after its headers and before the
        next part (if any) begins.
    **/
    @:native("Read") function read(d: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}