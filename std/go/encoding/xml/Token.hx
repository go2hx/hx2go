package go.encoding.xml;

/**
    A Token is an interface holding one of the token types:
    [StartElement], [EndElement], [CharData], [Comment], [ProcInst], or [Directive].
**/
@:go.Type({ name: "Token", instanceName: "xml.Token", imports: ["encoding/xml"] })
extern typedef Token = {

}