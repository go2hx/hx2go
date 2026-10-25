package go.golang_org.x.tools.go.types;

/**
    Package objectpath defines a naming scheme for types.Objects
    (that is, named entities in Go programs) relative to their enclosing
    package.
    
    Type-checker objects are canonical, so they are usually identified by
    their address in memory (a pointer), but a pointer has meaning only
    within one address space. By contrast, objectpath names allow the
    identity of an object to be sent from one program to another,
    establishing a correspondence between types.Object variables that are
    distinct but logically equivalent.
    
    A single object may have multiple paths. In this example,
    
    	type A struct{ X int }
    	type B A
    
    the field X has two paths due to its membership of both A and B.
    The For(obj) function always returns one of these paths, arbitrarily
    but consistently.
**/
@:go.Type({ name: "objectpath", instanceName: "objectpath.objectpath", imports: ["golang.org/x/tools/go/types/objectpath"] })
extern class Objectpath {

    /**
        For is equivalent to new(Encoder).For(obj).
        
        It may be more efficient to reuse a single Encoder across several calls.
    **/
    @:native("For") static function _for(obj: go.go.types.Object): (go.Result<go.golang_org.x.tools.go.types.objectpath.Path>);
    /**
        Object returns the object denoted by path p within the package pkg.
    **/
    @:native("Object") static function object(pkg: go.Pointer<go.go.types.Package>, p: go.golang_org.x.tools.go.types.objectpath.Path): (go.Result<go.go.types.Object>);

}