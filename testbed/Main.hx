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

interface IResource{
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

        var vehicle_dyn: Dynamic = bicycle_as_vehicle;
        var vehicle_dyn_vehicle: Vehicle = vehicle_dyn;

        vehicle_dyn_vehicle.honk();

        trace(bicycle.kw);

        var texture = new Texture("image.png");
        var sound = new Sound("audio.mp3");
        var sample = new Sample("sfx.wav");

        var texture_res: IResource = texture;
        var sound_res: IResource = sound;
        var sample_res: IResource = sample;

        texture_res.dispose();
        sound_res.dispose();
        sample_res.dispose();
    }

}