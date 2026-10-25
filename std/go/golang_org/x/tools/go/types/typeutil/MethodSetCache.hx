package go.golang_org.x.tools.go.types.typeutil;

/**
    A MethodSetCache records the method set of each type T for which
    MethodSet(T) is called so that repeat queries are fast.
    The zero value is a ready-to-use cache instance.
**/
@:structInit
@:go.Type({ name: "MethodSetCache", instanceName: "typeutil.MethodSetCache", imports: ["golang.org/x/tools/go/types/typeutil"] })
extern class MethodSetCache {

    /**
        MethodSet returns the method set of type T.  It is thread-safe.
        
        If cache is nil, this function is equivalent to types.NewMethodSet(T).
        Utility functions can thus expose an optional *MethodSetCache
        parameter to clients that care about performance.
    **/
    @:native("MethodSet") function methodSet(T: go.go.types.Type): (go.Pointer<go.go.types.MethodSet>);

}