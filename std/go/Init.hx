package go;
#if (macro && !go)
import haxe.macro.PlatformConfig;
import haxe.macro.Compiler;
import haxe.macro.Context;
import haxe.Timer; 
class Init {
    public static function init() {
        var whatever = {
			pack: [],
			name: "Dynamic"
		}
		var newConfig:PlatformConfig = {
			staticTypeSystem: true,
			sys: true,
			capturePolicy: None,
			padNulls: true,
			addFinalReturn: true,
			overloadFunctions: true,
			reservedTypePaths: [],
			supportsFunctionEquality: true,
			usesUtf16: false,
			thisBeforeSuper: false,
            // runtime.LockOSThread()
            // defer runtime.UnlockOSThread()
			supportsThreads: true,
			supportsUnicode: true,
			supportsRestArgs: true,
			exceptions: {
				nativeThrows: [whatever],
				nativeCatches: [whatever],
				avoidWrapping: true,
				wildcardCatch: whatever,
				baseThrow: whatever,
			},
			scoping: {
				scope: BlockScope,
				flags: [],
			},
			supportsAtomics: true
		}
		Compiler.setPlatformConfiguration(newConfig);
		afterBuild();
    }
	public static function afterBuild() {
        final stamp = Timer.stamp();
        final runGoDefine = Context.definedValue("run-go");
		final buildGoDefine = Context.definedValue("build-go");
        Context.onAfterGenerate(() -> {
            // spin up hx2go to read dump
            final mainClass = Compiler.getConfiguration().mainClass;
            final tmpMainSubPaths = [mainClass.name];
            if (mainClass.sub != null)
                tmpMainSubPaths.push(mainClass.sub);
            final mainString = mainClass.pack.concat(tmpMainSubPaths).join(".");
            final outputString = Compiler.getOutput();
            std.Sys.println("Haxe compilation time: " + (Timer.stamp() - stamp));
            var command = "haxe compile.hxml -D hx2go-main=\"" + mainString + "\" -D output=" + outputString;
            if (runGoDefine != null) {
                command += " -D run-go";
            }
			 if (buildGoDefine != null) {
                command += " -D build-go";
            }
            std.Sys.command(command);
        });
    }
}
#end