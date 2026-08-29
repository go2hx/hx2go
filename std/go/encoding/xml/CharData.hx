package go.encoding.xml;

/**
    A CharData represents XML character data (raw text),
    in which XML escape sequences have been replaced by
    the characters they represent.
**/
@:go.Type({ name: "CharData", instanceName: "xml.CharData", imports: ["encoding/xml"] })
extern class CharData {

    /**
        Copy creates a new copy of CharData.
    **/
    @:native("Copy") function copy(): (go.encoding.xml.CharData);

}