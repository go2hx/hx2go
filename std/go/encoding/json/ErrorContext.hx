package go.encoding.json;

@:structInit
@:go.Type({ name: "errorContext", instanceName: "json.errorContext", imports: ["encoding/json"] })
extern class ErrorContext {

    @:native("Struct") var struct: go.reflect.Type;
    @:native("FieldStack") var fieldStack: go.Slice<String>;

    function new(struct: go.reflect.Type, fieldStack: go.Slice<String>);

}