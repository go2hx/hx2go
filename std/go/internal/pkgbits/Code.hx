package go.internal.pkgbits;

@:go.Type({ name: "Code", instanceName: "pkgbits.Code", imports: ["internal/pkgbits"] })
extern typedef Code = {

    @:native("Marker") function marker(): go.internal.pkgbits.SyncMarker;
    @:native("Value") function value(): go.GoInt;

}