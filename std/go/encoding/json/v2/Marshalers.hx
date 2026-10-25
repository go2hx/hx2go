package go.encoding.json.v2;

/**
    Marshalers is a list of functions that may override the marshal behavior
    of specific types. Populate [WithMarshalers] to use it with
    [Marshal], [MarshalWrite], or [MarshalEncode].
    A nil *Marshalers is equivalent to an empty list.
    There are no exported fields or methods on Marshalers.
**/
@:go.Type({ name: "Marshalers", instanceName: "json.Marshalers", imports: ["encoding/json/v2"] })
extern typedef Marshalers = go.encoding.json.v2.TypedArshalers<go.encoding.json.jsontext.Encoder>