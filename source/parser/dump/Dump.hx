package parser.dump;

using StringTools;

import sys.io.File;
import haxe.io.Path;
import haxe.io.Bytes;
import haxe.macro.Type;
import parser.dump.RecordParser;
import parser.IParser;
import sys.FileSystem;

class Dump implements IParser {

    private var _context: Context;

    public function new(context: Context) {
        _context = context;
    }

    public function run(path: String): Void {
        // hardset for now, might need to have path show local path where cli was started
        path = "dump/AfterDce/go/";
        // trace(path);
        final filePaths = parseFolder(path);
        final records = [];
        for (filePath in filePaths) {
            final parser:RecordParser = {dbg_path: filePath, input: Util.normalizeCLRF(File.getContent(filePath))};
            final record = parser.run();
            records.push(record);
        }

        for (record in records) {
            if (record?.module == null) {
                trace("module should not be null");
                continue;
            }

            final cache = _context.getCache();
            final def = RecordTools.recordToHaxeTypeDefinition(record);
            if (!cache.exists(record.module)) {
                var module: Module = {
                    path: record.module,
                    translator: {},
                    transformer: {},
                    preprocessor: {},
                    context: _context,
                };
                cache.set(record.module, module);
                module.addDef(def);
            }else{
                // module already exists, add a new def to it
                cache.get(record.module).addDef(def);
            }
        }
    }

    public function parseFolder(path:String):Array<String> {
        final list = FileSystem.readDirectory(path);
        var filePaths:Array<String> = [];
        for (obj in list) {
            obj = Path.join([path, obj]);
            if (FileSystem.isDirectory(obj)) {
                // recursively parseFolder
                filePaths = filePaths.concat(parseFolder(obj));
                continue;
            }
            filePaths.push(obj);
        }
        // process files
        return filePaths;
    }

}
