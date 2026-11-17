package go.encoding.json;

@:go.Type({ name: "encoderFunc", instanceName: "json.encoderFunc", imports: ["encoding/json"] })
extern typedef EncoderFunc = (e: go.Pointer<go.encoding.json.EncodeState>, v: go.reflect.Value, opts: go.encoding.json.EncOpts) -> Void