package go.go.types;

/**
    A Selection describes a selector expression x.f.
    For the declarations:
    
    	type T struct{ x int; E }
    	type E struct{}
    	func (e E) m() {}
    	var p *T
    
    the following relations exist:
    
    	Selector    Kind          Recv    Obj    Type       Index     Indirect
    
    	p.x         FieldVal      T       x      int        {0}       true
    	p.m         MethodVal     *T      m      func()     {1, 0}    true
    	T.m         MethodExpr    T       m      func(T)    {1, 0}    false
**/
@:structInit
@:go.Type({ name: "Selection", instanceName: "types.Selection", imports: ["go/types"] })
extern class Selection {

    /**
        Index describes the path from x to f in x.f.
        The last index entry is the field or method index of the type declaring f;
        either:
        
         1. the list of declared methods of a named type; or
         2. the list of methods of an interface type; or
         3. the list of fields of a struct type.
        
        The earlier index entries are the indices of the embedded fields implicitly
        traversed to get from (the type of) x to f, starting at embedding depth 0.
    **/
    @:native("Index") function index(): (go.Slice<go.GoInt>);
    /**
        Indirect reports whether any pointer indirection was required to get from
        x to f in x.f.
        
        Beware: Indirect spuriously returns true (Go issue #8353) for a
        MethodVal selection in which the receiver argument and parameter
        both have type *T so there is no indirection.
        Unfortunately, a fix is too risky.
    **/
    @:native("Indirect") function indirect(): (Bool);
    /**
        Kind returns the selection kind.
    **/
    @:native("Kind") function kind(): (go.go.types.SelectionKind);
    /**
        Obj returns the object denoted by x.f; a *Var for
        a field selection, and a *Func in all other cases.
    **/
    @:native("Obj") function obj(): (go.go.types.Object);
    /**
        Recv returns the type of x in x.f.
    **/
    @:native("Recv") function recv(): (go.go.types.Type);
    @:native("String") function string(): (std.String);
    /**
        Type returns the type of x.f, which may be different from the type of f.
        See Selection for more information.
    **/
    @:native("Type") function type(): (go.go.types.Type);

}