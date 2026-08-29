package go.reflect;

/**
    StringHeader is the runtime representation of a string.
    It cannot be used safely or portably and its representation may
    change in a later release.
    Moreover, the Data field is not sufficient to guarantee the data
    it references will not be garbage collected, so programs must keep
    a separate, correctly typed pointer to the underlying data.
    
    Deprecated: Use unsafe.String or unsafe.StringData instead.
**/
@:structInit
@:go.Type({ name: "StringHeader", instanceName: "reflect.StringHeader", imports: ["reflect"] })
extern class StringHeader {

    @:native("Data") var data: go.UIntPtr;
    @:native("Len") var len: go.GoInt;

    function new(data: go.UIntPtr=0, len: go.GoInt=0);

}