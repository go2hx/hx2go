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
      if (mainDefine == "")
         throw "mainDefine not defined from -D hx2go-main";
      return {
         runAfterCompilation: runGoDefine,
         buildAfterCompilation: buildGoDefine,
         entryPoint: mainDefine,
         output: outputDefine,
      };
   }
}
