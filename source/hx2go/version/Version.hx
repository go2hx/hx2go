package hx2go.version;

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

    public static function stale():Bool {
        #if rebuild
        return true;
        #else
        var v = gitVersion();
        if (!FileSystem.exists("version.txt") || v != File.getContent("version.txt")) {
            File.saveContent("version.txt", v);
            return true;
        }else{
            return false;
        }
        #end
    }
}