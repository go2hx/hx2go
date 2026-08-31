package go.text.template.parse;

/**
    Pos represents a byte position in the original input text from which
    this template was parsed.
**/
@:go.Type({ name: "Pos", instanceName: "parse.Pos", imports: ["text/template/parse"] })
extern typedef Pos = haxe.extern.EitherType<go.GoInt, {
    @:native("Position") function position(): (go.text.template.parse.Pos);

}>