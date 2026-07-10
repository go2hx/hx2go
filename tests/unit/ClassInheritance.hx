package unit;


private class Vehicle {
    public var model: String;
    public var hp: Null<Int>;

    public function new(model: String, ?hp: Int) {
        this.model = model;
        this.hp = hp;
    }

    public function getModel(): String {
        return model;
    }

    public function honk():String {
        return "";
    }

    public function getHp(): Null<Int> {
        return hp;
    }
}

class Car extends Vehicle {
    public var fuel: Int;

    public function new(model: String, ?hp: Int, ?fuel: Int) {
        super(model, hp);
        this.fuel = fuel;
    }

    public function drive(): String {
        return '$model is driving with $hp HP and $fuel L of fuel';
    }
}

class Truck extends Car {
    override public function drive(): String {
        return '$model is driving, but it sure takes a while...';
    }
}

private class Bicycle extends Vehicle {
    public var ringResult: String;

    public function new(model: String, ?hp: Int) {
        super(model, hp);
        ringResult = "";
    }

    override public function honk(): String {
        ringResult = '$model does *ring*';
        return ringResult;
    }
}

function main() {
    var vehicle = new Vehicle('A Rock', 0);
    assert(vehicle.getModel() == "A Rock");
    assert(vehicle.getHp() == 0);

    var car = new Car('Mitsubishi EVO', 1000, 30);
    assert(car.getModel() == "Mitsubishi EVO");
    assert(car.drive() == "Mitsubishi EVO is driving with 1000 HP and 30 L of fuel");

    var truck = new Truck('Volvo FH16', 500, 150);
    assert(truck.drive() == "Volvo FH16 is driving, but it sure takes a while...");

    var bicycle = new Bicycle('Rusted unnamed bike', 1);
    assert(bicycle.honk() == "Rusted unnamed bike does *ring*");
}
