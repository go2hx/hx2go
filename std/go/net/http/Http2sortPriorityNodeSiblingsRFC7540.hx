package go.net.http;

@:go.Type({ name: "http2sortPriorityNodeSiblingsRFC7540", instanceName: "http.http2sortPriorityNodeSiblingsRFC7540", imports: ["net/http"] })
extern class Http2sortPriorityNodeSiblingsRFC7540 {

    @:native("Len") function len(): (go.GoInt);
    @:native("Less") function less(i: go.GoInt, k: go.GoInt): (Bool);
    @:native("Swap") function swap(i: go.GoInt, k: go.GoInt): Void;

}