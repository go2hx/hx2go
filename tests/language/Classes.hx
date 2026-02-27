package language;

import haxe.iterators.ArrayIterator;

class Vehicle {

    public function new() {}

    public function start(): String {
        return "Vehicle started";
    }

    public function horsepower(): Int {
        return 100;
    }

}

class Car extends Vehicle {

    override public function start(): String {
        return "Car started";
    }

    public function startVehicle(): String {
        return super.start();
    }

    public function honk(): String {
        return "Car honked";
    }

}

class Truck extends Car {

    override public function start(): String {
        return "Truck started";
    }

    override public function honk(): String {
        return "Truck honked loudly";
    }

}

class Greeter {

    public var firstName = "First";
    public var lastName = "Second";

    public function new(firstName: String) {
        this.firstName = firstName;
    }

    public function getFullName(): String {
        return firstName + " " + lastName;
    }

}

class LastNameGreeter extends Greeter {

    public function new(firstName: String, lastName: String) {
        super(firstName);
        this.lastName = lastName;
    }

}

class Ref<T> {

    public var value: T;

    public function new(_value: T) {
        set(_value);
    }

    public function set(_value: T): Void {
        value = _value;
    }

    public function get(): T {
        return value;
    }

}

function run() {
    trace("OOP\n");

    var truck: Truck = new Truck();
    var vehicle: Vehicle = truck;

    assert(vehicle.horsepower(), 100);
    assert(vehicle.start(), "Truck started");
    assert(truck.startVehicle(), "Vehicle started");
    assert(truck.horsepower(), 100);
    assert(truck.honk(), "Truck honked loudly");

    var arr = [1, 2, 3];
    var arr_iter = new ArrayIterator(arr);
    var arr_results = [];
    for (x in arr_iter) arr_results.push(x);
    assert(arr_results[0], 1);
    assert(arr_results[1], 2);
    assert(arr_results[2], 3);

    var str = ["a", "b", "c"];
    var str_iter = new ArrayIterator(str);
    var str_results = [];
    for (x in str_iter) str_results.push(x);
    assert(str_results[0], "a");
    assert(str_results[1], "b");
    assert(str_results[2], "c");

    var x: Ref<Int> = new Ref(3);
    assert(x.get(), 3);
    x.set(5);
    assert(x.get(), 5);
    x.set(10);
    assert(x.get(), 10);

    var y: Ref<Ref<Int>> = new Ref(x);
    assert(y.get().get(), 10);

    var refa: Ref<Truck> = new Ref(truck);
    var refb: Ref<Ref<Truck>> = new Ref(refa);
    assert(refa.get().honk(), "Truck honked loudly");

    var v: Vehicle = refb.get().get();
    assert(v.start(), "Truck started");

    var greet0 = new Greeter("Elise");
    assert(greet0.getFullName(), "Elise Second");

    var greet1 = new LastNameGreeter("Bob", "Third");
    assert(greet1.getFullName(), "Bob Third");
}