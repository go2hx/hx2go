package go.crypto;

@:go.Type({ name: "subtle", instanceName: "subtle.subtle", imports: ["crypto/subtle"] })
extern class Subtle {

    @:native("ConstantTimeByteEq") static function constantTimeByteEq(x: go.UInt8, y: go.UInt8): go.GoInt;
    @:native("ConstantTimeCompare") static function constantTimeCompare(x: go.Slice<go.Byte>, y: go.Slice<go.Byte>): go.GoInt;
    @:native("ConstantTimeCopy") static function constantTimeCopy(v: go.GoInt, x: go.Slice<go.Byte>, y: go.Slice<go.Byte>): Void;
    @:native("ConstantTimeEq") static function constantTimeEq(x: go.Int32, y: go.Int32): go.GoInt;
    @:native("ConstantTimeLessOrEq") static function constantTimeLessOrEq(x: go.GoInt, y: go.GoInt): go.GoInt;
    @:native("ConstantTimeSelect") static function constantTimeSelect(v: go.GoInt, x: go.GoInt, y: go.GoInt): go.GoInt;
    @:native("WithDataIndependentTiming") static function withDataIndependentTiming(f: () -> Void): Void;
    @:native("XORBytes") static function xORBytes(dst: go.Slice<go.Byte>, x: go.Slice<go.Byte>, y: go.Slice<go.Byte>): go.GoInt;

}