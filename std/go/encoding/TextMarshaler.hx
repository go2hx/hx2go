package go.encoding;

/**
    TextMarshaler is the interface implemented by an object that can
    marshal itself into a textual form.
    
    MarshalText encodes the receiver into UTF-8-encoded text and returns the result.
**/
@:go.Type({ name: "TextMarshaler", instanceName: "encoding.TextMarshaler", imports: ["encoding"] })
extern typedef TextMarshaler = {

    @:native("MarshalText") function marshalText(): (go.Result<go.Slice<go.Byte>>);

}