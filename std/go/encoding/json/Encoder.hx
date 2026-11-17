package go.encoding.json;

/**
    An Encoder writes JSON values to an output stream.
**/
@:structInit
@:go.Type({ name: "Encoder", instanceName: "json.Encoder", imports: ["encoding/json"] })
extern class Encoder {

    /**
        Encode writes the JSON encoding of v to the stream,
        with insignificant space characters elided,
        followed by a newline character.
        
        See the documentation for [Marshal] for details about the
        conversion of Go values to JSON.
    **/
    @:native("Encode") function encode(v: Dynamic): (go.Error);
    /**
        SetEscapeHTML specifies whether problematic HTML characters
        should be escaped inside JSON quoted strings.
        The default behavior is to escape &, <, and > to \u0026, \u003c, and \u003e
        to avoid certain safety problems that can arise when embedding JSON in HTML.
        
        In non-HTML settings where the escaping interferes with the readability
        of the output, SetEscapeHTML(false) disables this behavior.
    **/
    @:native("SetEscapeHTML") function setEscapeHTML(on: Bool): Void;
    /**
        SetIndent instructs the encoder to format each subsequent encoded
        value as if indented by the package-level function Indent(dst, src, prefix, indent).
        Calling SetIndent("", "") disables indentation.
    **/
    @:native("SetIndent") function setIndent(prefix: String, indent: String): Void;

}