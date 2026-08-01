package go.net;

@:structInit
@:go.Type({ name: "pipeAddr", instanceName: "net.pipeAddr", imports: ["net"] })
extern class PipeAddr {

    @:native("Network") function network(): (String);
    @:native("String") function string(): (String);

}