package go.internal.runtime;

@:go.Type({ name: "sys", instanceName: "sys.sys", imports: ["internal/runtime/sys"] })
extern class Sys {

    @:native("DefaultPhysPageSize") static var DefaultPhysPageSize: go.GoInt;
    @:native("Int64Align") static var Int64Align: go.GoInt;
    @:native("MinFrameSize") static var MinFrameSize: go.GoInt;
    @:native("PCQuantum") static var PCQuantum: go.GoInt;
    @:native("StackAlign") static var StackAlign: go.GoInt;
    @:native("StackGuardMultiplier") static var StackGuardMultiplier: go.GoInt;

    @:native("DITSupported") static var DITSupported: Bool;

    @:native("Bswap32") static function bswap32(x: go.UInt32): go.UInt32;
    @:native("Bswap64") static function bswap64(x: go.UInt64): go.UInt64;
    @:native("DITEnabled") static function dITEnabled(): Bool;
    @:native("DisableDIT") static function disableDIT(): Void;
    @:native("EnableDIT") static function enableDIT(): Bool;
    @:native("GetCallerPC") static function getCallerPC(): go.UIntPtr;
    @:native("GetCallerSP") static function getCallerSP(): go.UIntPtr;
    @:native("GetClosurePtr") static function getClosurePtr(): go.UIntPtr;
    @:native("LeadingZeros64") static function leadingZeros64(x: go.UInt64): go.GoInt;
    @:native("LeadingZeros8") static function leadingZeros8(x: go.UInt8): go.GoInt;
    @:native("Len64") static function len64(x: go.UInt64): go.GoInt;
    @:native("Len8") static function len8(x: go.UInt8): go.GoInt;
    @:native("OnesCount64") static function onesCount64(x: go.UInt64): go.GoInt;
    @:native("Prefetch") static function prefetch(addr: go.UIntPtr): Void;
    @:native("PrefetchStreamed") static function prefetchStreamed(addr: go.UIntPtr): Void;
    @:native("TrailingZeros32") static function trailingZeros32(x: go.UInt32): go.GoInt;
    @:native("TrailingZeros64") static function trailingZeros64(x: go.UInt64): go.GoInt;
    @:native("TrailingZeros8") static function trailingZeros8(x: go.UInt8): go.GoInt;

}