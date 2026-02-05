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

@:analyzer(ignore)
class Test {

    public static function main() {
        var myCar = new Car();
        myCar.start();
        myCar.honk();

        var myTruck = new Truck();
        myTruck.start();
        myTruck.honk();

        var myVehicle: Vehicle = new Vehicle();
        myVehicle.start();

        (myTruck : Vehicle).start();

        Sys.println(myTruck.horsepower());
    }

}

/*

14:05:18:663   Test.hx:4:,Vehicle created
14:05:18:664   Test.hx:20:,Car started
14:05:18:664   Test.hx:24:,Car honked
14:05:18:664   Test.hx:4:,Vehicle created
14:05:18:664   Test.hx:33:,Truck started
14:05:18:664   Test.hx:37:,Truck honked loudly
14:05:18:664   Test.hx:4:,Vehicle created
14:05:18:664   Test.hx:8:,Vehicle started
14:05:18:664   Test.hx:65:,100
 */