package go.net;

@:go.Type({ name: "mail", instanceName: "mail.mail", imports: ["net/mail"] })
extern class Mail {

    @:native("ParseAddress") static function parseAddress(address: String): go.Result<go.Pointer<go.net.mail.Address>>;
    @:native("ParseAddressList") static function parseAddressList(list: String): go.Result<go.Slice<go.Pointer<go.net.mail.Address>>>;
    @:native("ParseDate") static function parseDate(date: String): go.Result<go.time.Time>;
    @:native("ReadMessage") static function readMessage(r: go.io.Reader): go.Result<go.Pointer<go.net.mail.Message>>;

}