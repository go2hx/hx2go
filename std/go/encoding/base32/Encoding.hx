package go.encoding.base32;

@:structInit
@:go.Type({ name: "Encoding", instanceName: "base32.Encoding", imports: ["encoding/base32"] })
extern class Encoding {

    @:native("AppendDecode") function appendDecode(dst: go.Slice<go.Byte>, src: go.Slice<go.Byte>): go.Result<go.Slice<go.Byte>>;
    @:native("AppendEncode") function appendEncode(dst: go.Slice<go.Byte>, src: go.Slice<go.Byte>): go.Slice<go.Byte>;
    @:native("Decode") function decode(dst: go.Slice<go.Byte>, src: go.Slice<go.Byte>): go.Result<go.GoInt>;
    @:native("DecodeString") function decodeString(s: String): go.Result<go.Slice<go.Byte>>;
    @:native("DecodedLen") function decodedLen(n: go.GoInt): go.GoInt;
    @:native("Encode") function encode(dst: go.Slice<go.Byte>, src: go.Slice<go.Byte>): Void;
    @:native("EncodeToString") function encodeToString(src: go.Slice<go.Byte>): String;
    @:native("EncodedLen") function encodedLen(n: go.GoInt): go.GoInt;
    @:native("WithPadding") function withPadding(padding: go.Rune): go.Pointer<go.encoding.base32.Encoding>;

}