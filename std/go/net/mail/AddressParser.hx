package go.net.mail;

@:structInit
@:go.Type({ name: "AddressParser", instanceName: "mail.AddressParser", imports: ["net/mail"] })
extern class AddressParser {

    @:native("WordDecoder") var wordDecoder: go.Pointer<go.mime.WordDecoder>;

function new(wordDecoder: go.Pointer<go.mime.WordDecoder>);

    @:native("Parse") function parse(address: String): go.Result<go.Pointer<go.net.mail.Address>>;
    @:native("ParseList") function parseList(list: String): go.Result<go.Slice<go.Pointer<go.net.mail.Address>>>;

}