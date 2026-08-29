package go.encoding.asn1;

/**
    An Enumerated is represented as a plain int.
**/
@:go.Type({ name: "Enumerated", instanceName: "asn1.Enumerated", imports: ["encoding/asn1"] })
extern typedef Enumerated = go.GoInt