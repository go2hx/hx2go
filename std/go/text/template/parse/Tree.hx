package go.text.template.parse;

@:structInit
@:go.Type({ name: "Tree", instanceName: "parse.Tree", imports: ["text/template/parse"] })
extern class Tree {

    @:native("Name") var name: String;
    @:native("ParseName") var parseName: String;
    @:native("Root") var root: go.Pointer<go.text.template.parse.ListNode>;
    @:native("Mode") var mode: go.text.template.parse.Mode;

function new(name: String, parseName: String, root: go.Pointer<go.text.template.parse.ListNode>, mode: go.text.template.parse.Mode);

    @:native("Copy") function copy(): go.Pointer<go.text.template.parse.Tree>;
    @:go.Tuple("location", "context") @:native("ErrorContext") function errorContext(n: go.text.template.parse.Node): go.Tuple<{ location: String, context: String }>;
    @:native("Parse") function parse(text: String, leftDelim: String, rightDelim: String, treeSet: go.Map<String, go.Pointer<go.text.template.parse.Tree>>, funcs: haxe.Rest<go.Map<String, Dynamic>>): go.Result<go.Pointer<go.text.template.parse.Tree>>;

}