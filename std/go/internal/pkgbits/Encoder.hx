package go.internal.pkgbits;

@:structInit
@:go.Type({ name: "Encoder", instanceName: "pkgbits.Encoder", imports: ["internal/pkgbits"] })
extern class Encoder {

    @:native("Relocs") var relocs: go.Slice<go.internal.pkgbits.RefTableEntry>;
    @:native("RelocMap") var relocMap: go.Map<go.internal.pkgbits.RefTableEntry, go.UInt32>;
    @:native("Data") var data: go.bytes.Buffer;
    @:native("Idx") var idx: go.internal.pkgbits.RelElemIdx;

function new(relocs: go.Slice<go.internal.pkgbits.RefTableEntry>, relocMap: go.Map<go.internal.pkgbits.RefTableEntry, go.UInt32>, data: go.bytes.Buffer, idx: go.internal.pkgbits.RelElemIdx);

    @:native("Bool") function bool(b: Bool): Bool;
    @:native("Code") function code(c: go.internal.pkgbits.Code): Void;
    @:native("Flush") function flush(): go.internal.pkgbits.RelElemIdx;
    @:native("Int") function int(x: go.GoInt): Void;
    @:native("Int64") function int64(x: go.Int64): Void;
    @:native("Len") function len(x: go.GoInt): Void;
    @:native("Reloc") function reloc(k: go.internal.pkgbits.SectionKind, idx: go.internal.pkgbits.RelElemIdx): Void;
    @:native("String") function string(s: String): Void;
    @:native("StringRef") function stringRef(idx: go.internal.pkgbits.RelElemIdx): Void;
    @:native("Strings") function strings(ss: go.Slice<String>): Void;
    @:native("Sync") function sync(m: go.internal.pkgbits.SyncMarker): Void;
    @:native("Uint") function uint(x: go.GoUInt): Void;
    @:native("Uint64") function uint64(x: go.UInt64): Void;
    @:native("Value") function value(val: go.go.constant.Value): Void;
    @:native("Version") function version(): go.internal.pkgbits.Version;

}