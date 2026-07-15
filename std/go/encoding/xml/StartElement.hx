package go.encoding.xml;

@:structInit
@:go.Type({ name: "StartElement", instanceName: "xml.StartElement", imports: ["encoding/xml"] })
extern class StartElement {

    @:native("Name") var name: go.encoding.xml.Name;
    @:native("Attr") var attr: go.Slice<go.encoding.xml.Attr>;

function new(name: go.encoding.xml.Name, attr: go.Slice<go.encoding.xml.Attr>);

    @:native("Copy") function copy(): go.encoding.xml.StartElement;
    @:native("End") function end(): go.encoding.xml.EndElement;

}