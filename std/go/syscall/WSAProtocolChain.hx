package go.syscall;

@:structInit
@:go.Type({ name: "WSAProtocolChain", instanceName: "syscall.WSAProtocolChain", imports: ["syscall"] })
extern class WSAProtocolChain {

    @:native("ChainLen") var chainLen: go.Int32;
    @:native("ChainEntries") var chainEntries: go.GoArray<go.UInt32, 7>;

    function new(chainLen: go.Int32=0, chainEntries: go.GoArray<go.UInt32, 7>);

}