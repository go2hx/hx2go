package go.go.types;

/**
    Sizes defines the sizing functions for package unsafe.
**/
@:go.Type({ name: "Sizes", instanceName: "types.Sizes", imports: ["go/types"] })
extern typedef Sizes = {

    @:native("Alignof") function alignof(T: go.go.types.Type): (go.Int64);
    @:native("Offsetsof") function offsetsof(fields: go.Slice<go.Pointer<go.go.types.Var>>): (go.Slice<go.Int64>);
    @:native("Sizeof") function sizeof(T: go.go.types.Type): (go.Int64);

}