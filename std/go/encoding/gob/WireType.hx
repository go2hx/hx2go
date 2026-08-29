package go.encoding.gob;

@:structInit
@:go.Type({ name: "wireType", instanceName: "gob.wireType", imports: ["encoding/gob"] })
extern class WireType {

    @:native("ArrayT") var arrayT: go.Pointer<go.encoding.gob.ArrayType>;
    @:native("SliceT") var sliceT: go.Pointer<go.encoding.gob.SliceType>;
    @:native("StructT") var structT: go.Pointer<go.encoding.gob.StructType>;
    @:native("MapT") var mapT: go.Pointer<go.encoding.gob.MapType>;
    @:native("GobEncoderT") var gobEncoderT: go.Pointer<go.encoding.gob.GobEncoderType>;
    @:native("BinaryMarshalerT") var binaryMarshalerT: go.Pointer<go.encoding.gob.GobEncoderType>;
    @:native("TextMarshalerT") var textMarshalerT: go.Pointer<go.encoding.gob.GobEncoderType>;

    function new(arrayT: go.Pointer<go.encoding.gob.ArrayType>=null, sliceT: go.Pointer<go.encoding.gob.SliceType>=null, structT: go.Pointer<go.encoding.gob.StructType>=null, mapT: go.Pointer<go.encoding.gob.MapType>=null, gobEncoderT: go.Pointer<go.encoding.gob.GobEncoderType>=null, binaryMarshalerT: go.Pointer<go.encoding.gob.GobEncoderType>=null, textMarshalerT: go.Pointer<go.encoding.gob.GobEncoderType>=null);

}