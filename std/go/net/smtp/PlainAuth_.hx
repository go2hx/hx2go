package go.net.smtp;

@:structInit
@:go.Type({ name: "plainAuth", instanceName: "smtp.plainAuth", imports: ["net/smtp"] })
extern class PlainAuth_ {

    @:native("Next") function next(fromServer: go.Slice<go.Byte>, more: Bool): (go.Result<go.Slice<go.Byte>>);
    @:go.Tuple("p0", "p1", "p2") @:native("Start") function start(server: go.Pointer<go.net.smtp.ServerInfo>): (go.Tuple<{ p0: String, p1: go.Slice<go.Byte>, p2: go.Error }>);

}