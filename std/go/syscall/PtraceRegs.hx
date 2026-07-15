package go.syscall;

@:structInit
@:go.Type({ name: "PtraceRegs", instanceName: "syscall.PtraceRegs", imports: ["syscall"] })
extern class PtraceRegs {

    @:native("R15") var R15: go.UInt64;
    @:native("R14") var R14: go.UInt64;
    @:native("R13") var R13: go.UInt64;
    @:native("R12") var R12: go.UInt64;
    @:native("Rbp") var rbp: go.UInt64;
    @:native("Rbx") var rbx: go.UInt64;
    @:native("R11") var R11: go.UInt64;
    @:native("R10") var R10: go.UInt64;
    @:native("R9") var R9: go.UInt64;
    @:native("R8") var R8: go.UInt64;
    @:native("Rax") var rax: go.UInt64;
    @:native("Rcx") var rcx: go.UInt64;
    @:native("Rdx") var rdx: go.UInt64;
    @:native("Rsi") var rsi: go.UInt64;
    @:native("Rdi") var rdi: go.UInt64;
    @:native("Orig_rax") var orig_rax: go.UInt64;
    @:native("Rip") var rip: go.UInt64;
    @:native("Cs") var cs: go.UInt64;
    @:native("Eflags") var eflags: go.UInt64;
    @:native("Rsp") var rsp: go.UInt64;
    @:native("Ss") var ss: go.UInt64;
    @:native("Fs_base") var fs_base: go.UInt64;
    @:native("Gs_base") var gs_base: go.UInt64;
    @:native("Ds") var ds: go.UInt64;
    @:native("Es") var es: go.UInt64;
    @:native("Fs") var fs: go.UInt64;
    @:native("Gs") var gs: go.UInt64;

function new(R15: go.UInt64, R14: go.UInt64, R13: go.UInt64, R12: go.UInt64, rbp: go.UInt64, rbx: go.UInt64, R11: go.UInt64, R10: go.UInt64, R9: go.UInt64, R8: go.UInt64, rax: go.UInt64, rcx: go.UInt64, rdx: go.UInt64, rsi: go.UInt64, rdi: go.UInt64, orig_rax: go.UInt64, rip: go.UInt64, cs: go.UInt64, eflags: go.UInt64, rsp: go.UInt64, ss: go.UInt64, fs_base: go.UInt64, gs_base: go.UInt64, ds: go.UInt64, es: go.UInt64, fs: go.UInt64, gs: go.UInt64);

    @:native("PC") function PC(): go.UInt64;
    @:native("SetPC") function setPC(pc: go.UInt64): Void;

}