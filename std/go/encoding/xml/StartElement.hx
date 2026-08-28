package go.encoding.xml;

/**
    A StartElement represents an XML start element.
**/
@:structInit
@:go.Type({ name: "StartElement", instanceName: "xml.StartElement", imports: ["encoding/xml"] })
extern class StartElement {

    @:native("Name") var name: go.encoding.xml.Name;
    @:native("Attr") var attr: go.Slice<go.encoding.xml.Attr>;

    function new(name: go.encoding.xml.Name, attr: go.Slice<go.encoding.xml.Attr>=null);

    /**
        Copy creates a new copy of StartElement.
    **/
    @:native("Copy") function copy(): (go.encoding.xml.StartElement);
    /**
        End returns the corresponding XML end element.
    **/
    @:native("End") function end(): (go.encoding.xml.EndElement);

}