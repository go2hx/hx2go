package go.encoding.gob;

@:go.Type({ name: "encHelper", instanceName: "gob.encHelper", imports: ["encoding/gob"] })
extern typedef EncHelper = (state: go.Pointer<go.encoding.gob.EncoderState>, v: go.reflect.Value) -> (Bool)