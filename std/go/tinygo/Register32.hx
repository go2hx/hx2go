package go.tinygo;

#if tinygo

@:structInit
@:go.TypeAccess({ name: "*volatile.Register32", imports: ["volatile"] })
extern class Register32 {

    public var reg: UInt32;

    public function get(): UInt32;
    public function set(value: UInt32): Void;
    public function setBits(value: UInt32): Void;
    public function clearBits(value: UInt32): Void;
    public function hasBits(value: UInt32): Bool;
    public function replaceBits(value: UInt32, mask: UInt32, pos: UInt32): Void;

}

#end
