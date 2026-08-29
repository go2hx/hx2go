package go.crypto.hpke;

/**
    Sender is a sending HPKE context. It is instantiated with a specific KEM
    encapsulation key (i.e. the public key), and it is stateful, incrementing the
    nonce counter for each [Sender.Seal] call.
**/
@:structInit
@:go.Type({ name: "Sender", instanceName: "hpke.Sender", imports: ["crypto/hpke"] })
extern class Sender {

    /**
        Export produces a secret value derived from the shared key between sender and
        recipient. length must be at most 65,535.
    **/
    @:native("Export") function export(exporterContext: String, length: go.GoInt): (go.Result<go.Slice<go.Byte>>);
    /**
        Seal encrypts the provided plaintext, optionally binding to the additional
        public data aad.
        
        Seal uses incrementing counters for each call, and Open on the receiving side
        must be called in the same order as Seal.
    **/
    @:native("Seal") function seal(aad: go.Slice<go.Byte>, plaintext: go.Slice<go.Byte>): (go.Result<go.Slice<go.Byte>>);

}