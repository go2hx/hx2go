package go.reflect;

/**
    SliceHeader is the runtime representation of a slice.
    It cannot be used safely or portably and its representation may
    change in a later release.
    Moreover, the Data field is not sufficient to guarantee the data
    it references will not be garbage collected, so programs must keep
    a separate, correctly typed pointer to the underlying data.
    
    Deprecated: Use unsafe.Slice or unsafe.SliceData instead.
**/
@:structInit
@:go.Type({ name: "SliceHeader", instanceName: "reflect.SliceHeader", imports: ["reflect"] })
extern class SliceHeader {

    @:native("Data") var data: go.UIntPtr;
    @:native("Len") var len: go.GoInt;
    @:native("Cap") var cap: go.GoInt;

    function new(data: go.UIntPtr=0, len: go.GoInt=0, cap: go.GoInt=0);

}