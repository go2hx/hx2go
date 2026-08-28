package go.go;

/**
    Package types declares the data types and implements
    the algorithms for type-checking of Go packages. Use
    [Config.Check] to invoke the type checker for a package.
    Alternatively, create a new type checker with [NewChecker]
    and invoke it incrementally by calling [Checker.Files].
    
    Type-checking consists of several interdependent phases:
    
    Name resolution maps each identifier ([ast.Ident]) in the program
    to the symbol ([Object]) it denotes. Use the Defs and Uses fields
    of [Info] or the [Info.ObjectOf] method to find the symbol for an
    identifier, and use the Implicits field of [Info] to find the
    symbol for certain other kinds of syntax node.
    
    Constant folding computes the exact constant value
    ([constant.Value]) of every expression ([ast.Expr]) that is a
    compile-time constant. Use the Types field of [Info] to find the
    results of constant folding for an expression.
    
    Type deduction computes the type ([Type]) of every expression
    ([ast.Expr]) and checks for compliance with the language
    specification. Use the Types field of [Info] for the results of
    type deduction.
    
    Applications that need to type-check one or more complete packages
    of Go source code may find it more convenient not to invoke the
    type checker directly but instead to use the Load function in
    package [golang.org/x/tools/go/packages].
    
    For a tutorial, see https://go.dev/s/types-tutorial.
**/
@:go.Type({ name: "types", instanceName: "types.types", imports: ["go/types"] })
extern class Types {

    @:native("Bool") static var bool: go.go.types.BasicKind;
    @:native("Byte") static var byte: go.go.types.BasicKind;
    @:native("Complex128") static var complex128: go.go.types.BasicKind;
    @:native("Complex64") static var complex64: go.go.types.BasicKind;
    @:native("FieldVal") static var fieldVal: go.go.types.SelectionKind;
    @:native("FieldVar") static var fieldVar: go.go.types.VarKind;
    @:native("Float32") static var float32: go.go.types.BasicKind;
    @:native("Float64") static var float64: go.go.types.BasicKind;
    @:native("Int") static var int: go.go.types.BasicKind;
    @:native("Int16") static var int16: go.go.types.BasicKind;
    @:native("Int32") static var int32: go.go.types.BasicKind;
    @:native("Int64") static var int64: go.go.types.BasicKind;
    @:native("Int8") static var int8: go.go.types.BasicKind;
    @:native("Invalid") static var invalid: go.go.types.BasicKind;
    /**
        Properties of basic types.
    **/
    @:native("IsBoolean") static var isBoolean: go.go.types.BasicInfo;
    /**
        Properties of basic types.
    **/
    @:native("IsComplex") static var isComplex: go.go.types.BasicInfo;
    /**
        Properties of basic types.
    **/
    @:native("IsConstType") static var isConstType: go.go.types.BasicInfo;
    /**
        Properties of basic types.
    **/
    @:native("IsFloat") static var isFloat: go.go.types.BasicInfo;
    /**
        Properties of basic types.
    **/
    @:native("IsInteger") static var isInteger: go.go.types.BasicInfo;
    /**
        Properties of basic types.
    **/
    @:native("IsNumeric") static var isNumeric: go.go.types.BasicInfo;
    /**
        Properties of basic types.
    **/
    @:native("IsOrdered") static var isOrdered: go.go.types.BasicInfo;
    /**
        Properties of basic types.
    **/
    @:native("IsString") static var isString: go.go.types.BasicInfo;
    /**
        Properties of basic types.
    **/
    @:native("IsUnsigned") static var isUnsigned: go.go.types.BasicInfo;
    /**
        Properties of basic types.
    **/
    @:native("IsUntyped") static var isUntyped: go.go.types.BasicInfo;
    @:native("LocalVar") static var localVar: go.go.types.VarKind;
    @:native("MethodExpr") static var methodExpr: go.go.types.SelectionKind;
    @:native("MethodVal") static var methodVal: go.go.types.SelectionKind;
    @:native("PackageVar") static var packageVar: go.go.types.VarKind;
    @:native("ParamVar") static var paramVar: go.go.types.VarKind;
    /**
        The direction of a channel is indicated by one of these constants.
    **/
    @:native("RecvOnly") static var recvOnly: go.go.types.ChanDir;
    @:native("RecvVar") static var recvVar: go.go.types.VarKind;
    @:native("ResultVar") static var resultVar: go.go.types.VarKind;
    @:native("Rune") static var rune: go.go.types.BasicKind;
    /**
        The direction of a channel is indicated by one of these constants.
    **/
    @:native("SendOnly") static var sendOnly: go.go.types.ChanDir;
    /**
        The direction of a channel is indicated by one of these constants.
    **/
    @:native("SendRecv") static var sendRecv: go.go.types.ChanDir;
    @:native("String") static var string: go.go.types.BasicKind;
    @:native("Uint") static var uint: go.go.types.BasicKind;
    @:native("Uint16") static var uint16: go.go.types.BasicKind;
    @:native("Uint32") static var uint32: go.go.types.BasicKind;
    @:native("Uint64") static var uint64: go.go.types.BasicKind;
    @:native("Uint8") static var uint8: go.go.types.BasicKind;
    @:native("Uintptr") static var uintptr: go.go.types.BasicKind;
    @:native("UnsafePointer") static var unsafePointer: go.go.types.BasicKind;
    @:native("UntypedBool") static var untypedBool: go.go.types.BasicKind;
    @:native("UntypedComplex") static var untypedComplex: go.go.types.BasicKind;
    @:native("UntypedFloat") static var untypedFloat: go.go.types.BasicKind;
    @:native("UntypedInt") static var untypedInt: go.go.types.BasicKind;
    @:native("UntypedNil") static var untypedNil: go.go.types.BasicKind;
    @:native("UntypedRune") static var untypedRune: go.go.types.BasicKind;
    @:native("UntypedString") static var untypedString: go.go.types.BasicKind;

    /**
        Typ contains the predeclared *Basic types indexed by their
        corresponding BasicKind.
        
        The *Basic type for Typ[Byte] will have the name "uint8".
        Use Universe.Lookup("byte").Type() to obtain the specific
        alias basic type named "byte" (and analogous for "rune").
    **/
    @:native("Typ") static var typ: go.Slice<go.Pointer<go.go.types.Basic>>;
    /**
        The Universe scope contains all predeclared objects of Go.
        It is the outermost scope of any chain of nested scopes.
    **/
    @:native("Universe") static var universe: go.Pointer<go.go.types.Scope>;
    /**
        The Unsafe package is the package returned by an importer
        for the import path "unsafe".
    **/
    @:native("Unsafe") static var unsafe: go.Pointer<go.go.types.Package>;

    /**
        AssertableTo reports whether a value of type V can be asserted to have type T.
        
        The behavior of AssertableTo is unspecified in three cases:
          - if T is Typ[Invalid]
          - if V is a generalized interface; i.e., an interface that may only be used
            as a type constraint in Go code
          - if T is an uninstantiated generic type
    **/
    @:native("AssertableTo") static function assertableTo(V: go.Pointer<go.go.types.Interface>, T: go.go.types.Type): (Bool);
    /**
        AssignableTo reports whether a value of type V is assignable to a variable
        of type T.
        
        The behavior of AssignableTo is unspecified if V or T is Typ[Invalid] or an
        uninstantiated generic type.
    **/
    @:native("AssignableTo") static function assignableTo(V: go.go.types.Type, T: go.go.types.Type): (Bool);
    /**
        CheckExpr type checks the expression expr as if it had appeared at position
        pos of package pkg. [Type] information about the expression is recorded in
        info. The expression may be an identifier denoting an uninstantiated generic
        function or type.
        
        If pkg == nil, the [Universe] scope is used and the provided
        position pos is ignored. If pkg != nil, and pos is invalid,
        the package scope is used. Otherwise, pos must belong to the
        package.
        
        An error is returned if pos is not within the package or
        if the node cannot be type-checked.
        
        Note: [Eval] and CheckExpr should not be used instead of running Check
        to compute types and values, but in addition to Check, as these
        functions ignore the context in which an expression is used (e.g., an
        assignment). Thus, top-level untyped constants will return an
        untyped type rather than the respective context-specific type.
    **/
    @:native("CheckExpr") static function checkExpr(fset: go.Pointer<go.go.token.FileSet>, pkg: go.Pointer<go.go.types.Package>, pos: go.go.token.Pos, expr: go.go.ast.Expr, info: go.Pointer<go.go.types.Info>): (go.Error);
    /**
        Comparable reports whether values of type T are comparable.
    **/
    @:native("Comparable") static function comparable(T: go.go.types.Type): (Bool);
    /**
        ConvertibleTo reports whether a value of type V is convertible to a value of
        type T.
        
        The behavior of ConvertibleTo is unspecified if V or T is Typ[Invalid] or an
        uninstantiated generic type.
    **/
    @:native("ConvertibleTo") static function convertibleTo(V: go.go.types.Type, T: go.go.types.Type): (Bool);
    /**
        DefPredeclaredTestFuncs defines the assert and trace built-ins.
        These built-ins are intended for debugging and testing of this
        package only.
    **/
    @:native("DefPredeclaredTestFuncs") static function defPredeclaredTestFuncs(): Void;
    /**
        Default returns the default "typed" type for an "untyped" type;
        it returns the incoming type for all other types. The default type
        for untyped nil is untyped nil.
    **/
    @:native("Default") static function _default(t: go.go.types.Type): (go.go.types.Type);
    /**
        Eval returns the type and, if constant, the value for the
        expression expr, evaluated at position pos of package pkg,
        which must have been derived from type-checking an AST with
        complete position information relative to the provided file
        set.
        
        The meaning of the parameters fset, pkg, and pos is the
        same as in [CheckExpr]. An error is returned if expr cannot
        be parsed successfully, or the resulting expr AST cannot be
        type-checked.
    **/
    @:native("Eval") static function eval(fset: go.Pointer<go.go.token.FileSet>, pkg: go.Pointer<go.go.types.Package>, pos: go.go.token.Pos, expr: std.String): (go.Result<go.go.types.TypeAndValue>);
    /**
        ExprString returns the (possibly shortened) string representation for x.
        Shortened representations are suitable for user interfaces but may not
        necessarily follow Go syntax.
    **/
    @:native("ExprString") static function exprString(x: go.go.ast.Expr): (std.String);
    /**
        Id returns name if it is exported, otherwise it
        returns the name qualified with the package path.
    **/
    @:native("Id") static function id(pkg: go.Pointer<go.go.types.Package>, name: std.String): (std.String);
    /**
        Identical reports whether x and y are identical types.
        Receivers of [Signature] types are ignored.
        
        Predicates such as [Identical], [Implements], and
        [Satisfies] assume that both operands belong to a
        consistent collection of symbols ([Object] values).
        For example, two [Named] types can be identical only if their
        [Named.Obj] methods return the same [TypeName] symbol.
        A collection of symbols is consistent if, for each logical
        package whose path is P, the creation of those symbols
        involved at most one call to [NewPackage](P, ...).
        To ensure consistency, use a single [Importer] for
        all loaded packages and their dependencies.
        For more information, see https://github.com/golang/go/issues/57497.
    **/
    @:native("Identical") static function identical(x: go.go.types.Type, y: go.go.types.Type): (Bool);
    /**
        IdenticalIgnoreTags reports whether x and y are identical types if tags are ignored.
        Receivers of [Signature] types are ignored.
    **/
    @:native("IdenticalIgnoreTags") static function identicalIgnoreTags(x: go.go.types.Type, y: go.go.types.Type): (Bool);
    /**
        Implements reports whether type V implements interface T.
        
        The behavior of Implements is unspecified if V is Typ[Invalid] or an uninstantiated
        generic type.
    **/
    @:native("Implements") static function _implements(V: go.go.types.Type, T: go.Pointer<go.go.types.Interface>): (Bool);
    /**
        Instantiate instantiates the type orig with the given type arguments targs.
        orig must be an *Alias, *Named, or *Signature type. If there is no error,
        the resulting Type is an instantiated type of the same kind (*Alias, *Named
        or *Signature, respectively).
        
        Methods attached to a *Named type are also instantiated, and associated with
        a new *Func that has the same position as the original method, but nil function
        scope.
        
        If ctxt is non-nil, it may be used to de-duplicate the instance against
        previous instances with the same identity. As a special case, generic
        *Signature origin types are only considered identical if they are pointer
        equivalent, so that instantiating distinct (but possibly identical)
        signatures will yield different instances. The use of a shared context does
        not guarantee that identical instances are deduplicated in all cases.
        
        If validate is set, Instantiate verifies that the number of type arguments
        and parameters match, and that the type arguments satisfy their respective
        type constraints. If verification fails, the resulting error may wrap an
        *ArgumentError indicating which type argument did not satisfy its type parameter
        constraint, and why.
        
        If validate is not set, Instantiate does not verify the type argument count
        or whether the type arguments satisfy their constraints. Instantiate is
        guaranteed to not return an error, but may panic. Specifically, for
        *Signature types, Instantiate will panic immediately if the type argument
        count is incorrect; for *Named types, a panic may occur later inside the
        *Named API.
    **/
    @:native("Instantiate") static function instantiate(ctxt: go.Pointer<go.go.types.Context>, orig: go.go.types.Type, targs: go.Slice<go.go.types.Type>, validate: Bool): (go.Result<go.go.types.Type>);
    /**
        IsInterface reports whether t is an interface type.
    **/
    @:native("IsInterface") static function isInterface(t: go.go.types.Type): (Bool);
    /**
        LookupFieldOrMethod looks up a field or method with given package and name
        in T and returns the corresponding *Var or *Func, an index sequence, and a
        bool indicating if there were any pointer indirections on the path to the
        field or method. If addressable is set, T is the type of an addressable
        variable (only matters for method lookups). T must not be nil.
        
        The last index entry is the field or method index in the (possibly embedded)
        type where the entry was found, either:
        
         1. the list of declared methods of a named type; or
         2. the list of all methods (method set) of an interface type; or
         3. the list of fields of a struct type.
        
        The earlier index entries are the indices of the embedded struct fields
        traversed to get to the found entry, starting at depth 0.
        
        If no entry is found, a nil object is returned. In this case, the returned
        index and indirect values have the following meaning:
        
          - If index != nil, the index sequence points to an ambiguous entry
            (the same name appeared more than once at the same embedding level).
        
          - If indirect is set, a method with a pointer receiver type was found
            but there was no pointer on the path from the actual receiver type to
            the method's formal receiver base type, nor was the receiver addressable.
        
        See also [LookupSelection], which returns the result as a [Selection].
    **/
    @:go.Tuple("obj", "index", "indirect") @:native("LookupFieldOrMethod") static function lookupFieldOrMethod(T: go.go.types.Type, addressable: Bool, pkg: go.Pointer<go.go.types.Package>, name: std.String): (go.Tuple<{ obj: go.go.types.Object, index: go.Slice<go.GoInt>, indirect: Bool }>);
    /**
        LookupSelection selects the field or method whose ID is Id(pkg,
        name), on a value of type T. If addressable is set, T is the type
        of an addressable variable (this matters only for method lookups).
        T must not be nil.
        
        If the selection is valid:
        
          - [Selection.Obj] returns the field ([Var]) or method ([Func]);
          - [Selection.Indirect] reports whether there were any pointer
            indirections on the path to the field or method.
          - [Selection.Index] returns the index sequence, defined below.
        
        The last index entry is the field or method index in the (possibly
        embedded) type where the entry was found, either:
        
         1. the list of declared methods of a named type; or
         2. the list of all methods (method set) of an interface type; or
         3. the list of fields of a struct type.
        
        The earlier index entries are the indices of the embedded struct
        fields traversed to get to the found entry, starting at depth 0.
        
        See also [LookupFieldOrMethod], which returns the components separately.
    **/
    @:go.Tuple("p0", "p1") @:native("LookupSelection") static function lookupSelection(T: go.go.types.Type, addressable: Bool, pkg: go.Pointer<go.go.types.Package>, name: std.String): (go.Tuple<{ p0: go.go.types.Selection, p1: Bool }>);
    /**
        MissingMethod returns (nil, false) if V implements T, otherwise it
        returns a missing method required by T and whether it is missing or
        just has the wrong type: either a pointer receiver or wrong signature.
        
        For non-interface types V, or if static is set, V implements T if all
        methods of T are present in V. Otherwise (V is an interface and static
        is not set), MissingMethod only checks that methods of T which are also
        present in V have matching types (e.g., for a type assertion x.(T) where
        x is of interface type V).
    **/
    @:go.Tuple("method", "wrongType") @:native("MissingMethod") static function missingMethod(V: go.go.types.Type, T: go.Pointer<go.go.types.Interface>, _static: Bool): (go.Tuple<{ method: go.Pointer<go.go.types.Func>, wrongType: Bool }>);
    /**
        NewAlias creates a new Alias type with the given type name and rhs.
        If rhs is nil, the alias is incomplete.
    **/
    @:native("NewAlias") static function newAlias(obj: go.Pointer<go.go.types.TypeName>, rhs: go.go.types.Type): (go.Pointer<go.go.types.Alias>);
    /**
        NewArray returns a new array type for the given element type and length.
        A negative length indicates an unknown length.
    **/
    @:native("NewArray") static function newArray(elem: go.go.types.Type, len: go.Int64): (go.Pointer<go.go.types.Array>);
    /**
        NewChan returns a new channel type for the given direction and element type.
    **/
    @:native("NewChan") static function newChan(dir: go.go.types.ChanDir, elem: go.go.types.Type): (go.Pointer<go.go.types.Chan>);
    /**
        NewChecker returns a new [Checker] instance for a given package.
        [Package] files may be added incrementally via checker.Files.
    **/
    @:native("NewChecker") static function newChecker(conf: go.Pointer<go.go.types.Config>, fset: go.Pointer<go.go.token.FileSet>, pkg: go.Pointer<go.go.types.Package>, info: go.Pointer<go.go.types.Info>): (go.Pointer<go.go.types.Checker>);
    /**
        NewConst returns a new constant with value val.
        The remaining arguments set the attributes found with all Objects.
    **/
    @:native("NewConst") static function newConst(pos: go.go.token.Pos, pkg: go.Pointer<go.go.types.Package>, name: std.String, typ: go.go.types.Type, val: go.go.constant.Value): (go.Pointer<go.go.types.Const>);
    /**
        NewContext creates a new Context.
    **/
    @:native("NewContext") static function newContext(): (go.Pointer<go.go.types.Context>);
    /**
        NewField returns a new variable representing a struct field.
        For embedded fields, the name is the unqualified type name
        under which the field is accessible.
    **/
    @:native("NewField") static function newField(pos: go.go.token.Pos, pkg: go.Pointer<go.go.types.Package>, name: std.String, typ: go.go.types.Type, embedded: Bool): (go.Pointer<go.go.types.Var>);
    /**
        NewFunc returns a new function with the given signature, representing
        the function's type.
    **/
    @:native("NewFunc") static function newFunc(pos: go.go.token.Pos, pkg: go.Pointer<go.go.types.Package>, name: std.String, sig: go.Pointer<go.go.types.Signature>): (go.Pointer<go.go.types.Func>);
    /**
        NewInterface returns a new interface for the given methods and embedded types.
        NewInterface takes ownership of the provided methods and may modify their types
        by setting missing receivers.
        
        Deprecated: Use NewInterfaceType instead which allows arbitrary embedded types.
    **/
    @:native("NewInterface") static function newInterface(methods: go.Slice<go.Pointer<go.go.types.Func>>, embeddeds: go.Slice<go.Pointer<go.go.types.Named>>): (go.Pointer<go.go.types.Interface>);
    /**
        NewInterfaceType returns a new interface for the given methods and embedded
        types. NewInterfaceType takes ownership of the provided methods and may
        modify their types by setting missing receivers.
        
        To avoid race conditions, the interface's type set should be computed before
        concurrent use of the interface, by explicitly calling Complete.
    **/
    @:native("NewInterfaceType") static function newInterfaceType(methods: go.Slice<go.Pointer<go.go.types.Func>>, embeddeds: go.Slice<go.go.types.Type>): (go.Pointer<go.go.types.Interface>);
    /**
        NewLabel returns a new label.
    **/
    @:native("NewLabel") static function newLabel(pos: go.go.token.Pos, pkg: go.Pointer<go.go.types.Package>, name: std.String): (go.Pointer<go.go.types.Label>);
    /**
        NewMap returns a new map for the given key and element types.
    **/
    @:native("NewMap") static function newMap(key: go.go.types.Type, elem: go.go.types.Type): (go.Pointer<go.go.types.Map>);
    /**
        NewMethodSet returns the method set for the given type T.
        It always returns a non-nil method set, even if it is empty.
    **/
    @:native("NewMethodSet") static function newMethodSet(T: go.go.types.Type): (go.Pointer<go.go.types.MethodSet>);
    /**
        NewNamed returns a new named type for the given type name, underlying type, and associated methods.
        If the given type name obj doesn't have a type yet, its type is set to the returned named type.
        The underlying type must not be a *Named.
    **/
    @:native("NewNamed") static function newNamed(obj: go.Pointer<go.go.types.TypeName>, underlying: go.go.types.Type, methods: go.Slice<go.Pointer<go.go.types.Func>>): (go.Pointer<go.go.types.Named>);
    /**
        NewPackage returns a new Package for the given package path and name.
        The package is not complete and contains no explicit imports.
    **/
    @:native("NewPackage") static function newPackage(path: std.String, name: std.String): (go.Pointer<go.go.types.Package>);
    /**
        NewParam returns a new variable representing a function parameter.
        
        The caller must subsequently call [Var.SetKind] if the desired Var
        is not of kind [ParamVar]: for example, [RecvVar] or [ResultVar].
    **/
    @:native("NewParam") static function newParam(pos: go.go.token.Pos, pkg: go.Pointer<go.go.types.Package>, name: std.String, typ: go.go.types.Type): (go.Pointer<go.go.types.Var>);
    /**
        NewPkgName returns a new PkgName object representing an imported package.
        The remaining arguments set the attributes found with all Objects.
    **/
    @:native("NewPkgName") static function newPkgName(pos: go.go.token.Pos, pkg: go.Pointer<go.go.types.Package>, name: std.String, imported: go.Pointer<go.go.types.Package>): (go.Pointer<go.go.types.PkgName>);
    /**
        NewPointer returns a new pointer type for the given element (base) type.
    **/
    @:native("NewPointer") static function newPointer(elem: go.go.types.Type): (go.Pointer<go.go.types.Pointer>);
    /**
        NewScope returns a new, empty scope contained in the given parent
        scope, if any. The comment is for debugging only.
    **/
    @:native("NewScope") static function newScope(parent: go.Pointer<go.go.types.Scope>, pos: go.go.token.Pos, end: go.go.token.Pos, comment: std.String): (go.Pointer<go.go.types.Scope>);
    /**
        NewSignature returns a new function type for the given receiver, parameters,
        and results, either of which may be nil. If variadic is set, the function
        is variadic, it must have at least one parameter, and the last parameter
        must be of unnamed slice type.
        
        Deprecated: Use [NewSignatureType] instead which allows for type parameters.
    **/
    @:native("NewSignature") static function newSignature(recv: go.Pointer<go.go.types.Var>, params: go.Pointer<go.go.types.Tuple>, results: go.Pointer<go.go.types.Tuple>, variadic: Bool): (go.Pointer<go.go.types.Signature>);
    /**
        NewSignatureType creates a new function type for the given receiver,
        receiver type parameters, type parameters, parameters, and results.
        
        If variadic is set, params must hold at least one parameter and the
        last parameter must be an unnamed slice or a type parameter whose
        type set has an unnamed slice as common underlying type.
        
        As a special case, to support append([]byte, str...), for variadic
        signatures the last parameter may also be a string type, or a type
        parameter containing a mix of byte slices and string types in its
        type set. It may even be a named []byte slice type resulting from
        instantiation of such a type parameter.
        
        If recv is non-nil, typeParams must be empty. If recvTypeParams is
        non-empty, recv must be non-nil.
    **/
    @:native("NewSignatureType") static function newSignatureType(recv: go.Pointer<go.go.types.Var>, recvTypeParams: go.Slice<go.Pointer<go.go.types.TypeParam>>, typeParams: go.Slice<go.Pointer<go.go.types.TypeParam>>, params: go.Pointer<go.go.types.Tuple>, results: go.Pointer<go.go.types.Tuple>, variadic: Bool): (go.Pointer<go.go.types.Signature>);
    /**
        NewSlice returns a new slice type for the given element type.
    **/
    @:native("NewSlice") static function newSlice(elem: go.go.types.Type): (go.Pointer<go.go.types.Slice>);
    /**
        NewStruct returns a new struct with the given fields and corresponding field tags.
        If a field with index i has a tag, tags[i] must be that tag, but len(tags) may be
        only as long as required to hold the tag with the largest index i. Consequently,
        if no field has a tag, tags may be nil.
    **/
    @:native("NewStruct") static function newStruct(fields: go.Slice<go.Pointer<go.go.types.Var>>, tags: go.Slice<std.String>): (go.Pointer<go.go.types.Struct>);
    /**
        NewTerm returns a new union term.
    **/
    @:native("NewTerm") static function newTerm(tilde: Bool, typ: go.go.types.Type): (go.Pointer<go.go.types.Term>);
    /**
        NewTuple returns a new tuple for the given variables.
    **/
    @:native("NewTuple") static function newTuple(x: haxe.Rest<go.Pointer<go.go.types.Var>>): (go.Pointer<go.go.types.Tuple>);
    /**
        NewTypeName returns a new type name denoting the given typ.
        The remaining arguments set the attributes found with all Objects.
        
        The typ argument may be a defined (Named) type or an alias type.
        It may also be nil such that the returned TypeName can be used as
        argument for NewNamed, which will set the TypeName's type as a side-
        effect.
    **/
    @:native("NewTypeName") static function newTypeName(pos: go.go.token.Pos, pkg: go.Pointer<go.go.types.Package>, name: std.String, typ: go.go.types.Type): (go.Pointer<go.go.types.TypeName>);
    /**
        NewTypeParam returns a new TypeParam. Type parameters may be set on a Named
        type by calling SetTypeParams. Setting a type parameter on more than one type
        will result in a panic.
        
        The constraint argument can be nil, and set later via SetConstraint. If the
        constraint is non-nil, it must be fully defined.
    **/
    @:native("NewTypeParam") static function newTypeParam(obj: go.Pointer<go.go.types.TypeName>, constraint: go.go.types.Type): (go.Pointer<go.go.types.TypeParam>);
    /**
        NewUnion returns a new [Union] type with the given terms.
        It is an error to create an empty union; they are syntactically not possible.
    **/
    @:native("NewUnion") static function newUnion(terms: go.Slice<go.Pointer<go.go.types.Term>>): (go.Pointer<go.go.types.Union>);
    /**
        NewVar returns a new variable.
        The arguments set the attributes found with all Objects.
        
        The caller must subsequently call [Var.SetKind]
        if the desired Var is not of kind [PackageVar].
    **/
    @:native("NewVar") static function newVar(pos: go.go.token.Pos, pkg: go.Pointer<go.go.types.Package>, name: std.String, typ: go.go.types.Type): (go.Pointer<go.go.types.Var>);
    /**
        ObjectString returns the string form of obj.
        The Qualifier controls the printing of
        package-level objects, and may be nil.
    **/
    @:native("ObjectString") static function objectString(obj: go.go.types.Object, qf: go.go.types.Qualifier): (std.String);
    /**
        RelativeTo returns a [Qualifier] that fully qualifies members of
        all packages other than pkg.
    **/
    @:native("RelativeTo") static function relativeTo(pkg: go.Pointer<go.go.types.Package>): (go.go.types.Qualifier);
    /**
        Satisfies reports whether type V satisfies the constraint T.
        
        The behavior of Satisfies is unspecified if V is Typ[Invalid] or an uninstantiated
        generic type.
    **/
    @:native("Satisfies") static function satisfies(V: go.go.types.Type, T: go.Pointer<go.go.types.Interface>): (Bool);
    /**
        SelectionString returns the string form of s.
        The Qualifier controls the printing of
        package-level objects, and may be nil.
        
        Examples:
        
        	"field (T) f int"
        	"method (T) f(X) Y"
        	"method expr (T) f(X) Y"
    **/
    @:native("SelectionString") static function selectionString(s: go.Pointer<go.go.types.Selection>, qf: go.go.types.Qualifier): (std.String);
    /**
        SizesFor returns the Sizes used by a compiler for an architecture.
        The result is nil if a compiler/architecture pair is not known.
        
        Supported architectures for compiler "gc":
        "386", "amd64", "amd64p32", "arm", "arm64", "loong64", "mips", "mipsle",
        "mips64", "mips64le", "ppc64", "ppc64le", "riscv64", "s390x", "sparc64", "wasm".
    **/
    @:native("SizesFor") static function sizesFor(compiler: std.String, arch: std.String): (go.go.types.Sizes);
    /**
        TypeString returns the string representation of typ.
        The [Qualifier] controls the printing of
        package-level objects, and may be nil.
    **/
    @:native("TypeString") static function typeString(typ: go.go.types.Type, qf: go.go.types.Qualifier): (std.String);
    /**
        Unalias returns t if it is not an alias type;
        otherwise it follows t's alias chain until it
        reaches a non-alias type which is then returned.
        Consequently, the result is never an alias type.
        Returns nil if the alias is incomplete.
    **/
    @:native("Unalias") static function unalias(t: go.go.types.Type): (go.go.types.Type);
    /**
        WriteExpr writes the (possibly shortened) string representation for x to buf.
        Shortened representations are suitable for user interfaces but may not
        necessarily follow Go syntax.
    **/
    @:native("WriteExpr") static function writeExpr(buf: go.Pointer<go.bytes.Buffer>, x: go.go.ast.Expr): Void;
    /**
        WriteSignature writes the representation of the signature sig to buf,
        without a leading "func" keyword. The [Qualifier] controls the printing
        of package-level objects, and may be nil.
    **/
    @:native("WriteSignature") static function writeSignature(buf: go.Pointer<go.bytes.Buffer>, sig: go.Pointer<go.go.types.Signature>, qf: go.go.types.Qualifier): Void;
    /**
        WriteType writes the string representation of typ to buf.
        The [Qualifier] controls the printing of
        package-level objects, and may be nil.
    **/
    @:native("WriteType") static function writeType(buf: go.Pointer<go.bytes.Buffer>, typ: go.go.types.Type, qf: go.go.types.Qualifier): Void;

}