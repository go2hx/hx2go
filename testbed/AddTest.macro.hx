import haxe.macro.Context;
import sys.io.File;
import sys.FileSystem;
import haxe.macro.Compiler;

function init() {
    var testName = Context.getDefines()["test"];
    if (testName == null || testName == "")
        return;
    var path = "tests/unit/" + testName + ".hx";
    if (FileSystem.exists(path)) {
        return;
    }

    File.saveContent(path, 'package unit;\n' + File.getContent("testbed/Main.hx"));
}