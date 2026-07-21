package go.container;

@:go.Type({ name: "heap", instanceName: "heap.heap", imports: ["container/heap"] })
extern class Heap {

    @:native("Fix") static function fix(h: go.container.heap.Interface, i: go.GoInt): Void;
    @:native("Init") static function init(h: go.container.heap.Interface): Void;
    @:native("Pop") static function pop(h: go.container.heap.Interface): (Dynamic);
    @:native("Push") static function push(h: go.container.heap.Interface, x: Dynamic): Void;
    @:native("Remove") static function remove(h: go.container.heap.Interface, i: go.GoInt): (Dynamic);

}