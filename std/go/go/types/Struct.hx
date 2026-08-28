package go.go.types;

/**
    A Struct represents a struct type.
**/
@:structInit
@:go.Type({ name: "Struct", instanceName: "types.Struct", imports: ["go/types"] })
extern class Struct {

    /**
        Field returns the i'th field for 0 <= i < NumFields().
    **/
    @:native("Field") function field(i: go.GoInt): (go.Pointer<go.go.types.Var>);
    /**
        Fields returns a go1.23 iterator over the fields of a struct type.
        
        Example: for field := range s.Fields() { ... }
    **/
    @:native("Fields") function fields(): (go.iter.Seq<go.Pointer<go.go.types.Var>>);
    /**
        NumFields returns the number of fields in the struct (including blank and embedded fields).
    **/
    @:native("NumFields") function numFields(): (go.GoInt);
    @:native("String") function string(): (std.String);
    /**
        Tag returns the i'th field tag for 0 <= i < NumFields().
    **/
    @:native("Tag") function tag(i: go.GoInt): (std.String);
    @:native("Underlying") function underlying(): (go.go.types.Type);

}