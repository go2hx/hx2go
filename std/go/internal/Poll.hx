package go.internal;

@:go.Type({ name: "poll", instanceName: "poll.poll", imports: ["internal/poll"] })
extern class Poll {

    @:native("Accept4Func") static var Accept4Func: (p0: go.GoInt, p1: go.GoInt) -> go.Tuple<{ p0: go.GoInt, p1: go.syscall.Sockaddr, p2: go.Error }>;
    @:native("AcceptFunc") static var AcceptFunc: (p0: go.GoInt) -> go.Tuple<{ p0: go.GoInt, p1: go.syscall.Sockaddr, p2: go.Error }>;
    @:native("CloseFunc") static var CloseFunc: (p0: go.GoInt) -> go.Error;
    @:native("TestHookDidSendFile") static var TestHookDidSendFile: (dstFD: go.Pointer<go.internal.poll.FD>, src: go.UIntPtr, written: go.Int64, err: go.Error, handled: Bool) -> Void;
    @:native("TestHookDidWritev") static var TestHookDidWritev: (wrote: go.GoInt) -> Void;

    @:go.Tuple("written", "handled", "err") @:native("CopyFileRange") static function copyFileRange(dst: go.Pointer<go.internal.poll.FD>, src: go.Pointer<go.internal.poll.FD>, remain: go.Int64): go.Tuple<{ written: go.Int64, handled: Bool, err: go.Error }>;
    @:go.Tuple("p0", "p1", "p2") @:native("DupCloseOnExec") static function dupCloseOnExec(fd: go.GoInt): go.Tuple<{ p0: go.GoInt, p1: String, p2: go.Error }>;
    @:native("IsPollDescriptor") static function isPollDescriptor(fd: go.UIntPtr): Bool;
    @:go.Tuple("n", "err", "handled") @:native("SendFile") static function sendFile(dstFD: go.Pointer<go.internal.poll.FD>, src: go.UIntPtr, size: go.Int64): go.Tuple<{ n: go.Int64, err: go.Error, handled: Bool }>;
    @:go.Tuple("written", "handled", "err") @:native("Splice") static function splice(dst: go.Pointer<go.internal.poll.FD>, src: go.Pointer<go.internal.poll.FD>, remain: go.Int64): go.Tuple<{ written: go.Int64, handled: Bool, err: go.Error }>;

}