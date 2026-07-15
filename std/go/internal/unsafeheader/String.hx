package go.internal.unsafeheader;

@:structInit
@:go.Type({ name: "String", instanceName: "unsafeheader.String", imports: ["internal/unsafeheader"] })
extern class String {

    @:native("Data") var data: go.unsafe.Pointer;
    @:native("Len") var len: go.GoInt;

function new(data: go.unsafe.Pointer, len: go.GoInt);

}