package go.net.mail;

@:structInit
@:go.Type({ name: "Address", instanceName: "mail.Address", imports: ["net/mail"] })
extern class Address {

    @:native("Name") var name: String;
    @:native("Address") var address: String;

function new(name: String, address: String);

    @:native("String") function string(): String;

}