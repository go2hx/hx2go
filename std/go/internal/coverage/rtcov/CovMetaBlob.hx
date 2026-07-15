package go.internal.coverage.rtcov;

@:structInit
@:go.Type({ name: "CovMetaBlob", instanceName: "rtcov.CovMetaBlob", imports: ["internal/coverage/rtcov"] })
extern class CovMetaBlob {

    @:native("P") var P: go.Pointer<go.Byte>;
    @:native("Len") var len: go.UInt32;
    @:native("Hash") var hash: go.GoArray<go.Byte, 16>;
    @:native("PkgPath") var pkgPath: String;
    @:native("PkgID") var pkgID: go.GoInt;
    @:native("CounterMode") var counterMode: go.UInt8;
    @:native("CounterGranularity") var counterGranularity: go.UInt8;

function new(P: go.Pointer<go.Byte>, len: go.UInt32, hash: go.GoArray<go.Byte, 16>, pkgPath: String, pkgID: go.GoInt, counterMode: go.UInt8, counterGranularity: go.UInt8);

}