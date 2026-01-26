import go.time.Time;

@:go.TypeAccess({ name: "machine", imports: ["machine"] })
extern class Machine {
    static var LED: Pin;
}

@:go.TypeAccess({ name: "machine.Pin", imports: ["machine"] })
extern class Pin {
    function low(): Void;
    function high(): Void;
}

class Test {

    public static function main() {
        var led = Machine.LED;

        while (true) {
            led.high();
            Time.sleep(Time.second);
            led.low();
            Time.sleep(Time.second);
        }
    }

}

