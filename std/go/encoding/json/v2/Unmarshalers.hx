package go.encoding.json.v2;

/**
    Unmarshalers is a list of functions that may override the unmarshal behavior
    of specific types. Populate [WithUnmarshalers] to use it with
    [Unmarshal], [UnmarshalRead], or [UnmarshalDecode].
    A nil *Unmarshalers is equivalent to an empty list.
    There are no exported fields or methods on Unmarshalers.
**/
@:go.Type({ name: "Unmarshalers", instanceName: "json.Unmarshalers", imports: ["encoding/json/v2"] })
extern typedef Unmarshalers = go.encoding.json.v2.TypedArshalers<go.encoding.json.jsontext.Decoder>