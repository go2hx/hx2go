package go.html.template;

@:structInit
@:go.Type({ name: "context", instanceName: "template.context", imports: ["html/template"] })
extern class Context {

    @:native("String") function string(): (String);

}