package go.mime.multipart;

/**
    A Writer generates multipart messages.
**/
@:structInit
@:go.Type({ name: "Writer", instanceName: "multipart.Writer", imports: ["mime/multipart"] })
extern class Writer {

    /**
        Boundary returns the [Writer]'s boundary.
    **/
    @:native("Boundary") function boundary(): (String);
    /**
        Close finishes the multipart message and writes the trailing
        boundary end line to the output.
    **/
    @:native("Close") function close(): (go.Error);
    /**
        CreateFormField calls [Writer.CreatePart] with a header using the
        given field name.
    **/
    @:native("CreateFormField") function createFormField(fieldname: String): (go.Result<go.io.Writer>);
    /**
        CreateFormFile is a convenience wrapper around [Writer.CreatePart]. It creates
        a new form-data header with the provided field name and file name.
    **/
    @:native("CreateFormFile") function createFormFile(fieldname: String, filename: String): (go.Result<go.io.Writer>);
    /**
        CreatePart creates a new multipart section with the provided
        header. The body of the part should be written to the returned
        [Writer]. After calling CreatePart, any previous part may no longer
        be written to.
    **/
    @:native("CreatePart") function createPart(header: go.net.textproto.MIMEHeader): (go.Result<go.io.Writer>);
    /**
        FormDataContentType returns the Content-Type for an HTTP
        multipart/form-data with this [Writer]'s Boundary.
    **/
    @:native("FormDataContentType") function formDataContentType(): (String);
    /**
        SetBoundary overrides the [Writer]'s default randomly-generated
        boundary separator with an explicit value.
        
        SetBoundary must be called before any parts are created, may only
        contain certain ASCII characters, and must be non-empty and
        at most 70 bytes long.
    **/
    @:native("SetBoundary") function setBoundary(boundary: String): (go.Error);
    /**
        WriteField calls [Writer.CreateFormField] and then writes the given value.
    **/
    @:native("WriteField") function writeField(fieldname: String, value: String): (go.Error);

}