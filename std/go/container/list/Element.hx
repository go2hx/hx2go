package go.container.list;

@:structInit
@:go.Type({ name: "Element", instanceName: "list.Element", imports: ["container/list"] })
extern class Element {

    @:native("Value") var value: Dynamic;

function new(value: Dynamic);

    @:native("Next") function next(): go.Pointer<go.container.list.Element>;
    @:native("Prev") function prev(): go.Pointer<go.container.list.Element>;

}