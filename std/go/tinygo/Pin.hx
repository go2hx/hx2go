package go.tinygo;

#if tinygo

@:go.TypeAccess({ name: "machine.Pin", imports: ["machine"] })
extern class Pin {

    // TODO: this extern is incomplete - see function below (requires callbacks)
    // function setInterrupt(pinChange: PinChange, callback: Pin->Void): Tuple<{ error: Error }>;

    function configure(config: PinConfig): Void;
    function get(): Bool;
    function high(): Void;
    function low(): Void;
    function portMaskSet(): Tuple<{ register: Register8, mask: UInt8 }>;
    function portMaskClear(): Tuple<{ register: Register8, mask: UInt8 }>;
    function set(value: Bool): Void;

}

#end
