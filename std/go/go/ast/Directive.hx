package go.go.ast;

@:structInit
@:go.Type({ name: "Directive", instanceName: "ast.Directive", imports: ["go/ast"] })
extern class Directive {

    @:native("Tool") var tool: String;
    @:native("Name") var name: String;
    @:native("Args") var args: String;
    @:native("Slash") var slash: go.go.token.Pos;
    @:native("ArgsPos") var argsPos: go.go.token.Pos;

function new(tool: String, name: String, args: String, slash: go.go.token.Pos, argsPos: go.go.token.Pos);

    @:native("End") function end(): go.go.token.Pos;
    @:native("ParseArgs") function parseArgs(): go.Result<go.Slice<go.go.ast.DirectiveArg>>;
    @:native("Pos") function pos(): go.go.token.Pos;

}