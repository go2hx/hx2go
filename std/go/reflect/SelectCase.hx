package go.reflect;

/**
    A SelectCase describes a single case in a select operation.
    The kind of case depends on Dir, the communication direction.
    
    If Dir is SelectDefault, the case represents a default case.
    Chan and Send must be zero Values.
    
    If Dir is SelectSend, the case represents a send operation.
    Normally Chan's underlying value must be a channel, and Send's underlying value must be
    assignable to the channel's element type. As a special case, if Chan is a zero Value,
    then the case is ignored, and the field Send will also be ignored and may be either zero
    or non-zero.
    
    If Dir is [SelectRecv], the case represents a receive operation.
    Normally Chan's underlying value must be a channel and Send must be a zero Value.
    If Chan is a zero Value, then the case is ignored, but Send must still be a zero Value.
    When a receive operation is selected, the received Value is returned by Select.
**/
@:structInit
@:go.Type({ name: "SelectCase", instanceName: "reflect.SelectCase", imports: ["reflect"] })
extern class SelectCase {

    @:native("Dir") var dir: go.reflect.SelectDir;
    @:native("Chan") var chan: go.reflect.Value;
    @:native("Send") var send: go.reflect.Value;

    function new(dir: go.reflect.SelectDir=cast 0, chan: go.reflect.Value, send: go.reflect.Value);

}