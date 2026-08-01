package go.net;

@:go.Type({ name: "temporary", instanceName: "net.temporary", imports: ["net"] })
extern typedef Temporary = {

    @:native("Temporary") function temporary(): (Bool);

}