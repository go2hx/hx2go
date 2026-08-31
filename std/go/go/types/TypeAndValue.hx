package go.go.types;

/**
    TypeAndValue reports the type and value (for constants)
    of the corresponding expression.
**/
@:structInit
@:go.Type({ name: "TypeAndValue", instanceName: "types.TypeAndValue", imports: ["go/types"] })
extern class TypeAndValue {

    @:native("Type") var type: go.go.types.Type;
    @:native("Value") var value: go.go.constant.Value;

    function new(type: go.go.types.Type=null, value: go.go.constant.Value=null);

    /**
        Addressable reports whether the corresponding expression
        is addressable (https://golang.org/ref/spec#Address_operators).
    **/
    @:native("Addressable") function addressable(): (Bool);
    /**
        Assignable reports whether the corresponding expression
        is assignable to (provided a value of the right type).
    **/
    @:native("Assignable") function assignable(): (Bool);
    /**
        HasOk reports whether the corresponding expression may be
        used on the rhs of a comma-ok assignment.
    **/
    @:native("HasOk") function hasOk(): (Bool);
    /**
        IsBuiltin reports whether the corresponding expression denotes
        a (possibly parenthesized) built-in function.
    **/
    @:native("IsBuiltin") function isBuiltin(): (Bool);
    /**
        IsNil reports whether the corresponding expression denotes the
        predeclared value nil.
    **/
    @:native("IsNil") function isNil(): (Bool);
    /**
        IsType reports whether the corresponding expression specifies a type.
    **/
    @:native("IsType") function isType(): (Bool);
    /**
        IsValue reports whether the corresponding expression is a value.
        Builtins are not considered values. Constant values have a non-
        nil Value.
    **/
    @:native("IsValue") function isValue(): (Bool);
    /**
        IsVoid reports whether the corresponding expression
        is a function call without results.
    **/
    @:native("IsVoid") function isVoid(): (Bool);

}