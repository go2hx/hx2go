package go.syscall;

@:structInit
@:go.Type({ name: "CertChainPolicyPara", instanceName: "syscall.CertChainPolicyPara", imports: ["syscall"] })
extern class CertChainPolicyPara {

    @:native("Size") var size: go.UInt32;
    @:native("Flags") var flags: go.UInt32;
    @:native("ExtraPolicyPara") var extraPolicyPara: go.syscall.Pointer;

    function new(size: go.UInt32=0, flags: go.UInt32=0, extraPolicyPara: go.syscall.Pointer=null);

}