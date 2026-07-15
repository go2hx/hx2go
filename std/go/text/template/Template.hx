package go.text.template;

@:structInit
@:go.Type({ name: "Template", instanceName: "template.Template", imports: ["text/template"] })
extern class Template {

    @:native("Tree") var tree: go.Pointer<go.text.template.parse.Tree>;

function new(tree: go.Pointer<go.text.template.parse.Tree>);

    @:native("AddParseTree") function addParseTree(name: String, tree: go.Pointer<go.text.template.parse.Tree>): go.Result<go.Pointer<go.text.template.Template>>;
    @:native("Clone") function clone(): go.Result<go.Pointer<go.text.template.Template>>;
    @:native("Copy") function copy(): go.Pointer<go.text.template.parse.Tree>;
    @:native("DefinedTemplates") function definedTemplates(): String;
    @:native("Delims") function delims(left: String, right: String): go.Pointer<go.text.template.Template>;
    @:go.Tuple("location", "context") @:native("ErrorContext") function errorContext(n: go.text.template.parse.Node): go.Tuple<{ location: String, context: String }>;
    @:native("Execute") function execute(wr: go.io.Writer, data: Dynamic): go.Error;
    @:native("ExecuteTemplate") function executeTemplate(wr: go.io.Writer, name: String, data: Dynamic): go.Error;
    @:native("Funcs") function funcs(funcMap: go.text.template.FuncMap): go.Pointer<go.text.template.Template>;
    @:native("Lookup") function lookup(name: String): go.Pointer<go.text.template.Template>;
    @:native("Name") function name(): String;
    @:native("New") function _new(name: String): go.Pointer<go.text.template.Template>;
    @:native("Option") function option(opt: haxe.Rest<String>): go.Pointer<go.text.template.Template>;
    @:native("Parse") function parse(text: String): go.Result<go.Pointer<go.text.template.Template>>;
    @:native("ParseFS") function parseFS(fsys: go.io.fs.FS, patterns: haxe.Rest<String>): go.Result<go.Pointer<go.text.template.Template>>;
    @:native("ParseFiles") function parseFiles(filenames: haxe.Rest<String>): go.Result<go.Pointer<go.text.template.Template>>;
    @:native("ParseGlob") function parseGlob(pattern: String): go.Result<go.Pointer<go.text.template.Template>>;
    @:native("Templates") function templates(): go.Slice<go.Pointer<go.text.template.Template>>;

}