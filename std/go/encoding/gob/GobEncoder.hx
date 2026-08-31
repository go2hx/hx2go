package go.encoding.gob;

/**
    GobEncoder is the interface describing data that provides its own
    representation for encoding values for transmission to a GobDecoder.
    A type that implements GobEncoder and GobDecoder has complete
    control over the representation of its data and may therefore
    contain things such as private fields, channels, and functions,
    which are not usually transmissible in gob streams.
    
    Note: Since gobs can be stored permanently, it is good design
    to guarantee the encoding used by a GobEncoder is stable as the
    software evolves. For instance, it might make sense for GobEncode
    to include a version number in the encoding.
**/
@:go.Type({ name: "GobEncoder", instanceName: "gob.GobEncoder", imports: ["encoding/gob"] })
extern typedef GobEncoder = {

    @:native("GobEncode") function gobEncode(): (go.Result<go.Slice<go.Byte>>);

}