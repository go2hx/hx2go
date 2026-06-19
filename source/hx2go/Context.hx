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
import hx2go.hxb.HxbArchive;
import hx2go.hxb.ModuleRef;
import hx2go.hxb.flags.HxbClassFlag;
import haxe.CallStack;

class Context {

    private var types: Map<String, HxbModuleType>;
    private var archive: HxbArchive;
    private var imports: Map<String, Array<String>>;
    private var outputDirectory: String;
    private var topLevelPackage: String;
    private var passes: Array<ICompilerPass>;
    private var writer: Writer;
    private var contextStack: Array<ContextFrame>;
    private var typesByModule: Map<String, Array<{ type: HxbModuleType, name: String, module: String }>>;
    private var typeQueue: Array<String>;

    public function new(archive: HxbArchive, outputDirectory: String) {
        this.types = [];
        this.imports = [];
        this.outputDirectory = outputDirectory;
        this.topLevelPackage = Path.normalize(outputDirectory).split("/").pop();
        this.passes = createPasses();
        this.writer = new Writer(this);
        this.contextStack = [];
        this.archive = archive;
    }

    private function createPasses(): Array<ICompilerPass> {
        return [
            new hx2go.passes.TypeNormaliserBinop(this),
            new hx2go.passes.TypeNormaliserCall(this),
            new hx2go.passes.StringificationCast(this),
            new hx2go.passes.RewriteExternAccess(this),
            new hx2go.passes.RewriteSyntaxCode(this),
            new hx2go.passes.RewriteSyntaxDefer(this),
            new hx2go.passes.RewriteSyntaxGo(this)
        ];
    }

    public function buildType(t: HxbModuleType, ref: ModuleRef): Void {
        var infos = switch t {
            case MClass(def): {
                module: def.path.moduleDotPath(),
                name: def.path.name
            };

            case MTypedef(def): {
                module: def.path.moduleDotPath(),
                name: def.path.name
            };

            case MEnum(def): {
                module: def.path.moduleDotPath(),
                name: def.path.name
            };

            case MAbstract(def): {
                module: def.path.moduleDotPath(),
                name: def.path.name
            };

            case _: return;
        }

        if (!typesByModule.exists(infos.module)) {
            typesByModule.set(infos.module, []);
        }

        typesByModule[infos.module].push({ type: t, name: infos.name, module: infos.module });
        typeQueue.push(infos.module);
        types.set(ref.dotPath(), t);

        transformType(t);
    }

    public function build(mainClass: String): Void {
        typesByModule = [];
        typeQueue = [];

        resolve(StringConversions.pathToLossyTypePath(mainClass));

        var mainWritten = false;
        while (typeQueue.length != 0) {
            var module = typesByModule[typeQueue.pop()];
            if (module.length == 0) {
                continue;
            }

            var buf = new OutputBuffer();
            var path = StringConversions.moduleTypeGetDotPath(module[0].type, true);
            var imports = imports.get(path) ?? [];

            buf.add('package $topLevelPackage');

            if (imports.length > 0) {
                buf.add("");
            }

            for (imp in imports) {
                buf.add('import "$imp"');
            }

            var hasWrittenSomething = false;
            for (entry in module) {
                var localBuf = writer.types.writeModuleTypeDecl(entry.type);
                if (!localBuf.isEmpty()) {
                    hasWrittenSomething = true;
                }

                buf.addBufferInline(localBuf);
            }

            if (path == mainClass) {
                buf.add('');
                buf.add('func main() {');
                buf.add('${StringConversions.typePathFieldName("main", StringConversions.pathToLossyTypePath(mainClass))}()', 1);
                buf.add('}');

                mainWritten = true;
            }

            if (!hasWrittenSomething) {
                continue;
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
        var res = archive.findModule(tp.dotPath(), "go");
        if (res == null) {
            return null;
        }

        if (types.exists(res.dotPath())) {
            return types[res.dotPath()];
        }

        var mod = archive.decode(res);
        for (type in mod.types) {
            buildType(type, res);
        }

        return types[res.dotPath()];
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