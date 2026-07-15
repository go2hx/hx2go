package go.internal.pkgbits;

@:structInit
@:go.Type({ name: "Decoder", instanceName: "pkgbits.Decoder", imports: ["internal/pkgbits"] })
extern class Decoder {

    @:native("Relocs") var relocs: go.Slice<go.internal.pkgbits.RefTableEntry>;
    @:native("Data") var data: go.strings.Reader;
    @:native("Idx") var idx: go.internal.pkgbits.RelElemIdx;

function new(relocs: go.Slice<go.internal.pkgbits.RefTableEntry>, data: go.strings.Reader, idx: go.internal.pkgbits.RelElemIdx);

    @:native("Bool") function bool(): Bool;
    @:native("Code") function code(mark: go.internal.pkgbits.SyncMarker): go.GoInt;
    @:native("Int") function int(): go.GoInt;
    @:native("Int64") function int64(): go.Int64;
    @:native("Len") function len(): go.GoInt;
    @:native("Reloc") function reloc(k: go.internal.pkgbits.SectionKind): go.internal.pkgbits.RelElemIdx;
    @:native("String") function string(): String;
    @:native("Strings") function strings(): go.Slice<String>;
    @:native("Sync") function sync(mWant: go.internal.pkgbits.SyncMarker): Void;
    @:native("Uint") function uint(): go.GoUInt;
    @:native("Uint64") function uint64(): go.UInt64;
    @:native("Value") function value(): go.go.constant.Value;
    @:native("Version") function version(): go.internal.pkgbits.Version;

}