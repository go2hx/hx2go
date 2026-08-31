package go;

/**
    Package mime implements parts of the MIME spec.
**/
@:go.Type({ name: "mime", instanceName: "mime.mime", imports: ["mime"] })
extern class Mime {

    @:native("BEncoding") static var bEncoding: go.mime.WordEncoder;
    @:native("QEncoding") static var qEncoding: go.mime.WordEncoder;

    /**
        AddExtensionType sets the MIME type associated with
        the extension ext to typ. The extension should begin with
        a leading dot, as in ".html".
    **/
    @:native("AddExtensionType") static function addExtensionType(ext: String, typ: String): (go.Error);
    /**
        ExtensionsByType returns the extensions known to be associated with the MIME
        type typ. The returned extensions will each begin with a leading dot, as in
        ".html". When typ has no associated extensions, ExtensionsByType returns an
        nil slice.
        
        The built-in table is small but on unix it is augmented by the local
        system's MIME-info database or mime.types file(s) if available under one or
        more of these names:
        
        	/usr/local/share/mime/globs2
        	/usr/share/mime/globs2
        	/etc/mime.types
        	/etc/apache2/mime.types
        	/etc/apache/mime.types
        	/etc/httpd/conf/mime.types
        
        On Windows, extensions are extracted from the registry.
    **/
    @:native("ExtensionsByType") static function extensionsByType(typ: String): (go.Result<go.Slice<String>>);
    /**
        FormatMediaType serializes mediatype t and the parameters
        param as a media type conforming to RFC 2045 and RFC 2616.
        The type and parameter names are written in lower-case.
        When any of the arguments result in a standard violation then
        FormatMediaType returns the empty string.
    **/
    @:native("FormatMediaType") static function formatMediaType(t: String, param: go.Map<String, String>): (String);
    /**
        ParseMediaType parses a media type value and any optional
        parameters, per RFC 1521.  Media types are the values in
        Content-Type and Content-Disposition headers (RFC 2183).
        On success, ParseMediaType returns the media type converted
        to lowercase and trimmed of white space and a non-nil map.
        If there is an error parsing the optional parameter,
        the media type will be returned along with the error
        [ErrInvalidMediaParameter].
        The returned map, params, maps from the lowercase
        attribute to the attribute value with its case preserved.
    **/
    @:go.Tuple("mediatype", "params", "err") @:native("ParseMediaType") static function parseMediaType(v: String): (go.Tuple<{ mediatype: String, params: go.Map<String, String>, err: go.Error }>);
    /**
        TypeByExtension returns the MIME type associated with the file extension ext.
        The extension ext should begin with a leading dot, as in ".html".
        When ext has no associated type, TypeByExtension returns "".
        
        Extensions are looked up first case-sensitively, then case-insensitively.
        
        The built-in table is small but on unix it is augmented by the local
        system's MIME-info database or mime.types file(s) if available under one or
        more of these names:
        
        	/usr/local/share/mime/globs2
        	/usr/share/mime/globs2
        	/etc/mime.types
        	/etc/apache2/mime.types
        	/etc/apache/mime.types
        	/etc/httpd/conf/mime.types
        
        On Windows, MIME types are extracted from the registry.
        
        Text types have the charset parameter set to "utf-8" by default.
    **/
    @:native("TypeByExtension") static function typeByExtension(ext: String): (String);

}