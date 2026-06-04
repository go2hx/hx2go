package hx2go;

import haxe.macro.Type;
import haxe.io.Path;
import sys.io.File;
import sys.FileSystem;

class Context {

    private var types: Array<Type>;
    private var outputDirectory: String;
    private var topLevelPackage: String;

    public function new(outputDirectory: String) {
        this.types = [];
        this.outputDirectory = outputDirectory;
        this.topLevelPackage = Path.normalize(outputDirectory).split("/").pop();
    }

    public function add(type: Type) {
        types.push(type);
    }

    public function build(): Void {
        var typesByModule: Map<String, Array<{ type: Type, name: String, module: String }>> = [];

        for (t in types) {
            var infos = switch t {
                case TInst(p, _): {
                    module: p.get().module,
                    name: p.get().name
                };

                case _: continue;
            }

            if (!typesByModule.exists(infos.module)) {
                typesByModule.set(infos.module, []);
            }

            typesByModule[infos.module].push({ type: t, name: infos.name, module: infos.module });
        }

        for (module in typesByModule) {
            var buf = new StringBuf();

            var path = module[0].module.split('.');
            var name = path.pop();

            buf.add('package ${path[path.length - 1] ?? topLevelPackage}\n\n');

            for (entry in module) {
                buf.add(
                    '// ${entry.module} -> ${entry.name}' +
                    writeType(entry.type) + '\n\n'
                );
            }

            writeFile(path.join("/"), name, buf.toString());
        }
    }

    private function writeFile(directory: String, fileName: String, content: String): Void {
        var fullPath = Path.join([ outputDirectory, directory, '$fileName.go' ]);
        ensureDirectory(Path.directory(fullPath));

        File.saveContent(fullPath, content);
    }

    private function ensureDirectory(path: String): Void {
        if (path == null || path == "") return;

        var norm = Path.normalize(path);
        var parts = norm.split("/");
        var full = [];

        for (part in parts) {
            full.push(part);

            var p = full.join("/");
            if (!FileSystem.exists(p)) {
                FileSystem.createDirectory(p);
            }
        }
    }

    private function writeType(type: Type): String {
        return "";
    }

}
