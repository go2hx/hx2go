package go.encoding.xml;

/**
    An Encoder writes XML data to an output stream.
**/
@:structInit
@:go.Type({ name: "Encoder", instanceName: "xml.Encoder", imports: ["encoding/xml"] })
extern class Encoder {

    /**
        Close the Encoder, indicating that no more data will be written. It flushes
        any buffered XML to the underlying writer and returns an error if the
        written XML is invalid (e.g. by containing unclosed elements).
    **/
    @:native("Close") function close(): (go.Error);
    /**
        Encode writes the XML encoding of v to the stream.
        
        See the documentation for [Marshal] for details about the conversion
        of Go values to XML.
        
        Encode calls [Encoder.Flush] before returning.
    **/
    @:native("Encode") function encode(v: Dynamic): (go.Error);
    /**
        EncodeElement writes the XML encoding of v to the stream,
        using start as the outermost tag in the encoding.
        
        See the documentation for [Marshal] for details about the conversion
        of Go values to XML.
        
        EncodeElement calls [Encoder.Flush] before returning.
    **/
    @:native("EncodeElement") function encodeElement(v: Dynamic, start: go.encoding.xml.StartElement): (go.Error);
    /**
        EncodeToken writes the given XML token to the stream.
        It returns an error if [StartElement] and [EndElement] tokens are not properly matched.
        
        EncodeToken does not call [Encoder.Flush], because usually it is part of a larger operation
        such as [Encoder.Encode] or [Encoder.EncodeElement] (or a custom [Marshaler]'s MarshalXML invoked
        during those), and those will call Flush when finished.
        Callers that create an Encoder and then invoke EncodeToken directly, without
        using Encode or EncodeElement, need to call Flush when finished to ensure
        that the XML is written to the underlying writer.
        
        EncodeToken allows writing a [ProcInst] with Target set to "xml" only as the first token
        in the stream.
    **/
    @:native("EncodeToken") function encodeToken(t: go.encoding.xml.Token): (go.Error);
    /**
        Flush flushes any buffered XML to the underlying writer.
        See the [Encoder.EncodeToken] documentation for details about when it is necessary.
    **/
    @:native("Flush") function flush(): (go.Error);
    /**
        Indent sets the encoder to generate XML in which each element
        begins on a new indented line that starts with prefix and is followed by
        one or more copies of indent according to the nesting depth.
    **/
    @:native("Indent") function indent(prefix: String, indent: String): Void;

}