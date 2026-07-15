package go.container.ring;

@:structInit
@:go.Type({ name: "Ring", instanceName: "ring.Ring", imports: ["container/ring"] })
extern class Ring {

    @:native("Value") var value: Dynamic;

function new(value: Dynamic);

    @:native("Do") function _do(f: (p0: Dynamic) -> Void): Void;
    @:native("Len") function len(): go.GoInt;
    @:native("Link") function link(s: go.Pointer<go.container.ring.Ring>): go.Pointer<go.container.ring.Ring>;
    @:native("Move") function move(n: go.GoInt): go.Pointer<go.container.ring.Ring>;
    @:native("Next") function next(): go.Pointer<go.container.ring.Ring>;
    @:native("Prev") function prev(): go.Pointer<go.container.ring.Ring>;
    @:native("Unlink") function unlink(n: go.GoInt): go.Pointer<go.container.ring.Ring>;

}