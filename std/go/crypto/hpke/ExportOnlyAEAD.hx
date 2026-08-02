package go.crypto.hpke;

@:structInit
@:go.Type({ name: "exportOnlyAEAD", instanceName: "hpke.exportOnlyAEAD", imports: ["crypto/hpke"] })
extern class ExportOnlyAEAD {

    @:native("ID") function ID(): (go.UInt16);

}