package go.internal.xcoff;

@:structInit
@:go.Type({ name: "AuxiliaryFcn", instanceName: "xcoff.AuxiliaryFcn", imports: ["internal/xcoff"] })
extern class AuxiliaryFcn {

    @:native("Size") var size: go.Int64;

function new(size: go.Int64);

}