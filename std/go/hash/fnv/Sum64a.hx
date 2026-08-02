package go.hash.fnv;

@:go.Type({ name: "sum64a", instanceName: "fnv.sum64a", imports: ["hash/fnv"] })
extern typedef Sum64a = haxe.extern.EitherType<go.UInt64, {
    @:native("AppendBinary") function appendBinary(b: go.Slice<go.Byte>): (go.Result<go.Slice<go.Byte>>);
    @:native("BlockSize") function blockSize(): (go.GoInt);
    @:native("Clone") function clone(): (go.Result<go.hash.Cloner>);
    @:native("MarshalBinary") function marshalBinary(): (go.Result<go.Slice<go.Byte>>);
    @:native("Reset") function reset(): Void;
    @:native("Size") function size(): (go.GoInt);
    @:native("Sum") function sum(_in: go.Slice<go.Byte>): (go.Slice<go.Byte>);
    @:native("Sum64") function sum64(): (go.UInt64);
    @:native("UnmarshalBinary") function unmarshalBinary(b: go.Slice<go.Byte>): (go.Error);
    @:native("Write") function write(data: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}>