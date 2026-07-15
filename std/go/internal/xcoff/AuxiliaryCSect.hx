package go.internal.xcoff;

@:structInit
@:go.Type({ name: "AuxiliaryCSect", instanceName: "xcoff.AuxiliaryCSect", imports: ["internal/xcoff"] })
extern class AuxiliaryCSect {

    @:native("Length") var length: go.Int64;
    @:native("StorageMappingClass") var storageMappingClass: go.GoInt;
    @:native("SymbolType") var symbolType: go.GoInt;

function new(length: go.Int64, storageMappingClass: go.GoInt, symbolType: go.GoInt);

}