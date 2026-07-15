package go.crypto.internal.fips140.check;

@:go.Type({ name: "checktest", instanceName: "checktest.checktest", imports: ["crypto/internal/fips140/check/checktest"] })
extern class Checktest {

    @:native("BSS") static var BSS: go.Pointer<go.GoInt>;
    @:native("DATA") static var DATA: Dynamic;
    @:native("NOPTRBSS") static var NOPTRBSS: go.GoInt;
    @:native("NOPTRDATA") static var NOPTRDATA: go.GoInt;
    @:native("RODATA") static var RODATA: go.Int32;

    @:native("PtrStaticData") static function ptrStaticData(): go.Pointer<go.UInt32>;
    @:native("PtrStaticText") static function ptrStaticText(): go.unsafe.Pointer;
    @:native("TEXT") static function TEXT(): Void;

}