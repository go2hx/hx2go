package go.syscall;

@:structInit
@:go.Type({ name: "CertContext", instanceName: "syscall.CertContext", imports: ["syscall"] })
extern class CertContext {

    @:native("EncodingType") var encodingType: go.UInt32;
    @:native("EncodedCert") var encodedCert: go.Pointer<go.Byte>;
    @:native("Length") var length: go.UInt32;
    @:native("CertInfo") var certInfo: go.Pointer<go.syscall.CertInfo>;
    @:native("Store") var store: go.syscall.Handle;

    function new(encodingType: go.UInt32=0, encodedCert: go.Pointer<go.Byte>=null, length: go.UInt32=0, certInfo: go.Pointer<go.syscall.CertInfo>=null, store: go.syscall.Handle=cast 0);

}