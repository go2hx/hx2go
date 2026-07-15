package go.container;

@:go.Type({ name: "list", instanceName: "list.list", imports: ["container/list"] })
extern class List {

    @:native("New") static function _new(): go.Pointer<go.container.list.List>;

}