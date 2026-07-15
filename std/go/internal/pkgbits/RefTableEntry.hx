package go.internal.pkgbits;

@:structInit
@:go.Type({ name: "RefTableEntry", instanceName: "pkgbits.RefTableEntry", imports: ["internal/pkgbits"] })
extern class RefTableEntry {

    @:native("Kind") var kind: go.internal.pkgbits.SectionKind;
    @:native("Idx") var idx: go.internal.pkgbits.RelElemIdx;

function new(kind: go.internal.pkgbits.SectionKind, idx: go.internal.pkgbits.RelElemIdx);

}