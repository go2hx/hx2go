package go.encoding;

/**
    BinaryMarshaler is the interface implemented by an object that can
    marshal itself into a binary form.
    
    MarshalBinary encodes the receiver into a binary form and returns the result.
**/
@:go.Type({ name: "BinaryMarshaler", instanceName: "encoding.BinaryMarshaler", imports: ["encoding"] })
extern typedef BinaryMarshaler = {

    @:native("MarshalBinary") function marshalBinary(): (go.Result<go.Slice<go.Byte>>);

}