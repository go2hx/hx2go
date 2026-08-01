package go.slices;

@:go.Type({ name: "xorshift", instanceName: "slices.xorshift", imports: ["slices"] })
extern typedef Xorshift = haxe.extern.EitherType<go.UInt64, {
    @:native("Next") function next(): (go.UInt64);

}>