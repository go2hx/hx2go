package hx2go;

import haxe.macro.Context;
import haxe.macro.Type;
import haxe.macro.Compiler;
import haxe.io.Path;
import sys.FileSystem;

class Main {

    public static function main() {
        Context.onGenerate(generate, false);
    }

    public static function generate(types: Array<Type>): Void {
        var relativeOutput = Compiler.getOutput();
        var root = Path.directory(Sys.programPath());
        var absoluteOutput = Path.join([ root, relativeOutput ]);

        if (!FileSystem.exists(absoluteOutput)) {
            FileSystem.createDirectory(absoluteOutput);
        }

        var ctx = new hx2go.Context(absoluteOutput);

        for (t in types) {
            ctx.add(t);
        }

        ctx.build();
    }

}