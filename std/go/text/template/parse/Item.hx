package go.text.template.parse;

@:structInit
@:go.Type({ name: "item", instanceName: "parse.item", imports: ["text/template/parse"] })
extern class Item {

    @:native("String") function string(): (String);

}