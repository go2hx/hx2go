package go;

@:go.Type({ name: "mime", instanceName: "mime.mime", imports: ["mime"] })
extern class Mime {

    @:native("BEncoding") static var BEncoding: go.mime.WordEncoder;
    @:native("QEncoding") static var QEncoding: go.mime.WordEncoder;

    @:native("AddExtensionType") static function addExtensionType(ext: String, typ: String): go.Error;
    @:native("ExtensionsByType") static function extensionsByType(typ: String): go.Result<go.Slice<String>>;
    @:native("FormatMediaType") static function formatMediaType(t: String, param: go.Map<String, String>): String;
    @:go.Tuple("mediatype", "params", "err") @:native("ParseMediaType") static function parseMediaType(v: String): go.Tuple<{ mediatype: String, params: go.Map<String, String>, err: go.Error }>;
    @:native("TypeByExtension") static function typeByExtension(ext: String): String;

}