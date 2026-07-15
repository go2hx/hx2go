package go.internal.runtime.cgroup;

@:structInit
@:go.Type({ name: "CPU", instanceName: "cgroup.CPU", imports: ["internal/runtime/cgroup"] })
extern class CPU {

    @:native("Close") function close(): Void;

}