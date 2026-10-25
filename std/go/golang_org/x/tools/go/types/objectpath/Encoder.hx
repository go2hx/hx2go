package go.golang_org.x.tools.go.types.objectpath;

/**
    An Encoder amortizes the cost of encoding the paths of multiple objects.
    The zero value of an Encoder is ready to use.
**/
@:structInit
@:go.Type({ name: "Encoder", instanceName: "objectpath.Encoder", imports: ["golang.org/x/tools/go/types/objectpath"] })
extern class Encoder {

    /**
        For returns the path to an object relative to its package,
        or an error if the object is not accessible from the package's Scope.
        
        For is safe for concurrent use.
        
        The For function guarantees to return a path only for the following objects:
        - package-level types
        - exported package-level non-types
        - methods
        - parameter and result variables
        - struct fields
        These objects are sufficient to define the API of their package.
        The objects described by a package's export data are drawn from this set.
        
        The set of objects accessible from a package's Scope depends on
        whether the package was produced by type-checking syntax, or
        reading export data; the latter may have a smaller Scope since
        export data trims objects that are not reachable from an exported
        declaration. For example, the For function will return a path for
        an exported method of an unexported type that is not reachable
        from any public declaration; this path will cause the Object
        function to fail if called on a package loaded from export data.
        TODO(adonovan): is this a bug or feature? Should this package
        compute accessibility in the same way?
        
        For does not return a path for predeclared names, imported package
        names, local names, and unexported package-level names (except
        types).
        
        Example: given this definition,
        
        	package p
        
        	type T interface {
        		f() (a string, b struct{ X int })
        	}
        
        For(X) would return a path that denotes the following sequence of operations:
        
        	p.Scope().Lookup("T")				(TypeName T)
        	.Type().Underlying().Method(0).			(method Func f)
        	.Type().Results().At(1)				(field Var b)
        	.Type().Field(0)					(field Var X)
        
        where p is the package (*types.Package) to which X belongs.
    **/
    @:native("For") function _for(obj: go.go.types.Object): (go.Result<go.golang_org.x.tools.go.types.objectpath.Path>);

}