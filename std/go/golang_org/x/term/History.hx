package go.golang_org.x.term;

@:go.Type({ name: "History", instanceName: "term.History", imports: ["golang.org/x/term"] })
extern typedef History = {

    @:native("Add") function add(entry: String): Void;
    @:native("At") function at(idx: go.GoInt): (String);
    @:native("Len") function len(): (go.GoInt);

}