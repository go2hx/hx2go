package go.tinygo;

#if tinygo

@:structInit
@:go.TypeAccess({ name: "*machine.RingBuffer", imports: ["machine"] })
extern class RingBuffer {
    function clear(): Void;
    function get(): Tuple<{ byte: UInt8, valid: Bool }>; // UInt8 should be byte
    function put(val: UInt8): Bool; // UInt8 should be byte
    function used(): UInt8;
}

#end
