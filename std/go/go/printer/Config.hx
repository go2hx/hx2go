package go.go.printer;

/**
    A Config node controls the output of Fprint.
**/
@:structInit
@:go.Type({ name: "Config", instanceName: "printer.Config", imports: ["go/printer"] })
extern class Config {

    @:native("Mode") var mode: go.go.printer.Mode;
    @:native("Tabwidth") var tabwidth: go.GoInt;
    @:native("Indent") var indent: go.GoInt;

    function new(mode: go.go.printer.Mode=cast 0, tabwidth: go.GoInt=0, indent: go.GoInt=0);

    /**
        Fprint "pretty-prints" an AST node to output for a given configuration cfg.
        Position information is interpreted relative to the file set fset.
        The node type must be *[ast.File], *[CommentedNode], [][ast.Decl], [][ast.Stmt],
        or assignment-compatible to [ast.Expr], [ast.Decl], [ast.Spec], or [ast.Stmt].
    **/
    @:native("Fprint") function fprint(output: go.io.Writer, fset: go.Pointer<go.go.token.FileSet>, node: Dynamic): (go.Error);

}