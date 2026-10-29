package unit;

class Vector2 {

    public var x: Float;
    public var y: Float;

    public function new(x: Float = 0, y: Float = 0) {
        this.x = x;
        this.y = y;
    }

}

function main() {
    var a: go.Value<Vector2> = new Vector2(5, 10);
    a.x = 15;

    var b: go.Value<Vector2> = a; // copy-semantics
    b.y = 20;

    var c: Vector2 = a; // also copied, but now a ref.
    c.x = 25;

    var d: Vector2 = c; // not copied
    c.y = 35;

    var int: go.Value<Int> = 3;              // int32
    var intNorm: Int = int;                  // int32
    var intPtr: go.Pointer<Int> = int.ptr(); // *int32

    assert(int == 3 && intNorm == 3 && intPtr.value == 3);
    assert(a.x == 15 && a.y == 10);
    assert(b.x == 15 && b.y == 20);
    assert(c.x == 25 && c.y == 35);
    assert(d.x == 25 && d.y == 35);
}