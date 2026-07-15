package go.text;

@:go.Type({ name: "template", instanceName: "template.template", imports: ["text/template"] })
extern class Template {

    @:native("HTMLEscape") static function hTMLEscape(w: go.io.Writer, b: go.Slice<go.Byte>): Void;
    @:native("HTMLEscapeString") static function hTMLEscapeString(s: String): String;
    @:native("HTMLEscaper") static function hTMLEscaper(args: haxe.Rest<Dynamic>): String;
    @:go.Tuple("truth", "ok") @:native("IsTrue") static function isTrue(val: Dynamic): go.Tuple<{ truth: Bool, ok: Bool }>;
    @:native("JSEscape") static function jSEscape(w: go.io.Writer, b: go.Slice<go.Byte>): Void;
    @:native("JSEscapeString") static function jSEscapeString(s: String): String;
    @:native("JSEscaper") static function jSEscaper(args: haxe.Rest<Dynamic>): String;
    @:native("Must") static function must(t: go.Pointer<go.text.template.Template>, err: go.Error): go.Pointer<go.text.template.Template>;
    @:native("New") static function _new(name: String): go.Pointer<go.text.template.Template>;
    @:native("ParseFS") static function parseFS(fsys: go.io.fs.FS, patterns: haxe.Rest<String>): go.Result<go.Pointer<go.text.template.Template>>;
    @:native("ParseFiles") static function parseFiles(filenames: haxe.Rest<String>): go.Result<go.Pointer<go.text.template.Template>>;
    @:native("ParseGlob") static function parseGlob(pattern: String): go.Result<go.Pointer<go.text.template.Template>>;
    @:native("URLQueryEscaper") static function uRLQueryEscaper(args: haxe.Rest<Dynamic>): String;

}