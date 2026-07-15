package go.internal.xcoff;

@:structInit
@:go.Type({ name: "Symbol", instanceName: "xcoff.Symbol", imports: ["internal/xcoff"] })
extern class Symbol {

    @:native("Name") var name: String;
    @:native("Value") var value: go.UInt64;
    @:native("SectionNumber") var sectionNumber: go.GoInt;
    @:native("StorageClass") var storageClass: go.GoInt;
    @:native("AuxFcn") var auxFcn: go.internal.xcoff.AuxiliaryFcn;
    @:native("AuxCSect") var auxCSect: go.internal.xcoff.AuxiliaryCSect;

function new(name: String, value: go.UInt64, sectionNumber: go.GoInt, storageClass: go.GoInt, auxFcn: go.internal.xcoff.AuxiliaryFcn, auxCSect: go.internal.xcoff.AuxiliaryCSect);

}