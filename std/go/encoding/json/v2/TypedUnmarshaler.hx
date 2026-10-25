package go.encoding.json.v2;

@:go.Type({ name: "typedUnmarshaler", instanceName: "json.typedUnmarshaler", imports: ["encoding/json/v2"] })
extern typedef TypedUnmarshaler = go.encoding.json.v2.TypedArshaler<go.encoding.json.jsontext.Decoder>