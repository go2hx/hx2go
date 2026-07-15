package go.internal.syscall;

@:go.Type({ name: "unix", instanceName: "unix.unix", imports: ["internal/syscall/unix"] })
extern class Unix {

    @:native("AT_EACCESS") static var AT_EACCESS: go.GoInt;
    @:native("AT_FDCWD") static var AT_FDCWD: go.GoInt;
    @:native("AT_REMOVEDIR") static var AT_REMOVEDIR: go.GoInt;
    @:native("AT_SYMLINK_NOFOLLOW") static var AT_SYMLINK_NOFOLLOW: go.GoInt;
    @:native("GRND_NONBLOCK") static var GRND_NONBLOCK: go.internal.syscall.unix.GetRandomFlag;
    @:native("GRND_RANDOM") static var GRND_RANDOM: go.internal.syscall.unix.GetRandomFlag;
    @:native("NoFollowErrno") static var NoFollowErrno: go.syscall.Errno;
    @:native("O_PATH") static var O_PATH: go.GoInt;
    @:native("P_PID") static var P_PID: go.GoInt;
    @:native("P_PIDFD") static var P_PIDFD: go.GoInt;
    @:native("R_OK") static var R_OK: go.GoInt;
    @:native("UTIME_OMIT") static var UTIME_OMIT: go.GoInt;
    @:native("W_OK") static var W_OK: go.GoInt;
    @:native("X_OK") static var X_OK: go.GoInt;

    @:native("CopyFileRange") static function copyFileRange(rfd: go.GoInt, roff: go.Pointer<go.Int64>, wfd: go.GoInt, woff: go.Pointer<go.Int64>, len: go.GoInt, flags: go.GoInt): go.Result<go.GoInt>;
    @:native("Eaccess") static function eaccess(path: String, mode: go.UInt32): go.Error;
    @:native("Fchmodat") static function fchmodat(dirfd: go.GoInt, path: String, mode: go.UInt32, flags: go.GoInt): go.Error;
    @:native("Fchownat") static function fchownat(dirfd: go.GoInt, path: String, uid: go.GoInt, gid: go.GoInt, flags: go.GoInt): go.Error;
    @:native("Fcntl") static function fcntl(fd: go.GoInt, cmd: go.GoInt, arg: go.GoInt): go.Result<go.GoInt>;
    @:native("Fstatat") static function fstatat(dirfd: go.GoInt, path: String, stat: go.Pointer<go.syscall.Stat_t>, flags: go.GoInt): go.Error;
    @:native("GetRandom") static function getRandom(p: go.Slice<go.Byte>, flags: go.internal.syscall.unix.GetRandomFlag): go.Result<go.GoInt>;
    @:native("HasNonblockFlag") static function hasNonblockFlag(flag: go.GoInt): Bool;
    @:native("IsNonblock") static function isNonblock(fd: go.GoInt): go.Result<Bool>;
    @:go.Tuple("major", "minor") @:native("KernelVersion") static function kernelVersion(): go.Tuple<{ major: go.GoInt, minor: go.GoInt }>;
    @:native("KernelVersionGE") static function kernelVersionGE(x: go.GoInt, y: go.GoInt): Bool;
    @:native("Linkat") static function linkat(olddirfd: go.GoInt, oldpath: String, newdirfd: go.GoInt, newpath: String, flag: go.GoInt): go.Error;
    @:native("Mkdirat") static function mkdirat(dirfd: go.GoInt, path: String, mode: go.UInt32): go.Error;
    @:native("Openat") static function openat(dirfd: go.GoInt, path: String, flags: go.GoInt, perm: go.UInt32): go.Result<go.GoInt>;
    @:native("PidFDOpen") static function pidFDOpen(pid: go.GoInt, flags: go.GoInt): go.Result<go.UIntPtr>;
    @:native("PidFDSendSignal") static function pidFDSendSignal(pidfd: go.UIntPtr, s: go.syscall.Signal): go.Error;
    @:native("Readlinkat") static function readlinkat(dirfd: go.GoInt, path: String, buf: go.Slice<go.Byte>): go.Result<go.GoInt>;
    @:native("RecvfromInet4") static function recvfromInet4(fd: go.GoInt, p: go.Slice<go.Byte>, flags: go.GoInt, _from: go.Pointer<go.syscall.SockaddrInet4>): go.Result<go.GoInt>;
    @:native("RecvfromInet6") static function recvfromInet6(fd: go.GoInt, p: go.Slice<go.Byte>, flags: go.GoInt, _from: go.Pointer<go.syscall.SockaddrInet6>): go.Result<go.GoInt>;
    @:go.Tuple("n", "oobn", "recvflags", "err") @:native("RecvmsgInet4") static function recvmsgInet4(fd: go.GoInt, p: go.Slice<go.Byte>, oob: go.Slice<go.Byte>, flags: go.GoInt, _from: go.Pointer<go.syscall.SockaddrInet4>): go.Tuple<{ n: go.GoInt, oobn: go.GoInt, recvflags: go.GoInt, err: go.Error }>;
    @:go.Tuple("n", "oobn", "recvflags", "err") @:native("RecvmsgInet6") static function recvmsgInet6(fd: go.GoInt, p: go.Slice<go.Byte>, oob: go.Slice<go.Byte>, flags: go.GoInt, _from: go.Pointer<go.syscall.SockaddrInet6>): go.Tuple<{ n: go.GoInt, oobn: go.GoInt, recvflags: go.GoInt, err: go.Error }>;
    @:native("Renameat") static function renameat(olddirfd: go.GoInt, oldpath: String, newdirfd: go.GoInt, newpath: String): go.Error;
    @:native("SendmsgNInet4") static function sendmsgNInet4(fd: go.GoInt, p: go.Slice<go.Byte>, oob: go.Slice<go.Byte>, _to: go.Pointer<go.syscall.SockaddrInet4>, flags: go.GoInt): go.Result<go.GoInt>;
    @:native("SendmsgNInet6") static function sendmsgNInet6(fd: go.GoInt, p: go.Slice<go.Byte>, oob: go.Slice<go.Byte>, _to: go.Pointer<go.syscall.SockaddrInet6>, flags: go.GoInt): go.Result<go.GoInt>;
    @:native("SendtoInet4") static function sendtoInet4(fd: go.GoInt, p: go.Slice<go.Byte>, flags: go.GoInt, _to: go.Pointer<go.syscall.SockaddrInet4>): go.Error;
    @:native("SendtoInet6") static function sendtoInet6(fd: go.GoInt, p: go.Slice<go.Byte>, flags: go.GoInt, _to: go.Pointer<go.syscall.SockaddrInet6>): go.Error;
    @:native("Symlinkat") static function symlinkat(oldpath: String, newdirfd: go.GoInt, newpath: String): go.Error;
    @:native("Tcsetpgrp") static function tcsetpgrp(fd: go.GoInt, pgid: go.Int32): go.Error;
    @:native("Unlinkat") static function unlinkat(dirfd: go.GoInt, path: String, flags: go.GoInt): go.Error;
    @:native("Utimensat") static function utimensat(dirfd: go.GoInt, path: String, times: go.Pointer<go.GoArray<go.syscall.Timespec, 2>>, flag: go.GoInt): go.Error;
    @:native("Waitid") static function waitid(idType: go.GoInt, id: go.GoInt, info: go.Pointer<go.internal.syscall.unix.SiginfoChild>, options: go.GoInt, rusage: go.Pointer<go.syscall.Rusage>): go.Error;

}