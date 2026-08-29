package go.text.template.parse;

/**
    Tree is the representation of a single parsed template.
**/
@:structInit
@:go.Type({ name: "Tree", instanceName: "parse.Tree", imports: ["text/template/parse"] })
extern class Tree {

    @:native("Name") var name: String;
    @:native("ParseName") var parseName: String;
    @:native("Root") var root: go.Pointer<go.text.template.parse.ListNode>;
    @:native("Mode") var mode: go.text.template.parse.Mode;

    function new(name: String="", parseName: String="", root: go.Pointer<go.text.template.parse.ListNode>=null, mode: go.text.template.parse.Mode=cast 0);

    /**
        Copy returns a copy of the [Tree]. Any parsing state is discarded.
    **/
    @:native("Copy") function copy(): (go.Pointer<go.text.template.parse.Tree>);
    /**
        ErrorContext returns a textual representation of the location of the node in the input text.
        The receiver is only used when the node does not have a pointer to the tree inside,
        which can occur in old code.
    **/
    @:go.Tuple("location", "context") @:native("ErrorContext") function errorContext(n: go.text.template.parse.Node): (go.Tuple<{ location: String, context: String }>);
    /**
        Parse parses the template definition string to construct a representation of
        the template for execution. If either action delimiter string is empty, the
        default ("{{" or "}}") is used. Embedded template definitions are added to
        the treeSet map.
    **/
    @:native("Parse") function parse(text: String, leftDelim: String, rightDelim: String, treeSet: go.Map<String, go.Pointer<go.text.template.parse.Tree>>, funcs: haxe.Rest<go.Map<String, Dynamic>>): (go.Result<go.Pointer<go.text.template.parse.Tree>>);

}