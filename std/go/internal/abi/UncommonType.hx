package go.internal.abi;

@:structInit
@:go.Type({ name: "UncommonType", instanceName: "abi.UncommonType", imports: ["internal/abi"] })
extern class UncommonType {

    @:native("PkgPath") var pkgPath: go.internal.abi.NameOff;
    @:native("Mcount") var mcount: go.UInt16;
    @:native("Xcount") var xcount: go.UInt16;
    @:native("Moff") var moff: go.UInt32;

function new(pkgPath: go.internal.abi.NameOff, mcount: go.UInt16, xcount: go.UInt16, moff: go.UInt32);

    @:native("ExportedMethods") function exportedMethods(): go.Slice<go.internal.abi.Method>;
    @:native("Methods") function methods(): go.Slice<go.internal.abi.Method>;

}