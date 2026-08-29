package go.go.ast;

/**
    The MergeMode flags control the behavior of [MergePackageFiles].
    
    Deprecated: use the type checker [go/types] instead of [Package];
    see [Object].
**/
@:go.Type({ name: "MergeMode", instanceName: "ast.MergeMode", imports: ["go/ast"] })
extern typedef MergeMode = go.GoUInt