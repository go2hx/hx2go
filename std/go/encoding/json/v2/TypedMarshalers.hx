package go.encoding.json.v2;

@:go.Type({ name: "typedMarshalers", instanceName: "json.typedMarshalers", imports: ["encoding/json/v2"] })
extern typedef TypedMarshalers = go.encoding.json.v2.TypedArshalers<go.encoding.json.jsontext.Encoder>