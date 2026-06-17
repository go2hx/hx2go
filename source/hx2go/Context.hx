package hx2go;

using StringTools;

import haxe.io.Path;
import sys.FileSystem;
import sys.io.File;
import hx2go.hxb.Typed.HxbTypedExpr;
import hx2go.util.OutputBuffer;
import hx2go.hxb.HxbModuleType;
import hx2go.hxb.tools.TypedExprTools;
import hx2go.hxb.TypePath;

class Context {

    private var types: Map<String, HxbModuleType>;
    private var imports: Map<String, Array<String>>;
    private var outputDirectory: String;
    private var topLevelPackage: String;
    private var passes: Array<ICompilerPass>;
    private var writer: Writer;

    public function new(outputDirectory: String) {
        this.types = [];
        this.imports = [];
        this.outputDirectory = outputDirectory;
        this.topLevelPackage = Path.normalize(outputDirectory).split("/").pop();
        this.passes = createPasses();
        this.writer = new Writer(this);
    }

    private function createPasses(): Array<ICompilerPass> {
        return [
            new hx2go.passes.BinopTypeNormaliser(this),
            new hx2go.passes.RewriteExternAccess(this),
        ];
    }

    private function getPath(type: HxbModuleType, modulePath: Bool = false): String {
        var p = switch type {
            case MClass(v): v.path;
            case MEnum(v): v.path;
            case MAbstract(v): v.path;
            case MTypedef(v): v.path;
        };

        return modulePath ? p.moduleDotPath() : p.dotPath();
    }

    public function add(type: HxbModuleType) {
        types.set(getPath(type), type);
    }

    public function build(): Void {
        var typesByModule: Map<String, Array<{ type: HxbModuleType, name: String, module: String }>> = [];

        for (t in types) {
            var infos = switch t {
                case MClass(p): {
                    module: p.path.moduleDotPath(),
                    name: p.path.name
                };

                case _: continue;
            }

            transformType(t);

            if (!typesByModule.exists(infos.module)) {
                typesByModule.set(infos.module, []);
            }

            if (infos.module.startsWith("hx2go")) {
                continue;
            }

            typesByModule[infos.module].push({ type: t, name: infos.name, module: infos.module });
        }

        for (module in typesByModule) {
            if (module.length == 0) {
                continue;
            }

            var buf = new OutputBuffer();

            var path = module[0].module.split('.');
            var name = path.pop();
            var imports = imports.get(getPath(module[0].type, true)) ?? [];

            buf.add('package ${path[path.length - 1] ?? topLevelPackage}');

            if (imports.length > 0) {
                buf.add("");
            }

            for (imp in imports) {
                buf.add('import "$imp"');
            }

            if (imports.length > 0) {
                buf.add("");
            }

            for (entry in module) {
                buf.addBuffer(writer.types.writeModuleTypeDecl(entry.type));
            }

            writeFile(path.join("/"), name, buf.toString());
        }
    }

    public function resolve(tp: TypePath): HxbModuleType {
        return tp != null ? types.get(tp.dotPath()) : null;
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

    private function transformType(type: HxbModuleType): Void {
        var exprs: Array<HxbTypedExpr> = [];

        switch type {
            case MClass(def):
                appendTo(def.fields.map(f -> f.expr?.expr).filter(f -> f != null), exprs);
                appendTo(def.statics.map(f -> f.expr?.expr).filter(f -> f != null), exprs);

                if (def.constructor?.expr != null) {
                    exprs.push(def.constructor.expr?.expr);
                }

            case _: null;
        }

        for (e in exprs) {
            if (e == null) return;
            e.t = null;
        }

        for (e in exprs) {
            if (e == null) continue;

            var pending: Map<ICompilerPass, Array<HxbTypedExpr>> = [];
            var match: HxbTypedExpr -> Void;

            for (p in passes) {
                pending[p] = [];
            }

            match = e -> {
                for (p in passes) {
                    if (!p.match(e)) continue;
                    pending[p].push(e);
                }

                TypedExprTools.iter(e, match);
            };

            match(e);

            for (p in passes) {
                for (e in pending[p]) {
                    p.execute(e, type);
                }
            }
        }
    }

    public function defineImport(module: HxbModuleType, goImport: String): Void {
        var path = getPath(module, true);
        if (!imports.exists(path)) {
            imports.set(path, []);
        }

        var imports = imports[path];
        if (!imports.contains(goImport)) {
            imports.push(goImport);
        }
    }

    private function appendTo<T>(from: Array<T>, to: Array<T>): Void {
        for (x in from) {
            to.push(x);
        }
    }

}
