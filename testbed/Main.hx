class Vehicle {

    public var model: String;
    public var hp: Null<Int>;
    public var kw(get, never): Null<Float>;

    public function new(model: String, ?hp: Int) {
        this.model = model;
        this.hp = hp;
    }

    public function honk() {
        trace('$model makes an unknown sound! what could it be?!');
    }

    public function get_kw(): Null<Float> {
        return hp != null ? hp * 0.745 : null;
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

interface IResource {
    public function dispose(): Void;
}

class Texture implements IResource {

    public var path: String;

    public function new(path: String) {
        this.path = path;
    }

    public function dispose(): Void {
        trace('texture disposed');
    }

}

class Sound implements IResource {

    public var path: String;

    public function new(path: String) {
        this.path = path;
    }

    public function dispose(): Void {
        trace('sound disposed');
    }

}

class Sample extends Sound implements IResource {

    override public function dispose(): Void {
        trace('sample disposed');
    }

}

class Main {

    public static function announce(name: String): Void {
        trace('$name has been announced');
    }

    public static function main() {
        var vehicle = new Vehicle('A Rock', 0);
        vehicle.honk();

        var car = new Car('Mitsubishi EVO', 1000, 30);
        car.honk();
        car.drive();

        var truck = new Truck('Volvo FH16', 500, 150);
        truck.honk();
        truck.drive();

        var bicycle = new Bicycle('Rusted unnamed bike', 1);
        bicycle.honk();

        var bicycle_as_vehicle: Vehicle = bicycle;
        bicycle_as_vehicle.honk();

        var vehicle_dyn: Dynamic = bicycle;
        var vehicle_dyn_vehicle: Bicycle = vehicle_dyn;

        vehicle_dyn_vehicle.honk();
        trace(vehicle_dyn.model, vehicle_dyn.hp);

        trace(bicycle.kw);

        var texture = new Texture("image.png");
        var sound = new Sound("audio.mp3");
        var sample = new Sample("sfx.wav");

        var resources: Array<IResource> = [texture, sound, sample];
        for (res in resources) {
            res.dispose();
        }

        var stat_closure = announce;
        var stat_closure_bound = stat_closure.bind("Bob");

        stat_closure("Elisa");
        stat_closure_bound();

        var foo: Car = truck;
        var bar = foo.drive;
        foo = car;
        bar();

        var test = {
            fn: () -> {
                trace("hello!!");
            },
            cool: 5,
        };

        test.cool = 10;
        var test2 = test.fn;
        test2();

        var truck_dyn: Dynamic = truck;
        var dyn_to_car: Car = truck_dyn;
        dyn_to_car.drive();
        dyn_to_car.model = "Mercedes Truck";
        truck_dyn.model = "cheese";

        truck.drive();
    }

}