import haxe.Serializer;

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
    var v = { a: 0, b: true, c: "hello", d: {
        a: [1, 2, 3],
        m: ["john" => 20, "alice" => 23],
        c: [new Car("Ferrari", 700), new Car("Lamborghini", 800)]
    }}

    var str = Serializer.run(v);
}