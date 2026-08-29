package go.encoding.xml;

/**
    A Directive represents an XML directive of the form <!text>.
    The bytes do not include the <! and > markers.
**/
@:go.Type({ name: "Directive", instanceName: "xml.Directive", imports: ["encoding/xml"] })
extern class Directive {

    /**
        Copy creates a new copy of Directive.
    **/
    @:native("Copy") function copy(): (go.encoding.xml.Directive);

}