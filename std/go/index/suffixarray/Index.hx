package go.index.suffixarray;

@:structInit
@:go.Type({ name: "Index", instanceName: "suffixarray.Index", imports: ["index/suffixarray"] })
extern class Index {

    @:native("Bytes") function bytes(): go.Slice<go.Byte>;
    @:native("FindAllIndex") function findAllIndex(r: go.Pointer<go.regexp.Regexp>, n: go.GoInt): go.Slice<go.Slice<go.GoInt>>;
    @:native("Lookup") function lookup(s: go.Slice<go.Byte>, n: go.GoInt): go.Slice<go.GoInt>;
    @:native("Read") function read(r: go.io.Reader): go.Error;
    @:native("Write") function write(w: go.io.Writer): go.Error;

}