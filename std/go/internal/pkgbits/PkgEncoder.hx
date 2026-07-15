package go.internal.pkgbits;

@:structInit
@:go.Type({ name: "PkgEncoder", instanceName: "pkgbits.PkgEncoder", imports: ["internal/pkgbits"] })
extern class PkgEncoder {

    @:native("DumpTo") function dumpTo(out0: go.io.Writer): go.GoArray<go.Byte, 8>;
    @:native("NewEncoder") function newEncoder(k: go.internal.pkgbits.SectionKind, marker: go.internal.pkgbits.SyncMarker): go.Pointer<go.internal.pkgbits.Encoder>;
    @:native("NewEncoderRaw") function newEncoderRaw(k: go.internal.pkgbits.SectionKind): go.Pointer<go.internal.pkgbits.Encoder>;
    @:native("StringIdx") function stringIdx(s: String): go.internal.pkgbits.RelElemIdx;
    @:native("SyncMarkers") function syncMarkers(): Bool;

}