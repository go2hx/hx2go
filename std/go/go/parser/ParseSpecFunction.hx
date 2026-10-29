package go.go.parser;

@:go.Type({ name: "parseSpecFunction", instanceName: "parser.parseSpecFunction", imports: ["go/parser"] })
extern typedef ParseSpecFunction = (doc: go.Pointer<go.go.ast.CommentGroup>, keyword: go.go.token.Token, iota: go.GoInt) -> (go.go.ast.Spec)