import haxe.Serializer;
import haxe.Unserializer;

class Car {

    public var model: String;
    public var hp: Int;

    public function new(model: String, hp: Int) {
        this.model = model;
        this.hp = hp;
    }

    public function vroom(): String {
        return "Vroom! The " + model + " with " + hp + " HP is going fast!";
    }

}

function main() {
    var v = {
        a: 0,
        b: true,
        c: "hello",
        d: {
            a: [
                1,
                2,
                3
            ],
            m: [
                "john" => 20,
                "alice" => 23
            ],
            c: [
                new Car("Ferrari", 700),
                new Car("Lamborghini", 800)
            ]
        }
    }

    var str = Serializer.run(v);
    var u = Unserializer.run(str);

    trace(v);
    trace(u);
    trace(str);
    trace(Reflect.compare(v, u));
}

//interface Foo {}
//
//class Bar implements Foo {
//    public function new() {}
//}
//
//function main() {
//    var x: Bar = new Bar();
//    var y: Foo = x;
//    var z: Dynamic = y;
//    var w: Bar = z;
//    var q: Bar = cast y;
//
//    trace(x, y, z, w, q);
//}