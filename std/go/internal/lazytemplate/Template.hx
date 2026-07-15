package go.internal.lazytemplate;

@:structInit
@:go.Type({ name: "Template", instanceName: "lazytemplate.Template", imports: ["internal/lazytemplate"] })
extern class Template {

    @:native("Execute") function execute(w: go.io.Writer, data: Dynamic): go.Error;

}