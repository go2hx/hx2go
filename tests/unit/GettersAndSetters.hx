package unit;


private class Vehicle {
    public var model: String;
    public var hp: Null<Int>;
    public var kw(get, never): Null<Float>;

    public function new(model: String, ?hp: Int) {
        this.model = model;
        this.hp = hp;
    }

    public function get_kw(): Null<Float> {
        return hp != null ? hp * 0.745 : null;
    }
}

function main() {
    var vehicle = new Vehicle('A Rock', 0);
    assert(vehicle.kw == 0.0);

    var vehicle2 = new Vehicle('Fast Car', 1000);
    assert(vehicle2.kw == 745.0);
}
