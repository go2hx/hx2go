package go.context;

@:structInit
@:go.Type({ name: "deadlineExceededError", instanceName: "context.deadlineExceededError", imports: ["context"] })
extern class DeadlineExceededError {

    @:native("Error") function error(): (String);
    @:native("Temporary") function temporary(): (Bool);
    @:native("Timeout") function timeout(): (Bool);

}