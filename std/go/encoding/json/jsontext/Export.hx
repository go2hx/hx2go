package go.encoding.json.jsontext;

@:structInit
@:go.Type({ name: "export", instanceName: "jsontext.export", imports: ["encoding/json/jsontext"] })
extern class Export {

    @:native("Decoder") function decoder(d: go.Pointer<go.encoding.json.jsontext.Decoder>): (go.Pointer<go.encoding.json.jsontext.DecoderState>);
    @:native("Encoder") function encoder(e: go.Pointer<go.encoding.json.jsontext.Encoder>): (go.Pointer<go.encoding.json.jsontext.EncoderState>);
    @:native("GetBufferedDecoder") function getBufferedDecoder(b: go.Slice<go.Byte>, o: haxe.Rest<go.encoding.json.jsontext.Options>): (go.Pointer<go.encoding.json.jsontext.Decoder>);
    @:native("GetBufferedEncoder") function getBufferedEncoder(o: haxe.Rest<go.encoding.json.jsontext.Options>): (go.Pointer<go.encoding.json.jsontext.Encoder>);
    @:native("GetStreamingDecoder") function getStreamingDecoder(r: go.io.Reader, o: haxe.Rest<go.encoding.json.jsontext.Options>): (go.Pointer<go.encoding.json.jsontext.Decoder>);
    @:native("GetStreamingEncoder") function getStreamingEncoder(w: go.io.Writer, o: haxe.Rest<go.encoding.json.jsontext.Options>): (go.Pointer<go.encoding.json.jsontext.Encoder>);
    @:native("IsIOError") function isIOError(err: go.Error): (Bool);
    @:native("PutBufferedDecoder") function putBufferedDecoder(d: go.Pointer<go.encoding.json.jsontext.Decoder>): Void;
    @:native("PutBufferedEncoder") function putBufferedEncoder(e: go.Pointer<go.encoding.json.jsontext.Encoder>): Void;
    @:native("PutStreamingDecoder") function putStreamingDecoder(d: go.Pointer<go.encoding.json.jsontext.Decoder>): Void;
    @:native("PutStreamingEncoder") function putStreamingEncoder(e: go.Pointer<go.encoding.json.jsontext.Encoder>): Void;

}