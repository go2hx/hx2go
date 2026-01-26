import go.tinygo.Machine;
import go.tinygo.PinConfig;

class Test {

    public static function main() {
        var pin = Machine.LED;
        var conf: PinConfig = {
            mode: Machine.pinOutput
        };

        pin.configure(conf);

        while (true) {
            pin.high();
            Sys.sleep(1);
            pin.low();
            Sys.sleep(1);
        }
    }

}

