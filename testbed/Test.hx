import go.tinygo.Machine;

class Test {

    public static function main() {
        var pin = Machine.LED;
        pin.configure({ mode: Machine.pinOutput });

        while (true) {
            pin.high();
            Sys.sleep(1);
            pin.low();
            Sys.sleep(1);
        }
    }

}
