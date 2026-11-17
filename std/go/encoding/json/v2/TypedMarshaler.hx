package go.encoding.json.v2;

@:go.Type({ name: "typedMarshaler", instanceName: "json.typedMarshaler", imports: ["encoding/json/v2"] })
extern typedef TypedMarshaler = go.encoding.json.v2.TypedArshaler<go.encoding.json.jsontext.Encoder>