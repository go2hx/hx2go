package go.net.textproto;

@:structInit
@:go.Type({ name: "sequencer", instanceName: "textproto.sequencer", imports: ["net/textproto"] })
extern class Sequencer {

    @:native("End") function end(id: go.GoUInt): Void;
    @:native("Start") function start(id: go.GoUInt): Void;

}