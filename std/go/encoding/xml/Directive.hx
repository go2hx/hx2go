package go.encoding.xml;

@:go.Type({ name: "Directive", instanceName: "xml.Directive", imports: ["encoding/xml"] })
extern class Directive {

    @:native("Copy") function copy(): go.encoding.xml.Directive;

}