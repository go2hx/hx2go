package go.encoding.json.jsontext;

@:structInit
@:go.Type({ name: "exporter", instanceName: "jsontext.exporter", imports: ["encoding/json/jsontext"] })
extern class Exporter {

    @:native("Export") function export(p: go.Pointer<Dynamic>): (go.encoding.json.jsontext.Export);

}