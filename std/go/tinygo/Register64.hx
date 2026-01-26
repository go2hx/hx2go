package go.tinygo;

#if tinygo

@:structInit
@:go.TypeAccess({ name: "*volatile.Register64", imports: ["volatile"] })
extern class Register64 {

    public var reg: UInt64;

    public function get(): UInt64;
    public function set(value: UInt64): Void;
    public function setBits(value: UInt64): Void;
    public function clearBits(value: UInt64): Void;
    public function hasBits(value: UInt64): Bool;
    public function replaceBits(value: UInt64, mask: UInt64, pos: UInt64): Void;

}

#end
