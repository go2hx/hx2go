package go.net.mail;

/**
    Address represents a single mail address.
    An address such as "Barry Gibbs <bg@example.com>" is represented
    as Address{Name: "Barry Gibbs", Address: "bg@example.com"}.
**/
@:structInit
@:go.Type({ name: "Address", instanceName: "mail.Address", imports: ["net/mail"] })
extern class Address {

    @:native("Name") var name: String;
    @:native("Address") var address: String;

    function new(name: String="", address: String="");

    /**
        String formats the address as a valid RFC 5322 address.
        If the address's name contains non-ASCII characters
        the name will be rendered according to RFC 2047.
    **/
    @:native("String") function string(): (String);

}