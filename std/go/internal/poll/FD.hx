package go.internal.poll;

@:structInit
@:go.Type({ name: "FD", instanceName: "poll.FD", imports: ["internal/poll"] })
extern class FD {

    @:native("Sysfd") var sysfd: go.GoInt;
    @:native("SysFile") var sysFile: go.internal.poll.SysFile;
    @:native("IsStream") var isStream: Bool;
    @:native("ZeroReadIsEOF") var zeroReadIsEOF: Bool;

function new(sysfd: go.GoInt, sysFile: go.internal.poll.SysFile, isStream: Bool, zeroReadIsEOF: Bool);

    @:go.Tuple("p0", "p1", "p2", "p3") @:native("Accept") function accept(): go.Tuple<{ p0: go.GoInt, p1: go.syscall.Sockaddr, p2: String, p3: go.Error }>;
    @:native("Close") function close(): go.Error;
    @:go.Tuple("p0", "p1", "p2") @:native("Dup") function dup(): go.Tuple<{ p0: go.GoInt, p1: String, p2: go.Error }>;
    @:native("Fchdir") function fchdir(): go.Error;
    @:native("Fchmod") function fchmod(mode: go.UInt32): go.Error;
    @:native("Fchown") function fchown(uid: go.GoInt, gid: go.GoInt): go.Error;
    @:native("Fstat") function fstat(s: go.Pointer<go.syscall.Stat_t>): go.Error;
    @:native("Fstatat") function fstatat(name: String, s: go.Pointer<go.syscall.Stat_t>, flags: go.GoInt): go.Error;
    @:native("Fsync") function fsync(): go.Error;
    @:native("Ftruncate") function ftruncate(size: go.Int64): go.Error;
    @:native("GetsockoptInt") function getsockoptInt(level: go.GoInt, name: go.GoInt): go.Result<go.GoInt>;
    @:native("Init") function init(net: String, pollable: Bool): go.Error;
    @:native("Pread") function pread(p: go.Slice<go.Byte>, off: go.Int64): go.Result<go.GoInt>;
    @:native("Pwrite") function pwrite(p: go.Slice<go.Byte>, off: go.Int64): go.Result<go.GoInt>;
    @:native("RawControl") function rawControl(f: (p0: go.UIntPtr) -> Void): go.Error;
    @:native("RawRead") function rawRead(f: (p0: go.UIntPtr) -> Bool): go.Error;
    @:native("RawWrite") function rawWrite(f: (p0: go.UIntPtr) -> Bool): go.Error;
    @:native("Read") function read(p: go.Slice<go.Byte>): go.Result<go.GoInt>;
    @:native("ReadDirent") function readDirent(buf: go.Slice<go.Byte>): go.Result<go.GoInt>;
    @:go.Tuple("p0", "p1", "p2") @:native("ReadFrom") function readFrom(p: go.Slice<go.Byte>): go.Tuple<{ p0: go.GoInt, p1: go.syscall.Sockaddr, p2: go.Error }>;
    @:native("ReadFromInet4") function readFromInet4(p: go.Slice<go.Byte>, _from: go.Pointer<go.syscall.SockaddrInet4>): go.Result<go.GoInt>;
    @:native("ReadFromInet6") function readFromInet6(p: go.Slice<go.Byte>, _from: go.Pointer<go.syscall.SockaddrInet6>): go.Result<go.GoInt>;
    @:go.Tuple("p0", "p1", "p2", "p3", "p4") @:native("ReadMsg") function readMsg(p: go.Slice<go.Byte>, oob: go.Slice<go.Byte>, flags: go.GoInt): go.Tuple<{ p0: go.GoInt, p1: go.GoInt, p2: go.GoInt, p3: go.syscall.Sockaddr, p4: go.Error }>;
    @:go.Tuple("p0", "p1", "p2", "p3") @:native("ReadMsgInet4") function readMsgInet4(p: go.Slice<go.Byte>, oob: go.Slice<go.Byte>, flags: go.GoInt, sa4: go.Pointer<go.syscall.SockaddrInet4>): go.Tuple<{ p0: go.GoInt, p1: go.GoInt, p2: go.GoInt, p3: go.Error }>;
    @:go.Tuple("p0", "p1", "p2", "p3") @:native("ReadMsgInet6") function readMsgInet6(p: go.Slice<go.Byte>, oob: go.Slice<go.Byte>, flags: go.GoInt, sa6: go.Pointer<go.syscall.SockaddrInet6>): go.Tuple<{ p0: go.GoInt, p1: go.GoInt, p2: go.GoInt, p3: go.Error }>;
    @:native("Seek") function seek(offset: go.Int64, whence: go.GoInt): go.Result<go.Int64>;
    @:native("SetBlocking") function setBlocking(): go.Error;
    @:native("SetDeadline") function setDeadline(t: go.time.Time): go.Error;
    @:native("SetReadDeadline") function setReadDeadline(t: go.time.Time): go.Error;
    @:native("SetWriteDeadline") function setWriteDeadline(t: go.time.Time): go.Error;
    @:native("SetsockoptByte") function setsockoptByte(level: go.GoInt, name: go.GoInt, arg: go.Byte): go.Error;
    @:native("SetsockoptIPMreq") function setsockoptIPMreq(level: go.GoInt, name: go.GoInt, mreq: go.Pointer<go.syscall.IPMreq>): go.Error;
    @:native("SetsockoptIPMreqn") function setsockoptIPMreqn(level: go.GoInt, name: go.GoInt, mreq: go.Pointer<go.syscall.IPMreqn>): go.Error;
    @:native("SetsockoptIPv6Mreq") function setsockoptIPv6Mreq(level: go.GoInt, name: go.GoInt, mreq: go.Pointer<go.syscall.IPv6Mreq>): go.Error;
    @:native("SetsockoptInet4Addr") function setsockoptInet4Addr(level: go.GoInt, name: go.GoInt, arg: go.GoArray<go.Byte, 4>): go.Error;
    @:native("SetsockoptInt") function setsockoptInt(level: go.GoInt, name: go.GoInt, arg: go.GoInt): go.Error;
    @:native("SetsockoptLinger") function setsockoptLinger(level: go.GoInt, name: go.GoInt, l: go.Pointer<go.syscall.Linger>): go.Error;
    @:native("Shutdown") function shutdown(how: go.GoInt): go.Error;
    @:native("WaitWrite") function waitWrite(): go.Error;
    @:native("Write") function write(p: go.Slice<go.Byte>): go.Result<go.GoInt>;
    @:go.Tuple("p0", "p1", "p2") @:native("WriteMsg") function writeMsg(p: go.Slice<go.Byte>, oob: go.Slice<go.Byte>, sa: go.syscall.Sockaddr): go.Tuple<{ p0: go.GoInt, p1: go.GoInt, p2: go.Error }>;
    @:go.Tuple("p0", "p1", "p2") @:native("WriteMsgInet4") function writeMsgInet4(p: go.Slice<go.Byte>, oob: go.Slice<go.Byte>, sa: go.Pointer<go.syscall.SockaddrInet4>): go.Tuple<{ p0: go.GoInt, p1: go.GoInt, p2: go.Error }>;
    @:go.Tuple("p0", "p1", "p2") @:native("WriteMsgInet6") function writeMsgInet6(p: go.Slice<go.Byte>, oob: go.Slice<go.Byte>, sa: go.Pointer<go.syscall.SockaddrInet6>): go.Tuple<{ p0: go.GoInt, p1: go.GoInt, p2: go.Error }>;
    @:native("WriteOnce") function writeOnce(p: go.Slice<go.Byte>): go.Result<go.GoInt>;
    @:native("WriteTo") function writeTo(p: go.Slice<go.Byte>, sa: go.syscall.Sockaddr): go.Result<go.GoInt>;
    @:native("WriteToInet4") function writeToInet4(p: go.Slice<go.Byte>, sa: go.Pointer<go.syscall.SockaddrInet4>): go.Result<go.GoInt>;
    @:native("WriteToInet6") function writeToInet6(p: go.Slice<go.Byte>, sa: go.Pointer<go.syscall.SockaddrInet6>): go.Result<go.GoInt>;
    @:native("Writev") function writev(v: go.Pointer<go.Slice<go.Slice<go.Byte>>>): go.Result<go.Int64>;

}