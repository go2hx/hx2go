package go.go.types;

/**
    SelectionKind describes the kind of a selector expression x.f
    (excluding qualified identifiers).
    
    If x is a struct or *struct, a selector expression x.f may denote a
    sequence of selection operations x.a.b.c.f. The SelectionKind
    describes the kind of the final (explicit) operation; all the
    previous (implicit) operations are always field selections.
    Each element of Indices specifies an implicit field (a, b, c)
    by its index in the struct type of the field selection operand.
    
    For a FieldVal operation, the final selection refers to the field
    specified by Selection.Obj.
    
    For a MethodVal operation, the final selection refers to a method.
    If the "pointerness" of the method's declared receiver does not
    match that of the effective receiver after implicit field
    selection, then an & or * operation is implicitly applied to the
    receiver variable or value.
    So, x.f denotes (&x.a.b.c).f when f requires a pointer receiver but
    x.a.b.c is a non-pointer variable; and it denotes (*x.a.b.c).f when
    f requires a non-pointer receiver but x.a.b.c is a pointer value.
    
    All pointer indirections, whether due to implicit or explicit field
    selections or * operations inserted for "pointerness", panic if
    applied to a nil pointer, so a method call x.f() may panic even
    before the function call.
    
    By contrast, a MethodExpr operation T.f is essentially equivalent
    to a function literal of the form:
    
    	func(x T, args) (results) { return x.f(args) }
    
    Consequently, any implicit field selections and * operations
    inserted for "pointerness" are not evaluated until the function is
    called, so a T.f or (*T).f expression never panics.
**/
@:go.Type({ name: "SelectionKind", instanceName: "types.SelectionKind", imports: ["go/types"] })
extern typedef SelectionKind = go.GoInt