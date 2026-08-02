package go.sort;

@:go.Type({ name: "xorshift", instanceName: "sort.xorshift", imports: ["sort"] })
extern typedef Xorshift = haxe.extern.EitherType<go.UInt64, {
    @:native("Next") function next(): (go.UInt64);

}>