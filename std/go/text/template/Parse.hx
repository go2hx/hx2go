package go.text.template;

/**
    Package parse builds parse trees for templates as defined by text/template
    and html/template. Clients should use those packages to construct templates
    rather than this one, which provides shared internal data structures not
    intended for general use.
**/
@:go.Type({ name: "parse", instanceName: "parse.parse", imports: ["text/template/parse"] })
extern class Parse {

    @:native("NodeAction") static final nodeAction: go.text.template.parse.NodeType;
    @:native("NodeBool") static final nodeBool: go.text.template.parse.NodeType;
    @:native("NodeBreak") static final nodeBreak: go.text.template.parse.NodeType;
    @:native("NodeChain") static final nodeChain: go.text.template.parse.NodeType;
    @:native("NodeCommand") static final nodeCommand: go.text.template.parse.NodeType;
    @:native("NodeComment") static final nodeComment: go.text.template.parse.NodeType;
    @:native("NodeContinue") static final nodeContinue: go.text.template.parse.NodeType;
    @:native("NodeDot") static final nodeDot: go.text.template.parse.NodeType;
    @:native("NodeField") static final nodeField: go.text.template.parse.NodeType;
    @:native("NodeIdentifier") static final nodeIdentifier: go.text.template.parse.NodeType;
    @:native("NodeIf") static final nodeIf: go.text.template.parse.NodeType;
    @:native("NodeList") static final nodeList: go.text.template.parse.NodeType;
    @:native("NodeNil") static final nodeNil: go.text.template.parse.NodeType;
    @:native("NodeNumber") static final nodeNumber: go.text.template.parse.NodeType;
    @:native("NodePipe") static final nodePipe: go.text.template.parse.NodeType;
    @:native("NodeRange") static final nodeRange: go.text.template.parse.NodeType;
    @:native("NodeString") static final nodeString: go.text.template.parse.NodeType;
    @:native("NodeTemplate") static final nodeTemplate: go.text.template.parse.NodeType;
    @:native("NodeText") static final nodeText: go.text.template.parse.NodeType;
    @:native("NodeVariable") static final nodeVariable: go.text.template.parse.NodeType;
    @:native("NodeWith") static final nodeWith: go.text.template.parse.NodeType;
    @:native("ParseComments") static final parseComments: go.text.template.parse.Mode;
    @:native("SkipFuncCheck") static final skipFuncCheck: go.text.template.parse.Mode;

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