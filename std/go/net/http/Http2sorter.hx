package go.net.http;

@:structInit
@:go.Type({ name: "http2sorter", instanceName: "http.http2sorter", imports: ["net/http"] })
extern class Http2sorter {

    @:native("Keys") function keys(h: go.net.http.Header): (go.Slice<String>);
    @:native("Len") function len(): (go.GoInt);
    @:native("Less") function less(i: go.GoInt, j: go.GoInt): (Bool);
    @:native("SortStrings") function sortStrings(ss: go.Slice<String>): Void;
    @:native("Swap") function swap(i: go.GoInt, j: go.GoInt): Void;

}