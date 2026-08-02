package go.net;

@:go.Type({ name: "fileAddr", instanceName: "net.fileAddr", imports: ["net"] })
extern typedef FileAddr = haxe.extern.EitherType<String, {
    @:native("Network") function network(): (String);
    @:native("String") function string(): (String);

}>