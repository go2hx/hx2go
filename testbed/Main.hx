class Vehicle {

    public var model: String;
    public var hp: Null<Int>;

    public function new(model: String, ?hp: Int) {
        this.model = model;
        this.hp = hp;
    }

    public function honk() {
        trace('$model makes an unknown sound! what could it be?!');
    }

}

class Car extends Vehicle {

    public var fuel: Int;

    public function new(model: String, ?hp: Int, ?fuel: Int) {
        super(model, hp);
        this.fuel = fuel;
    }

    override public function honk() {
        trace('$model does *honk*');
    }

    public function drive() {
        trace('$model is driving with $hp HP and $fuel L of fuel');
    }

}

class Truck extends Car {

    override public function drive() {
        trace('$model is driving, but it sure takes a while...');
    }

}

class Bicycle extends Vehicle {

    override public function honk() {
        trace('$model does *ring*');
        trace('trying super');
        super.honk();
    }

}

class Main {

    public static function main() {
        var vehicle = new Vehicle('A Rock', 0);
        var car = new Car('Mitsubishi EVO', 1000, 30);
        var truck = new Truck('Volvo FH16', 500, 150);
        var bicycle = new Bicycle('Rusted unnamed bike', 1);
        truck.drive();
        truck.honk();
    }

}