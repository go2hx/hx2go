package go.internal.pkgbits;

@:structInit
@:go.Type({ name: "PkgDecoder", instanceName: "pkgbits.PkgDecoder", imports: ["internal/pkgbits"] })
extern class PkgDecoder {

    @:native("AbsIdx") function absIdx(k: go.internal.pkgbits.SectionKind, idx: go.internal.pkgbits.RelElemIdx): go.GoInt;
    @:native("DataIdx") function dataIdx(k: go.internal.pkgbits.SectionKind, idx: go.internal.pkgbits.RelElemIdx): String;
    @:native("Fingerprint") function fingerprint(): go.GoArray<go.Byte, 8>;
    @:native("NewDecoder") function newDecoder(k: go.internal.pkgbits.SectionKind, idx: go.internal.pkgbits.RelElemIdx, marker: go.internal.pkgbits.SyncMarker): go.internal.pkgbits.Decoder;
    @:native("NewDecoderRaw") function newDecoderRaw(k: go.internal.pkgbits.SectionKind, idx: go.internal.pkgbits.RelElemIdx): go.internal.pkgbits.Decoder;
    @:native("NumElems") function numElems(k: go.internal.pkgbits.SectionKind): go.GoInt;
    @:go.Tuple("p0", "p1", "p2") @:native("PeekObj") function peekObj(idx: go.internal.pkgbits.RelElemIdx): go.Tuple<{ p0: String, p1: String, p2: go.internal.pkgbits.CodeObj }>;
    @:native("PeekPkgPath") function peekPkgPath(idx: go.internal.pkgbits.RelElemIdx): String;
    @:native("PkgPath") function pkgPath(): String;
    @:native("RetireDecoder") function retireDecoder(d: go.Pointer<go.internal.pkgbits.Decoder>): Void;
    @:native("StringIdx") function stringIdx(idx: go.internal.pkgbits.RelElemIdx): String;
    @:native("SyncMarkers") function syncMarkers(): Bool;
    @:native("TempDecoder") function tempDecoder(k: go.internal.pkgbits.SectionKind, idx: go.internal.pkgbits.RelElemIdx, marker: go.internal.pkgbits.SyncMarker): go.internal.pkgbits.Decoder;
    @:native("TempDecoderRaw") function tempDecoderRaw(k: go.internal.pkgbits.SectionKind, idx: go.internal.pkgbits.RelElemIdx): go.internal.pkgbits.Decoder;
    @:native("TotalElems") function totalElems(): go.GoInt;

}