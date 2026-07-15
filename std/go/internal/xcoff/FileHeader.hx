package go.internal.xcoff;

@:structInit
@:go.Type({ name: "FileHeader", instanceName: "xcoff.FileHeader", imports: ["internal/xcoff"] })
extern class FileHeader {

    @:native("TargetMachine") var targetMachine: go.UInt16;

function new(targetMachine: go.UInt16);

}