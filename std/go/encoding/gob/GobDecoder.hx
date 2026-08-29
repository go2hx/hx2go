package go.encoding.gob;

/**
    GobDecoder is the interface describing data that provides its own
    routine for decoding transmitted values sent by a GobEncoder.
**/
@:go.Type({ name: "GobDecoder", instanceName: "gob.GobDecoder", imports: ["encoding/gob"] })
extern typedef GobDecoder = {

    @:native("GobDecode") function gobDecode(p0: go.Slice<go.Byte>): (go.Error);

}