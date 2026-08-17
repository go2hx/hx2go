package go.haxe;

import go.Os;
import go.Runtime;
import go.runtime.Pprof;
import go.os.File;
import go.Pointer;

// enabled with -D go-profile
@:keep
@:analyzer(ignore)
class HxProfile {

    static var cpuFile:Null<Pointer<File>> = null;
    static inline var cpuPath = "cpu.pprof";
    static inline var memPath = "mem.pprof";

    public static function start() {
        #if go_profile
        var res = Os.create(cpuPath).tuple();
        if (res.error == null) {
            cpuFile = res.result;
            Pprof.startCPUProfile(res.result);
        }
        #end
    }

    public static function stop() {
        #if go_profile
        if (cpuFile != null) {
            Pprof.stopCPUProfile();
            cpuFile.close();
            cpuFile = null;
        }
        writeHeap("mem");
        Sys.println("");
        Sys.println("created cpu profile    : " + haxe.io.Path.join([Sys.getCwd(), cpuPath]));
        Sys.println("created memory profile    : " + haxe.io.Path.join([Sys.getCwd(), "mem.pprof"]));
        Sys.println("");
        #end
    }

    public static function writeHeap(name:String) {
        var res = Os.create(name + ".pprof").tuple();
        if (res.error == null) {
            Pprof.writeHeapProfile(res.result);
            res.result.close();
        }
    }

}
