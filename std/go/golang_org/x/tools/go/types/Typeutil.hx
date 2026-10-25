package go.golang_org.x.tools.go.types;

/**
    Package typeutil defines various utilities for types, such as [Map],
    a hash table that maps [types.Type] to any value.
**/
@:go.Type({ name: "typeutil", instanceName: "typeutil.typeutil", imports: ["golang.org/x/tools/go/types/typeutil"] })
extern class Typeutil {

    /**
        Callee returns the named target of a function call, if any:
        a function, method, builtin, or variable.
        It returns nil for a T(x) conversion.
        
        Functions and methods may potentially have type parameters.
        
        Note: for calls of instantiated functions and methods, Callee returns
        the corresponding generic function or method on the generic type.
    **/
    @:native("Callee") static function callee(info: go.Pointer<go.go.types.Info>, call: go.Pointer<go.go.ast.CallExpr>): (go.go.types.Object);
    /**
        Dependencies returns all dependencies of the specified packages.
        
        Dependent packages appear in topological order: if package P imports
        package Q, Q appears earlier than P in the result.
        The algorithm follows import statements in the order they
        appear in the source code, so the result is a total order.
    **/
    @:native("Dependencies") static function dependencies(pkgs: haxe.Rest<go.Pointer<go.go.types.Package>>): (go.Slice<go.Pointer<go.go.types.Package>>);
    /**
        IntuitiveMethodSet returns the intuitive method set of a type T,
        which is the set of methods you can call on an addressable value of
        that type.
        
        The result always contains MethodSet(T), and is exactly MethodSet(T)
        for interface types and for pointer-to-concrete types.
        For all other concrete types T, the result additionally
        contains each method belonging to *T if there is no identically
        named method on T itself.
        
        This corresponds to user intuition about method sets;
        this function is intended only for user interfaces.
        
        The order of the result is as for types.MethodSet(T).
    **/
    @:native("IntuitiveMethodSet") static function intuitiveMethodSet(T: go.go.types.Type, msets: go.Pointer<go.golang_org.x.tools.go.types.typeutil.MethodSetCache>): (go.Slice<go.Pointer<go.go.types.Selection>>);
    /**
        MakeHasher returns Hasher{}.
        Hashers are stateless; all are equivalent.
    **/
    @:native("MakeHasher") static function makeHasher(): (go.golang_org.x.tools.go.types.typeutil.Hasher);
    /**
        StaticCallee returns the target (function or method) of a static function
        call, if any. It returns nil for calls to builtins.
        
        Note: for calls of instantiated functions and methods, StaticCallee returns
        the corresponding generic function or method on the generic type.
    **/
    @:native("StaticCallee") static function staticCallee(info: go.Pointer<go.go.types.Info>, call: go.Pointer<go.go.ast.CallExpr>): (go.Pointer<go.go.types.Func>);

}