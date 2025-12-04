import sys.io.File;

function main() {
   #if dump_expr
   new parser.dump.ExprParser().parse(File.getContent("dump.txt").split("\n"));
   #else
   final cl = new parser.dump.RecordParser(File.getContent("dump/AfterDce/cross/Test.dump")).run();
   trace(new haxe.macro.Printer().printExpr(cl.cl_ordered_statics[0].cf_expr));
   #end
}