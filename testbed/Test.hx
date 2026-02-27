import go.Fmt;

import runtime.HxClass;
import haxe.iterators.ArrayIterator;

class Vehicle {

    public function new() {
        Sys.println("Vehicle created");
    }

    public function start(): Void {
        Sys.println("Vehicle started");
    }

    public function horsepower(): Int {
        return 100;
    }

}

class Car extends Vehicle {

    override public function start(): Void {
        Sys.println("Car started");
    }

    public function startVehicle(): Void {
        super.start();
    }

    public function honk(): Void {
        Sys.println("Car honked");
    }

}

class Truck extends Car {

    override public function start(): Void {
        Sys.println("Truck started");
    }

    override public function honk(): Void {
        Sys.println("Truck honked loudly");
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

    public function greet(): Void {
        Sys.println("Hello, " + getFullName());
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

    public function set(_value: T) {
        value = _value;
    }

    public function get(): T {
        return value;
    }

}

@:analyzer(ignore)
class Test {

    public static function main() {
        var truck: Truck = new Truck();
        var vehicle: Vehicle = truck;
        Sys.println(vehicle.horsepower());

        vehicle.start();
        truck.startVehicle();

        Sys.println(truck.horsepower());
        truck.honk();

        var arr = [1, 2, 3];
        var str = ["a", "b", "c"];
        var arr_iter = new ArrayIterator(arr);
        var str_iter = new ArrayIterator(str);

        for (x in arr_iter) {
            Sys.println('iter: ' + Std.string(x));
        }

        for (x in str_iter) {
            Sys.println('iter: ' + Std.string(x));
        }

        var x: Ref<Int> = new Ref(3);
        Sys.println(x.get());
        x.set(5);
        Sys.println(x.get());
        x.set(10);

        var y: Ref<Ref<Int>> = new Ref(x);
        Sys.println(y.get());
        Sys.println(y.get().get());

        var refa: Ref<Truck> = new Ref(truck);
        var refb: Ref<Ref<Truck>> = new Ref(refa);
        refa.get().honk();

        var v: Vehicle = refb.get().get();
        v.start();

        var cls = HxClass.findClass("Truck");
        Sys.println(cls);
        Sys.println(cls.superClass);
        Sys.println(cls.superClass.superClass);
        Sys.println(cls.superClass.superClass.superClass); // should be null

        Sys.println("class list:");
        for (c in HxClass.getAllClasses()) {
            Sys.println("  " + c);
        }

        var greet0 = new Greeter("Elise");
        greet0.greet();

        var greet1 = new LastNameGreeter("Bob", "Third");
        greet1.greet();

//        var buf = new StringBuf();
//        buf.add("Hello, ");
//        buf.add("World!");
//        Sys.println(buf.toString());
    }

}
