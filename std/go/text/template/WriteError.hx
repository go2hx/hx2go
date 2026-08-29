package go.text.template;

@:structInit
@:go.Type({ name: "writeError", instanceName: "template.writeError", imports: ["text/template"] })
extern class WriteError {

    @:native("Err") var err: go.Error;

    function new(err: go.Error=null);

}