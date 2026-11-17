package go.encoding.json.v2;

@:go.Type({ name: "coder", instanceName: "json.coder", imports: ["encoding/json/v2"] })
extern typedef Coder = {

    @:native("Options") function options(): (go.encoding.json.v2.Options);
    @:native("StackPointer") function stackPointer(): (go.encoding.json.jsontext.Pointer);

}