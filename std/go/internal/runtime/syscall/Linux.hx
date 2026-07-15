package go.internal.runtime.syscall;

@:go.Type({ name: "linux", instanceName: "linux.linux", imports: ["internal/runtime/syscall/linux"] })
extern class Linux {

    @:native("AT_FDCWD") static var AT_FDCWD: go.GoInt;
    @:native("EFD_CLOEXEC") static var EFD_CLOEXEC: go.GoInt;
    @:native("EFD_NONBLOCK") static var EFD_NONBLOCK: go.GoInt;
    @:native("ENOENT") static var ENOENT: go.GoInt;
    @:native("EPOLLERR") static var EPOLLERR: go.GoInt;
    @:native("EPOLLET") static var EPOLLET: go.GoInt;
    @:native("EPOLLHUP") static var EPOLLHUP: go.GoInt;
    @:native("EPOLLIN") static var EPOLLIN: go.GoInt;
    @:native("EPOLLOUT") static var EPOLLOUT: go.GoInt;
    @:native("EPOLLRDHUP") static var EPOLLRDHUP: go.GoInt;
    @:native("EPOLL_CLOEXEC") static var EPOLL_CLOEXEC: go.GoInt;
    @:native("EPOLL_CTL_ADD") static var EPOLL_CTL_ADD: go.GoInt;
    @:native("EPOLL_CTL_DEL") static var EPOLL_CTL_DEL: go.GoInt;
    @:native("EPOLL_CTL_MOD") static var EPOLL_CTL_MOD: go.GoInt;
    @:native("O_CLOEXEC") static var O_CLOEXEC: go.GoInt;
    @:native("O_LARGEFILE") static var O_LARGEFILE: go.GoInt;
    @:native("O_RDONLY") static var O_RDONLY: go.GoInt;
    @:native("PR_SET_VMA") static var PR_SET_VMA: go.GoInt;
    @:native("PR_SET_VMA_ANON_NAME") static var PR_SET_VMA_ANON_NAME: go.GoInt;
    @:native("SYS_CLOSE") static var SYS_CLOSE: go.GoInt;
    @:native("SYS_EPOLL_CREATE1") static var SYS_EPOLL_CREATE1: go.GoInt;
    @:native("SYS_EPOLL_CTL") static var SYS_EPOLL_CTL: go.GoInt;
    @:native("SYS_EPOLL_PWAIT") static var SYS_EPOLL_PWAIT: go.GoInt;
    @:native("SYS_EPOLL_PWAIT2") static var SYS_EPOLL_PWAIT2: go.GoInt;
    @:native("SYS_EVENTFD2") static var SYS_EVENTFD2: go.GoInt;
    @:native("SYS_FCNTL") static var SYS_FCNTL: go.GoInt;
    @:native("SYS_MPROTECT") static var SYS_MPROTECT: go.GoInt;
    @:native("SYS_OPENAT") static var SYS_OPENAT: go.GoInt;
    @:native("SYS_PRCTL") static var SYS_PRCTL: go.GoInt;
    @:native("SYS_PREAD64") static var SYS_PREAD64: go.GoInt;
    @:native("SYS_READ") static var SYS_READ: go.GoInt;
    @:native("SYS_UNAME") static var SYS_UNAME: go.GoInt;

    @:native("Close") static function close(fd: go.GoInt): go.UIntPtr;
    @:go.Tuple("fd", "errno") @:native("EpollCreate1") static function epollCreate1(flags: go.Int32): go.Tuple<{ fd: go.Int32, errno: go.UIntPtr }>;
    @:native("EpollCtl") static function epollCtl(epfd: go.Int32, op: go.Int32, fd: go.Int32, event: go.Pointer<go.internal.runtime.syscall.linux.EpollEvent>): go.UIntPtr;
    @:go.Tuple("n", "errno") @:native("EpollWait") static function epollWait(epfd: go.Int32, events: go.Slice<go.internal.runtime.syscall.linux.EpollEvent>, maxev: go.Int32, waitms: go.Int32): go.Tuple<{ n: go.Int32, errno: go.UIntPtr }>;
    @:go.Tuple("fd", "errno") @:native("Eventfd") static function eventfd(initval: go.Int32, flags: go.Int32): go.Tuple<{ fd: go.Int32, errno: go.UIntPtr }>;
    @:go.Tuple("fd", "errno") @:native("Open") static function open(path: go.Pointer<go.Byte>, mode: go.GoInt, perm: go.UInt32): go.Tuple<{ fd: go.GoInt, errno: go.UIntPtr }>;
    @:go.Tuple("n", "errno") @:native("Pread") static function pread(fd: go.GoInt, p: go.Slice<go.Byte>, offset: go.Int64): go.Tuple<{ n: go.GoInt, errno: go.UIntPtr }>;
    @:go.Tuple("n", "errno") @:native("Read") static function read(fd: go.GoInt, p: go.Slice<go.Byte>): go.Tuple<{ n: go.GoInt, errno: go.UIntPtr }>;
    @:go.Tuple("r1", "r2", "errno") @:native("Syscall6") static function syscall6(num: go.UIntPtr, a1: go.UIntPtr, a2: go.UIntPtr, a3: go.UIntPtr, a4: go.UIntPtr, a5: go.UIntPtr, a6: go.UIntPtr): go.Tuple<{ r1: go.UIntPtr, r2: go.UIntPtr, errno: go.UIntPtr }>;
    @:native("Uname") static function uname(buf: go.Pointer<go.internal.runtime.syscall.linux.Utsname>): go.UIntPtr;

}