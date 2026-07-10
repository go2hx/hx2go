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
}

private class Car extends Vehicle {
    public var fuel: Int;

    public function new(model: String, ?hp: Int, ?fuel: Int) {
        super(model, hp);
        this.fuel = fuel;
    }

    public function drive(): String {
        return '$model is driving with $hp HP and $fuel L of fuel';
    }
}

function main() {
    var bicycle = new Vehicle('Bike', 1);
    assert(bicycle.getModel() == "Bike");

    var bicycle_as_vehicle: Vehicle = bicycle;
    assert(bicycle_as_vehicle.getModel() == "Bike");

    var bicycle_dyn: Dynamic = bicycle;
    var bicycle_from_dyn: Vehicle = bicycle_dyn;
    assert(bicycle_from_dyn.getModel() == "Bike");

    var car = new Car('Toyota', 200, 50);
    var car_as_vehicle: Vehicle = car;
    assert(car_as_vehicle.getModel() == "Toyota");

    var car_dyn: Dynamic = car;
    var car_from_dyn: Car = car_dyn;
    assert(car_from_dyn.drive() == "Toyota is driving with 200 HP and 50 L of fuel");
}
