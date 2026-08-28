package go.net.mail;

/**
    An AddressParser is an RFC 5322 address parser.
**/
@:structInit
@:go.Type({ name: "AddressParser", instanceName: "mail.AddressParser", imports: ["net/mail"] })
extern class AddressParser {

    @:native("WordDecoder") var wordDecoder: go.Pointer<go.mime.WordDecoder>;

    function new(wordDecoder: go.Pointer<go.mime.WordDecoder>=null);

    /**
        Parse parses a single RFC 5322 address of the
        form "Gogh Fir <gf@example.com>" or "foo@example.com".
    **/
    @:native("Parse") function parse(address: String): (go.Result<go.Pointer<go.net.mail.Address>>);
    /**
        ParseList parses the given string as a list of comma-separated addresses
        of the form "Gogh Fir <gf@example.com>" or "foo@example.com".
    **/
    @:native("ParseList") function parseList(list: String): (go.Result<go.Slice<go.Pointer<go.net.mail.Address>>>);

}