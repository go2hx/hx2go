package go.tinygo;

#if tinygo

@:structInit
@:go.TypeAccess({ name: "*volatile.Register16", imports: ["volatile"] })
extern class Register16 {

    public var reg: UInt16;

    public function get(): UInt16;
    public function set(value: UInt16): Void;
    public function setBits(value: UInt16): Void;
    public function clearBits(value: UInt16): Void;
    public function hasBits(value: UInt16): Bool;
    public function replaceBits(value: UInt16, mask: UInt16, pos: UInt16): Void;

}

#end