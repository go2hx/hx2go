package unit;

function main() {
    var c = new Cursor([10, 20, 30]);
    assert(c.next() == 10);
    assert(c.next() == 20);
    assert(c.next() == 30);
}

class Cursor {
    var data: Dynamic;
    var idx: Int = 0;

    public function new(d: Dynamic) {
        this.data = d;
    }

    public function next(): Int {
        return data[idx++];
    }
}
