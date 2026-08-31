package go.container.list;

/**
    Element is an element of a linked list.
**/
@:structInit
@:go.Type({ name: "Element", instanceName: "list.Element", imports: ["container/list"] })
extern class Element {

    @:native("Value") var value: Dynamic;

    function new(value: Dynamic=null);

    /**
        Next returns the next list element or nil.
    **/
    @:native("Next") function next(): (go.Pointer<go.container.list.Element>);
    /**
        Prev returns the previous list element or nil.
    **/
    @:native("Prev") function prev(): (go.Pointer<go.container.list.Element>);

}