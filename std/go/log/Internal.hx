package go.log;

@:go.Type({ name: "internal", instanceName: "internal.internal", imports: ["log/internal"] })
extern class Internal {

    @:native("DefaultOutput") static var DefaultOutput: (pc: go.UIntPtr, data: go.Slice<go.Byte>) -> go.Error;

}