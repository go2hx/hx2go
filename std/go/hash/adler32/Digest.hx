package go.hash.adler32;

@:go.Type({ name: "digest", instanceName: "adler32.digest", imports: ["hash/adler32"] })
extern typedef Digest = haxe.extern.EitherType<go.UInt32, {
    @:native("AppendBinary") function appendBinary(b: go.Slice<go.Byte>): (go.Result<go.Slice<go.Byte>>);
    @:native("BlockSize") function blockSize(): (go.GoInt);
    @:native("Clone") function clone(): (go.Result<go.hash.Cloner>);
    @:native("MarshalBinary") function marshalBinary(): (go.Result<go.Slice<go.Byte>>);
    @:native("Reset") function reset(): Void;
    @:native("Size") function size(): (go.GoInt);
    @:native("Sum") function sum(_in: go.Slice<go.Byte>): (go.Slice<go.Byte>);
    @:native("Sum32") function sum32(): (go.UInt32);
    @:native("UnmarshalBinary") function unmarshalBinary(b: go.Slice<go.Byte>): (go.Error);
    @:native("Write") function write(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}>