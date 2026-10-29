package go.text.template.parse;

@:go.Type({ name: "stateFn", instanceName: "parse.stateFn", imports: ["text/template/parse"] })
extern typedef StateFn = (p0: go.Pointer<go.text.template.parse.Lexer>) -> (go.text.template.parse.StateFn)