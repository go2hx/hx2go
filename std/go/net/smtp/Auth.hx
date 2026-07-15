package go.net.smtp;

@:go.Type({ name: "Auth", instanceName: "smtp.Auth", imports: ["net/smtp"] })
extern typedef Auth = {

    @:native("Next") function next(fromServer: go.Slice<go.Byte>, more: Bool): go.Result<go.Slice<go.Byte>>;
    @:go.Tuple("proto", "toServer", "err") @:native("Start") function start(server: go.Pointer<go.net.smtp.ServerInfo>): go.Tuple<{ proto: String, toServer: go.Slice<go.Byte>, err: go.Error }>;

}