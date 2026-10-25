package go.syscall;

@:structInit
@:go.Type({ name: "SecurityAttributes", instanceName: "syscall.SecurityAttributes", imports: ["syscall"] })
extern class SecurityAttributes {

    @:native("Length") var length: go.UInt32;
    @:native("SecurityDescriptor") var securityDescriptor: go.UIntPtr;
    @:native("InheritHandle") var inheritHandle: go.UInt32;

    function new(length: go.UInt32=0, securityDescriptor: go.UIntPtr=0, inheritHandle: go.UInt32=0);

}