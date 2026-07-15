package go.encoding.xml;

@:go.Type({ name: "CharData", instanceName: "xml.CharData", imports: ["encoding/xml"] })
extern class CharData {

    @:native("Copy") function copy(): go.encoding.xml.CharData;

}