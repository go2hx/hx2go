package go.compress.bzip2;

@:structInit
@:go.Type({ name: "huffmanTree", instanceName: "bzip2.huffmanTree", imports: ["compress/bzip2"] })
extern class HuffmanTree {

    @:native("Decode") function decode(br: go.Pointer<go.compress.bzip2.BitReader>): (go.UInt16);

}