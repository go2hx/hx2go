package go.go.types;

/**
    A Context is an opaque type checking context. It may be used to share
    identical type instances across type-checked packages or calls to
    Instantiate. Contexts are safe for concurrent use.
    
    The use of a shared context does not guarantee that identical instances are
    deduplicated in all cases.
**/
@:structInit
@:go.Type({ name: "Context", instanceName: "types.Context", imports: ["go/types"] })
extern class Context {

}