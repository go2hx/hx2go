package go.internal.poll;

@:structInit
@:go.Type({ name: "DeadlineExceededError", instanceName: "poll.DeadlineExceededError", imports: ["internal/poll"] })
extern class DeadlineExceededError {

    @:native("Error") function error(): String;
    @:native("Temporary") function temporary(): Bool;
    @:native("Timeout") function timeout(): Bool;

}