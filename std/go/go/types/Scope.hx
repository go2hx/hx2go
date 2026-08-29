package go.go.types;

/**
    A Scope maintains a set of objects and links to its containing
    (parent) and contained (children) scopes. Objects may be inserted
    and looked up by name. The zero value for Scope is a ready-to-use
    empty scope.
**/
@:structInit
@:go.Type({ name: "Scope", instanceName: "types.Scope", imports: ["go/types"] })
extern class Scope {

    /**
        Child returns the i'th child scope for 0 <= i < NumChildren().
    **/
    @:native("Child") function child(i: go.GoInt): (go.Pointer<go.go.types.Scope>);
    /**
        Children returns a go1.23 iterator over the child scopes nested within scope s.
        
        Example: for child := range scope.Children() { ... }
    **/
    @:native("Children") function children(): (go.iter.Seq<go.Pointer<go.go.types.Scope>>);
    /**
        Contains reports whether pos is within the scope's extent.
        The result is guaranteed to be valid only if the type-checked
        AST has complete position information.
    **/
    @:native("Contains") function contains(pos: go.go.token.Pos): (Bool);
    @:native("End") function end(): (go.go.token.Pos);
    /**
        Innermost returns the innermost (child) scope containing
        pos. If pos is not within any scope, the result is nil.
        The result is also nil for the Universe scope.
        The result is guaranteed to be valid only if the type-checked
        AST has complete position information.
    **/
    @:native("Innermost") function innermost(pos: go.go.token.Pos): (go.Pointer<go.go.types.Scope>);
    /**
        Insert attempts to insert an object obj into scope s.
        If s already contains an alternative object alt with
        the same name, Insert leaves s unchanged and returns alt.
        Otherwise it inserts obj, sets the object's parent scope
        if not already set, and returns nil.
    **/
    @:native("Insert") function insert(obj: go.go.types.Object): (go.go.types.Object);
    /**
        Len returns the number of scope elements.
    **/
    @:native("Len") function len(): (go.GoInt);
    /**
        Lookup returns the object in scope s with the given name if such an
        object exists; otherwise the result is nil.
    **/
    @:native("Lookup") function lookup(name: std.String): (go.go.types.Object);
    /**
        LookupParent follows the parent chain of scopes starting with s until
        it finds a scope where Lookup(name) returns a non-nil object, and then
        returns that scope and object. If a valid position pos is provided,
        only objects that were declared at or before pos are considered.
        If no such scope and object exists, the result is (nil, nil).
        The results are guaranteed to be valid only if the type-checked
        AST has complete position information.
        
        Note that obj.Parent() may be different from the returned scope if the
        object was inserted into the scope and already had a parent at that
        time (see Insert). This can only happen for dot-imported objects
        whose parent is the scope of the package that exported them.
    **/
    @:go.Tuple("p0", "p1") @:native("LookupParent") function lookupParent(name: std.String, pos: go.go.token.Pos): (go.Tuple<{ p0: go.Pointer<go.go.types.Scope>, p1: go.go.types.Object }>);
    /**
        Names returns the scope's element names in sorted order.
    **/
    @:native("Names") function names(): (go.Slice<std.String>);
    /**
        NumChildren returns the number of scopes nested in s.
    **/
    @:native("NumChildren") function numChildren(): (go.GoInt);
    /**
        Parent returns the scope's containing (parent) scope.
    **/
    @:native("Parent") function parent(): (go.Pointer<go.go.types.Scope>);
    /**
        Pos and End describe the scope's source code extent [pos, end).
        The results are guaranteed to be valid only if the type-checked
        AST has complete position information. The extent is undefined
        for Universe and package scopes.
    **/
    @:native("Pos") function pos(): (go.go.token.Pos);
    /**
        String returns a string representation of the scope, for debugging.
    **/
    @:native("String") function string(): (std.String);
    /**
        WriteTo writes a string representation of the scope to w,
        with the scope elements sorted by name.
        The level of indentation is controlled by n >= 0, with
        n == 0 for no indentation.
        If recurse is set, it also writes nested (children) scopes.
    **/
    @:native("WriteTo") function writeTo(w: go.io.Writer, n: go.GoInt, recurse: Bool): Void;

}