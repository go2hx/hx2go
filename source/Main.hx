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
      final mainDefine = HaxeCompiler.getDefine("hx2go-main") ?? "";
      if (mainDefine == "")
         throw "mainDefine not defined from -D hx2go-main";
      return {
         runAfterCompilation: runGoDefine,
         entryPoint: mainDefine,
      };
   }
}