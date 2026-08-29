package go.go.ast;

/**
    An Object describes a named language entity such as a package,
    constant, type, variable, function (incl. methods), or label.
    
    The Data fields contains object-specific data:
    
    	Kind    Data type         Data value
    	Pkg     *Scope            package scope
    	Con     int               iota for the respective declaration
    
    Deprecated: The relationship between Idents and Objects cannot be
    correctly computed without type information. For example, the
    expression T{K: 0} may denote a struct, map, slice, or array
    literal, depending on the type of T. If T is a struct, then K
    refers to a field of T, whereas for the other types it refers to a
    value in the environment.
    
    New programs should set the [parser.SkipObjectResolution] parser
    flag to disable syntactic object resolution (which also saves CPU
    and memory), and instead use the type checker [go/types] if object
    resolution is desired. See the Defs, Uses, and Implicits fields of
    the [types.Info] struct for details.
**/
@:structInit
@:go.Type({ name: "Object", instanceName: "ast.Object", imports: ["go/ast"] })
extern class Object {

    @:native("Kind") var kind: go.go.ast.ObjKind;
    @:native("Name") var name: String;
    @:native("Decl") var decl: Dynamic;
    @:native("Data") var data: Dynamic;
    @:native("Type") var type: Dynamic;

    function new(kind: go.go.ast.ObjKind=cast 0, name: String="", decl: Dynamic=null, data: Dynamic=null, type: Dynamic=null);

    /**
        Pos computes the source position of the declaration of an object name.
        The result may be an invalid position if it cannot be computed
        (obj.Decl may be nil or not correct).
    **/
    @:native("Pos") function pos(): (go.go.token.Pos);

}