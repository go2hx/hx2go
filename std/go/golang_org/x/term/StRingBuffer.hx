package go.golang_org.x.term;

@:structInit
@:go.Type({ name: "stRingBuffer", instanceName: "term.stRingBuffer", imports: ["golang.org/x/term"] })
extern class StRingBuffer {

    @:native("Add") function add(a: String): Void;
    @:native("At") function at(n: go.GoInt): (String);
    @:native("Len") function len(): (go.GoInt);

}