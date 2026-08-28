package go.text.template;

/**
    Package parse builds parse trees for templates as defined by text/template
    and html/template. Clients should use those packages to construct templates
    rather than this one, which provides shared internal data structures not
    intended for general use.
**/
@:go.Type({ name: "parse", instanceName: "parse.parse", imports: ["text/template/parse"] })
extern class Parse {

    @:native("NodeAction") static var nodeAction: go.text.template.parse.NodeType;
    @:native("NodeBool") static var nodeBool: go.text.template.parse.NodeType;
    @:native("NodeBreak") static var nodeBreak: go.text.template.parse.NodeType;
    @:native("NodeChain") static var nodeChain: go.text.template.parse.NodeType;
    @:native("NodeCommand") static var nodeCommand: go.text.template.parse.NodeType;
    @:native("NodeComment") static var nodeComment: go.text.template.parse.NodeType;
    @:native("NodeContinue") static var nodeContinue: go.text.template.parse.NodeType;
    @:native("NodeDot") static var nodeDot: go.text.template.parse.NodeType;
    @:native("NodeField") static var nodeField: go.text.template.parse.NodeType;
    @:native("NodeIdentifier") static var nodeIdentifier: go.text.template.parse.NodeType;
    @:native("NodeIf") static var nodeIf: go.text.template.parse.NodeType;
    @:native("NodeList") static var nodeList: go.text.template.parse.NodeType;
    @:native("NodeNil") static var nodeNil: go.text.template.parse.NodeType;
    @:native("NodeNumber") static var nodeNumber: go.text.template.parse.NodeType;
    @:native("NodePipe") static var nodePipe: go.text.template.parse.NodeType;
    @:native("NodeRange") static var nodeRange: go.text.template.parse.NodeType;
    @:native("NodeString") static var nodeString: go.text.template.parse.NodeType;
    @:native("NodeTemplate") static var nodeTemplate: go.text.template.parse.NodeType;
    @:native("NodeText") static var nodeText: go.text.template.parse.NodeType;
    @:native("NodeVariable") static var nodeVariable: go.text.template.parse.NodeType;
    @:native("NodeWith") static var nodeWith: go.text.template.parse.NodeType;
    @:native("ParseComments") static var parseComments: go.text.template.parse.Mode;
    @:native("SkipFuncCheck") static var skipFuncCheck: go.text.template.parse.Mode;

    /**
        IsEmptyTree reports whether this tree (node) is empty of everything but space or comments.
    **/
    @:native("IsEmptyTree") static function isEmptyTree(n: go.text.template.parse.Node): (Bool);
    /**
        New allocates a new parse tree with the given name.
    **/
    @:native("New") static function _new(name: String, funcs: haxe.Rest<go.Map<String, Dynamic>>): (go.Pointer<go.text.template.parse.Tree>);
    /**
        NewIdentifier returns a new [IdentifierNode] with the given identifier name.
    **/
    @:native("NewIdentifier") static function newIdentifier(ident: String): (go.Pointer<go.text.template.parse.IdentifierNode>);
    /**
        Parse returns a map from template name to [Tree], created by parsing the
        templates described in the argument string. The top-level template will be
        given the specified name. If an error is encountered, parsing stops and an
        empty map is returned with the error.
    **/
    @:native("Parse") static function parse(name: String, text: String, leftDelim: String, rightDelim: String, funcs: haxe.Rest<go.Map<String, Dynamic>>): (go.Result<go.Map<String, go.Pointer<go.text.template.parse.Tree>>>);

}