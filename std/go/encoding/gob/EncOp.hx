package go.encoding.gob;

@:go.Type({ name: "encOp", instanceName: "gob.encOp", imports: ["encoding/gob"] })
extern typedef EncOp = (i: go.Pointer<go.encoding.gob.EncInstr>, state: go.Pointer<go.encoding.gob.EncoderState>, v: go.reflect.Value) -> Void