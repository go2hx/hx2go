package go.net;

/**
    Package mail implements parsing of mail messages.
    
    For the most part, this package follows the syntax as specified by RFC 5322 and
    extended by RFC 6532.
    Notable divergences:
      - Obsolete address formats are not parsed, including addresses with
        embedded route information.
      - The full range of spacing (the CFWS syntax element) is not supported,
        such as breaking addresses across lines.
      - No unicode normalization is performed.
      - A leading From line is permitted, as in mbox format (RFC 4155).
**/
@:go.Type({ name: "mail", instanceName: "mail.mail", imports: ["net/mail"] })
extern class Mail {

    /**
        ParseAddress parses a single RFC 5322 address, e.g. "Barry Gibbs <bg@example.com>"
    **/
    @:native("ParseAddress") static function parseAddress(address: String): (go.Result<go.Pointer<go.net.mail.Address>>);
    /**
        ParseAddressList parses the given string as a list of addresses.
    **/
    @:native("ParseAddressList") static function parseAddressList(list: String): (go.Result<go.Slice<go.Pointer<go.net.mail.Address>>>);
    /**
        ParseDate parses an RFC 5322 date string.
    **/
    @:native("ParseDate") static function parseDate(date: String): (go.Result<go.time.Time>);
    /**
        ReadMessage reads a message from r.
        The headers are parsed, and the body of the message will be available
        for reading from msg.Body.
    **/
    @:native("ReadMessage") static function readMessage(r: go.io.Reader): (go.Result<go.Pointer<go.net.mail.Message>>);

}