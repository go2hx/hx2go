package go.crypto.internal.fips140;

@:go.Type({ name: "subtle", instanceName: "subtle.subtle", imports: ["crypto/internal/fips140/subtle"] })
extern class Subtle {

    @:native("ConstantTimeCompare") static function constantTimeCompare(x: go.Slice<go.Byte>, y: go.Slice<go.Byte>): go.GoInt;
    @:native("ConstantTimeCopy") static function constantTimeCopy(v: go.GoInt, x: go.Slice<go.Byte>, y: go.Slice<go.Byte>): Void;
    @:native("ConstantTimeLessOrEqBytes") static function constantTimeLessOrEqBytes(x: go.Slice<go.Byte>, y: go.Slice<go.Byte>): go.GoInt;
    @:native("XORBytes") static function xORBytes(dst: go.Slice<go.Byte>, x: go.Slice<go.Byte>, y: go.Slice<go.Byte>): go.GoInt;

}