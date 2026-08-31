package go.go.ast;

/**
    The direction of a channel type is indicated by a bit
    mask including one or both of the following constants.
**/
@:go.Type({ name: "ChanDir", instanceName: "ast.ChanDir", imports: ["go/ast"] })
extern typedef ChanDir = go.GoInt