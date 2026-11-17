package go.runtime;

@:structInit
@:go.Type({ name: "kernelVersion", instanceName: "runtime.kernelVersion", imports: ["runtime"] })
extern class KernelVersion {

    @:native("GE") function GE(x: go.GoInt, y: go.GoInt): (Bool);

}