package go.archive.tar;

@:go.Type({ name: "Format", instanceName: "tar.Format", imports: ["archive/tar"] })
extern typedef Format = haxe.extern.EitherType<go.GoInt, {
    @:native("String") function string(): (String);

}>