package go.encoding.xml;

/**
    A Name represents an XML name (Local) annotated
    with a name space identifier (Space).
    In tokens returned by [Decoder.Token], the Space identifier
    is given as a canonical URL, not the short prefix used
    in the document being parsed.
**/
@:structInit
@:go.Type({ name: "Name", instanceName: "xml.Name", imports: ["encoding/xml"] })
extern class Name {

    @:native("Space") var space: String;
    @:native("Local") var local: String;

    function new(space: String="", local: String="");

}