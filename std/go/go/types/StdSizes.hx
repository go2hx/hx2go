package go.go.types;

/**
    StdSizes is a convenience type for creating commonly used Sizes.
    It makes the following simplifying assumptions:
    
      - The size of explicitly sized basic types (int16, etc.) is the
        specified size.
      - The size of strings and interfaces is 2*WordSize.
      - The size of slices is 3*WordSize.
      - The size of an array of n elements corresponds to the size of
        a struct of n consecutive fields of the array's element type.
      - The size of a struct is the offset of the last field plus that
        field's size. As with all element types, if the struct is used
        in an array its size must first be aligned to a multiple of the
        struct's alignment.
      - All other types have size WordSize.
      - Arrays and structs are aligned per spec definition; all other
        types are naturally aligned with a maximum alignment MaxAlign.
    
    *StdSizes implements Sizes.
**/
@:structInit
@:go.Type({ name: "StdSizes", instanceName: "types.StdSizes", imports: ["go/types"] })
extern class StdSizes {

    @:native("WordSize") var wordSize: go.Int64;
    @:native("MaxAlign") var maxAlign: go.Int64;

    function new(wordSize: go.Int64=0, maxAlign: go.Int64=0);

    @:native("Alignof") function alignof(T: go.go.types.Type): (go.Int64);
    @:native("Offsetsof") function offsetsof(fields: go.Slice<go.Pointer<go.go.types.Var>>): (go.Slice<go.Int64>);
    @:native("Sizeof") function sizeof(T: go.go.types.Type): (go.Int64);

}