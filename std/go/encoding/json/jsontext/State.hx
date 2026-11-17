package go.encoding.json.jsontext;

@:structInit
@:go.Type({ name: "state", instanceName: "jsontext.state", imports: ["encoding/json/jsontext"] })
extern class State {

    @:native("Tokens") var tokens: go.encoding.json.jsontext.StateMachine;
    @:native("Names") var names: go.encoding.json.jsontext.ObjectNameStack;
    @:native("Namespaces") var namespaces: go.encoding.json.jsontext.ObjectNamespaceStack;

    function new(tokens: go.encoding.json.jsontext.StateMachine, names: go.encoding.json.jsontext.ObjectNameStack, namespaces: go.encoding.json.jsontext.ObjectNamespaceStack=null);

}