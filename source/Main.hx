import haxe.macro.Expr.ExprDef;
import haxe.macro.Compiler as HaxeCompiler;
import sys.io.File;
import Context.ContextOptions;

class Main {
   public static function main() {
      final context:Context = {options: loadContextOptions()};
      context.run();
   }

   static function loadContextOptions():ContextOptions {
      final runGoDefine = HaxeCompiler.getDefine("run-go") != null;
      final buildGoDefine = HaxeCompiler.getDefine("build-go") != null;
      final mainDefine = HaxeCompiler.getDefine("hx2go-main") ?? "";
      final outputDefine = HaxeCompiler.getDefine("output");
      final tinyGoDefine = HaxeCompiler.getDefine("tinygo") != null;
      final tinyGoTarget = HaxeCompiler.getDefine("tinygo.target");
      final tinyGoPort = HaxeCompiler.getDefine("tinygo.port");

      if (mainDefine == "")
         throw "mainDefine not defined from -D hx2go-main";

      if (tinyGoDefine && tinyGoTarget == null)
         throw "when using '-D tinygo' you must also define '-D tinygo.target'";

      return {
         runAfterCompilation: runGoDefine,
         buildAfterCompilation: buildGoDefine,
         entryPoint: mainDefine,
         output: outputDefine,
         tinygo: tinyGoDefine,
         tinygoTarget: tinyGoTarget,
         tinygoPort: tinyGoPort
      };
   }
}
