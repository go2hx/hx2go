package go.html;

@:go.Type({ name: "template", instanceName: "template.template", imports: ["html/template"] })
extern class Template {

    @:native("ErrAmbigContext") static var errAmbigContext: go.html.template.ErrorCode;
    @:native("ErrBadHTML") static var errBadHTML: go.html.template.ErrorCode;
    @:native("ErrBranchEnd") static var errBranchEnd: go.html.template.ErrorCode;
    @:native("ErrEndContext") static var errEndContext: go.html.template.ErrorCode;
    @:native("ErrJSTemplate") static var errJSTemplate: go.html.template.ErrorCode;
    @:native("ErrNoSuchTemplate") static var errNoSuchTemplate: go.html.template.ErrorCode;
    @:native("ErrOutputContext") static var errOutputContext: go.html.template.ErrorCode;
    @:native("ErrPartialCharset") static var errPartialCharset: go.html.template.ErrorCode;
    @:native("ErrPartialEscape") static var errPartialEscape: go.html.template.ErrorCode;
    @:native("ErrPredefinedEscaper") static var errPredefinedEscaper: go.html.template.ErrorCode;
    @:native("ErrRangeLoopReentry") static var errRangeLoopReentry: go.html.template.ErrorCode;
    @:native("ErrSlashAmbig") static var errSlashAmbig: go.html.template.ErrorCode;
    @:native("OK") static var OK: go.html.template.ErrorCode;

    @:native("HTMLEscape") static function hTMLEscape(w: go.io.Writer, b: go.Slice<go.Byte>): Void;
    @:native("HTMLEscapeString") static function hTMLEscapeString(s: String): (String);
    @:native("HTMLEscaper") static function hTMLEscaper(args: haxe.Rest<Dynamic>): (String);
    @:go.Tuple("truth", "ok") @:native("IsTrue") static function isTrue(val: Dynamic): (go.Tuple<{ truth: Bool, ok: Bool }>);
    @:native("JSEscape") static function jSEscape(w: go.io.Writer, b: go.Slice<go.Byte>): Void;
    @:native("JSEscapeString") static function jSEscapeString(s: String): (String);
    @:native("JSEscaper") static function jSEscaper(args: haxe.Rest<Dynamic>): (String);
    @:native("Must") static function must(t: go.Pointer<go.html.template.Template>, err: go.Error): (go.Pointer<go.html.template.Template>);
    @:native("New") static function _new(name: String): (go.Pointer<go.html.template.Template>);
    @:native("ParseFS") static function parseFS(fs: go.io.fs.FS, patterns: haxe.Rest<String>): (go.Result<go.Pointer<go.html.template.Template>>);
    @:native("ParseFiles") static function parseFiles(filenames: haxe.Rest<String>): (go.Result<go.Pointer<go.html.template.Template>>);
    @:native("ParseGlob") static function parseGlob(pattern: String): (go.Result<go.Pointer<go.html.template.Template>>);
    @:native("URLQueryEscaper") static function uRLQueryEscaper(args: haxe.Rest<Dynamic>): (String);

}