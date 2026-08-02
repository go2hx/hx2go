package go.compress.bzip2;

@:structInit
@:go.Type({ name: "bitReader", instanceName: "bzip2.bitReader", imports: ["compress/bzip2"] })
extern class BitReader {

    @:native("Err") function err(): (go.Error);
    @:native("ReadBit") function readBit(): (Bool);
    @:native("ReadBits") function readBits(bits: go.GoUInt): (go.GoInt);
    @:native("ReadBits64") function readBits64(bits: go.GoUInt): (go.UInt64);

}