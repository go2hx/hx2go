package go.crypto.hpke;

/**
    Recipient is a receiving HPKE context. It is instantiated with a specific KEM
    decapsulation key (i.e. the secret key), and it is stateful, incrementing the
    nonce counter for each successful [Recipient.Open] call.
**/
@:structInit
@:go.Type({ name: "Recipient", instanceName: "hpke.Recipient", imports: ["crypto/hpke"] })
extern class Recipient {

    /**
        Export produces a secret value derived from the shared key between sender and
        recipient. length must be at most 65,535.
    **/
    @:native("Export") function export(exporterContext: String, length: go.GoInt): (go.Result<go.Slice<go.Byte>>);
    /**
        Open decrypts the provided ciphertext, optionally binding to the additional
        public data aad, or returns an error if decryption fails.
        
        Open uses incrementing counters for each successful call, and must be called
        in the same order as Seal on the sending side.
    **/
    @:native("Open") function open(aad: go.Slice<go.Byte>, ciphertext: go.Slice<go.Byte>): (go.Result<go.Slice<go.Byte>>);

}