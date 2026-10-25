package go.syscall;

@:structInit
@:go.Type({ name: "CertChainPolicyStatus", instanceName: "syscall.CertChainPolicyStatus", imports: ["syscall"] })
extern class CertChainPolicyStatus {

    @:native("Size") var size: go.UInt32;
    @:native("Error") var error: go.UInt32;
    @:native("ChainIndex") var chainIndex: go.UInt32;
    @:native("ElementIndex") var elementIndex: go.UInt32;
    @:native("ExtraPolicyStatus") var extraPolicyStatus: go.syscall.Pointer;

    function new(size: go.UInt32=0, error: go.UInt32=0, chainIndex: go.UInt32=0, elementIndex: go.UInt32=0, extraPolicyStatus: go.syscall.Pointer=null);

}