package go.tinygo;

#if tinygo

@:structInit
@:go.TypeAccess({ name: "*volatile.Register8", imports: ["volatile"] })
extern class Register8 {

    public var reg: UInt8;

    public function get(): UInt8;
    public function set(value: UInt8): Void;
    public function setBits(value: UInt8): Void;
    public function clearBits(value: UInt8): Void;
    public function hasBits(value: UInt8): Bool;
    public function replaceBits(value: UInt8, mask: UInt8, pos: UInt8): Void;

}

#end