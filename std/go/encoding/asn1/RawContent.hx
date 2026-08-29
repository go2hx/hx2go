package go.encoding.asn1;

/**
    RawContent is used to signal that the undecoded, DER data needs to be
    preserved for a struct. To use it, the first field of the struct must have
    this type. It's an error for any of the other fields to have this type.
**/
@:go.Type({ name: "RawContent", instanceName: "asn1.RawContent", imports: ["encoding/asn1"] })
extern class RawContent {

}