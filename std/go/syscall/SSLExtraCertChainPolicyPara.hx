package go.syscall;

@:structInit
@:go.Type({ name: "SSLExtraCertChainPolicyPara", instanceName: "syscall.SSLExtraCertChainPolicyPara", imports: ["syscall"] })
extern class SSLExtraCertChainPolicyPara {

    @:native("Size") var size: go.UInt32;
    @:native("AuthType") var authType: go.UInt32;
    @:native("Checks") var checks: go.UInt32;
    @:native("ServerName") var serverName: go.Pointer<go.UInt16>;

    function new(size: go.UInt32=0, authType: go.UInt32=0, checks: go.UInt32=0, serverName: go.Pointer<go.UInt16>=null);

}