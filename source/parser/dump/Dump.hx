package parser.dump;

import sys.io.File;
import haxe.io.Path;
import haxe.io.Bytes;
import haxe.macro.Type;
import parser.dump.RecordParser;
import parser.IParser;
import sys.FileSystem;

class Dump implements IParser {

    public function new() {
     
    }
    
    public function run(path:String): ParserInfo {
        // hardset for now, might need to have path show local path where cli was started
        path = "dump/AfterDce/cross/";
        // trace(path);
        final filePaths = parseFolder(path);
        final records = [];
        for (filePath in filePaths) {
            final parser:RecordParser = {_path: filePath, _input: File.getContent(filePath)};
            final record:RecordClass = parser.run();
            records.push(record);
        }
        final modules:Array<Module> = [];
        for (record in records) {
            var foundModule = null;
            for (module in modules) {
                if (module.path == record.cl_module) {
                    foundModule = module;
                    break;
                }
            }
            if (foundModule == null) {
                foundModule = {
                    path: record.cl_module,
                    translator: {}, 
                    transformer: {},
                };
                modules.push(foundModule);
            }
            foundModule.addDef(DefTranslator.run(record));
        }
        return {
            modules: modules,
        };
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