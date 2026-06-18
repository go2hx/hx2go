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
import hx2go.util.StringConversions;
import hx2go.preprocessor.Preprocessor;
import hx2go.hxb.Typed.HxbModuleTypeRef;

class Context {

    private var types: Map<String, HxbModuleType>;
    private var imports: Map<String, Array<String>>;
    private var outputDirectory: String;
    private var topLevelPackage: String;
    private var passes: Array<ICompilerPass>;
    private var writer: Writer;
    private var contextStack: Array<ContextFrame>;

    public function new(outputDirectory: String) {
        this.types = [];
        this.imports = [];
        this.outputDirectory = outputDirectory;
        this.topLevelPackage = Path.normalize(outputDirectory).split("/").pop();
        this.passes = createPasses();
        this.writer = new Writer(this);
        this.contextStack = [];
    }

    private function createPasses(): Array<ICompilerPass> {
        return [
            new hx2go.passes.BinopTypeNormaliser(this),
            new hx2go.passes.StringificationCast(this),
            new hx2go.passes.RewriteExternAccess(this),
        ];
    }

    public function add(type: HxbModuleType) {
        types.set(StringConversions.moduleTypeGetDotPath(type), type);
    }

    public function build(mainClass: String): Void {
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

        var mainWritten = false;

        for (module in typesByModule) {
            if (module.length == 0) {
                continue;
            }

            var buf = new OutputBuffer();

            var path = module[0].module.split('.');
            var name = path.pop();
            var imports = imports.get(StringConversions.moduleTypeGetDotPath(module[0].type, true)) ?? [];

            // legacy: buf.add('package ${path[path.length - 1] ?? topLevelPackage}');
            buf.add('package $topLevelPackage');

            if (imports.length > 0) {
                buf.add("");
            }

            for (imp in imports) {
                buf.add('import "$imp"');
            }

            for (entry in module) {
                buf.addBufferInline(writer.types.writeModuleTypeDecl(entry.type));
            }

            if (path.length == 0 && name == "Main") {
                buf.add('');
                buf.add('func main() {');
                buf.add('${StringConversions.typePathFieldName("main", StringConversions.pathToLossyTypePath(mainClass))}()', 1);
                buf.add('}');

                mainWritten = true;
            }

            writeFile("/", StringConversions.moduleTypeGetFileName(module[0].type), buf.toString());
        }

        if (!mainWritten) {
            var buf = new OutputBuffer();

            buf.add('package ${topLevelPackage}');
            buf.add('');
            buf.add('func main() {');
            buf.add('${StringConversions.typePathFieldName("main", StringConversions.pathToLossyTypePath(mainClass))}()', 1);
            buf.add('}');

            // TODO: import file containing main

            writeFile("", "Main", buf.toString());
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

    public function submitNode(child: HxbTypedExpr, recursive: Bool = false): Void {
        if (child == null || contextStack.length == 0) return;

        var frame = contextStack[contextStack.length - 1];
        var startIndex = frame.currentPassIndex < 0 ? 0 : frame.currentPassIndex;

        var enqueue = (node: HxbTypedExpr) -> {
            for (i in startIndex...frame.passes.length) {
                var p = frame.passes[i];
                if (p.match(node)) {
                    frame.pending[p].push(node);
                }
            }
        };

        if (recursive) {
            var walk: HxbTypedExpr -> Void = null;
            walk = node -> {
                if (node == null) return;
                enqueue(node);
                TypedExprTools.iter(node, walk);
            };
            walk(child);
        } else {
            enqueue(child);
        }
    }

    public function desubmitNode(child: HxbTypedExpr, recursive: Bool = false): Void {
        if (child == null || contextStack.length == 0) return;

        var frame = contextStack[contextStack.length - 1];
        var startIndex = frame.currentPassIndex < 0 ? 0 : frame.currentPassIndex;

        var dequeue = (node: HxbTypedExpr) -> {
            for (i in startIndex...frame.passes.length) {
                var queue = frame.pending[frame.passes[i]];
                var idx = queue.indexOf(node);

                while (idx != -1) {
                    queue.splice(idx, 1);
                    idx = queue.indexOf(node);
                }
            }
        };

        if (recursive) {
            var walk: HxbTypedExpr -> Void = null;
            walk = node -> {
                if (node == null) return;
                dequeue(node);
                TypedExprTools.iter(node, walk);
            };
            walk(child);
        } else {
            dequeue(child);
        }
    }

    private function transformType(type: HxbModuleType): Void {
        var roots: Array<HxbTypedExpr> = [];

        switch type {
            case MClass(def):
                roots = roots.concat(def.fields.map(f -> f.expr?.expr).filter(f -> f != null));
                roots = roots.concat(def.statics.map(f -> f.expr?.expr).filter(f -> f != null));

                if (def.constructor?.expr != null) {
                    roots.push(def.constructor.expr?.expr);
                }

            case _: null;
        }

        for (e in roots) {
            Preprocessor.run(e, {}, this);
        }

        for (e in roots) {
            if (e == null) continue;

            var frame = new ContextFrame(passes, type);
            contextStack.push(frame);

            var match: HxbTypedExpr -> Void;

            match = node -> {
                for (p in frame.passes) {
                    if (!p.match(node)) continue;
                    frame.pending[p].push(node);
                }

                TypedExprTools.iter(node, match);
            };

            match(e);

            for (i in 0...frame.passes.length) {
                frame.currentPassIndex = i;

                var p = frame.passes[i];
                var queue = frame.pending[p];
                var idx = 0;
                while (idx < queue.length) {
                    p.execute(queue[idx], type);
                    idx++;
                }
            }

            contextStack.pop();
        }
    }

    public function defineImport(module: HxbModuleType, goImport: String): Void {
        var path = StringConversions.moduleTypeGetDotPath(module, true);
        if (!imports.exists(path)) {
            imports.set(path, []);
        }

        var imports = imports[path];
        if (!imports.contains(goImport)) {
            imports.push(goImport);
        }
    }

}