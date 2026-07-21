package hx2go.version;

import haxe.io.Path;
import sys.FileSystem;
import sys.io.File;
import sys.io.Process;

class Version {
    public static function gitVersion() {
        var proc = new Process('git', ['rev-parse', 'HEAD']);
        if (proc.exitCode() != 0) {
            var message = proc.stderr.readAll().toString();
            trace("cannot execute `git rev-arse HEAD` " + message);
            return "";
        }
        return proc.stdout.readLine();
    }

    public static function stale(path:String):Bool {
        #if rebuild
        return true;
        #else
        var v = gitVersion();
        var versionFile = Path.join([path, "version.txt"]);
        if (!FileSystem.exists(versionFile) || v != File.getContent(versionFile)) {
            File.saveContent(versionFile, v);
            return true;
        }else{
            return false;
        }
        #end
    }
}