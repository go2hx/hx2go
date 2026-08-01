package go.net.rpc;

@:structInit
@:go.Type({ name: "methodType", instanceName: "rpc.methodType", imports: ["net/rpc"] })
extern class MethodType {

    @:native("Mutex") var mutex: go.sync.Mutex;
    @:native("ArgType") var argType: go.reflect.Type;
    @:native("ReplyType") var replyType: go.reflect.Type;

    function new(mutex: go.sync.Mutex, argType: go.reflect.Type, replyType: go.reflect.Type);

    @:native("Lock") function lock(): Void;
    @:native("NumCalls") function numCalls(): (go.GoUInt);
    @:native("TryLock") function tryLock(): (Bool);
    @:native("Unlock") function unlock(): Void;

}