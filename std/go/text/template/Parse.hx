package go.text.template;

@:go.Type({ name: "parse", instanceName: "parse.parse", imports: ["text/template/parse"] })
extern class Parse {

    @:native("NodeAction") static var NodeAction: go.text.template.parse.NodeType;
    @:native("NodeBool") static var NodeBool: go.text.template.parse.NodeType;
    @:native("NodeBreak") static var NodeBreak: go.text.template.parse.NodeType;
    @:native("NodeChain") static var NodeChain: go.text.template.parse.NodeType;
    @:native("NodeCommand") static var NodeCommand: go.text.template.parse.NodeType;
    @:native("NodeComment") static var NodeComment: go.text.template.parse.NodeType;
    @:native("NodeContinue") static var NodeContinue: go.text.template.parse.NodeType;
    @:native("NodeDot") static var NodeDot: go.text.template.parse.NodeType;
    @:native("NodeField") static var NodeField: go.text.template.parse.NodeType;
    @:native("NodeIdentifier") static var NodeIdentifier: go.text.template.parse.NodeType;
    @:native("NodeIf") static var NodeIf: go.text.template.parse.NodeType;
    @:native("NodeList") static var NodeList: go.text.template.parse.NodeType;
    @:native("NodeNil") static var NodeNil: go.text.template.parse.NodeType;
    @:native("NodeNumber") static var NodeNumber: go.text.template.parse.NodeType;
    @:native("NodePipe") static var NodePipe: go.text.template.parse.NodeType;
    @:native("NodeRange") static var NodeRange: go.text.template.parse.NodeType;
    @:native("NodeString") static var NodeString: go.text.template.parse.NodeType;
    @:native("NodeTemplate") static var NodeTemplate: go.text.template.parse.NodeType;
    @:native("NodeText") static var NodeText: go.text.template.parse.NodeType;
    @:native("NodeVariable") static var NodeVariable: go.text.template.parse.NodeType;
    @:native("NodeWith") static var NodeWith: go.text.template.parse.NodeType;
    @:native("ParseComments") static var ParseComments: go.text.template.parse.Mode;
    @:native("SkipFuncCheck") static var SkipFuncCheck: go.text.template.parse.Mode;

    @:native("IsEmptyTree") static function isEmptyTree(n: go.text.template.parse.Node): Bool;
    @:native("New") static function _new(name: String, funcs: haxe.Rest<go.Map<String, Dynamic>>): go.Pointer<go.text.template.parse.Tree>;
    @:native("NewIdentifier") static function newIdentifier(ident: String): go.Pointer<go.text.template.parse.IdentifierNode>;
    @:native("Parse") static function parse(name: String, text: String, leftDelim: String, rightDelim: String, funcs: haxe.Rest<go.Map<String, Dynamic>>): go.Result<go.Map<String, go.Pointer<go.text.template.parse.Tree>>>;

}