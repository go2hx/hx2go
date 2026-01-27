package go.tinygo;

#if tinygo

@:structInit
@:go.TypeAccess({ name: "machine.PinConfig", imports: ["machine"] })
extern class PinConfig {
    var mode: PinMode;
}

#end