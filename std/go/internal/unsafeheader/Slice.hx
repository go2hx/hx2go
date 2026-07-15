package go.internal.unsafeheader;

@:structInit
@:go.Type({ name: "Slice", instanceName: "unsafeheader.Slice", imports: ["internal/unsafeheader"] })
extern class Slice {

    @:native("Data") var data: go.unsafe.Pointer;
    @:native("Len") var len: go.GoInt;
    @:native("Cap") var cap: go.GoInt;

function new(data: go.unsafe.Pointer, len: go.GoInt, cap: go.GoInt);

}