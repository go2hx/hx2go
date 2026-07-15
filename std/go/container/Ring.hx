package go.container;

@:go.Type({ name: "ring", instanceName: "ring.ring", imports: ["container/ring"] })
extern class Ring {

    @:native("New") static function _new(n: go.GoInt): go.Pointer<go.container.ring.Ring>;

}