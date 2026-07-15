package go.net.mail;

@:go.Type({ name: "Header", instanceName: "mail.Header", imports: ["net/mail"] })
extern class Header {

    @:native("AddressList") function addressList(key: String): go.Result<go.Slice<go.Pointer<go.net.mail.Address>>>;
    @:native("Date") function date(): go.Result<go.time.Time>;
    @:native("Get") function get(key: String): String;

}