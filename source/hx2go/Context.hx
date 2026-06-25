package hx2go;

import sys.io.Process;
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
import hx2go.hxb.HxbClassField;

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
    private var processList: Array<Process>;

    public function new(archive: HxbArchive, outputDirectory: String) {
        this.types = [];
        this.imports = [];
        this.outputDirectory = outputDirectory;
        this.topLevelPackage = Path.normalize(outputDirectory).split("/").pop();
        this.passes = createPasses();
        this.writer = new Writer(this);
        this.contextStack = [];
        this.processList = [];
        this.archive = archive;
    }

    private function createPasses(): Array<ICompilerPass> {
        return [
            new hx2go.passes.TypeNormaliserCall(this),
            new hx2go.passes.RewriteDynamicBinop(this),
            new hx2go.passes.NullableCompare(this),
            new hx2go.passes.NullableConst(this),
            new hx2go.passes.NullableField(this),
            new hx2go.passes.NullableIndex(this),
            new hx2go.passes.TypeNormaliserUnop(this),
            new hx2go.passes.TypeNormaliserBinop(this),
            new hx2go.passes.TypeNormaliserVar(this),
            new hx2go.passes.CastAnon(this),
            new hx2go.passes.CastNullableTo(this),
            new hx2go.passes.CastNullableFrom(this),
            new hx2go.passes.CastClosure(this),
            new hx2go.passes.CastString(this),
            new hx2go.passes.CastDynamic(this),
            new hx2go.passes.RewriteThrow(this),
            new hx2go.passes.FieldAccessExtern(this),
            new hx2go.passes.FieldAccessAnon(this),
            new hx2go.passes.FieldAccessDynamic(this),
            new hx2go.passes.RewriteSliceCreation(this),
            new hx2go.passes.RewriteStringLength(this),
            new hx2go.passes.RewriteArrayLength(this),
            new hx2go.passes.RewriteSyntaxCode(this),
            new hx2go.passes.RewriteSyntaxDefer(this),
            new hx2go.passes.RewriteSyntaxGo(this)
        ];
    }

    public function getWriter(): Writer {
        return writer;
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
                buf.add('${StringConversions.typePathStaticFieldName("main", StringConversions.pathToLossyTypePath(mainClass))}()', 1);
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
            buf.add('${StringConversions.typePathStaticFieldName("main", StringConversions.pathToLossyTypePath(mainClass))}()', 1);
            buf.add('}');

            // TODO: import file containing main

            writeFile("", "Main", buf.toString());
        }
        installGoDeps(imports);
    }

    function installGoDeps(imports:Map<String, Array<String>>) {
        final previousCwd = Sys.getCwd();
        Sys.setCwd(outputDirectory);
        for (_ => deps in imports) {
            for (dep in deps) {
                if (dep.contains(".")) {
                    processList.push(new Process("go", ["get", dep]));
                }
            }
        }
        while (processList.length > 0) {
            var ps = processList.pop();
            ps.exitCode();
            ps.close();
        }

        Sys.setCwd(previousCwd);
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

    public function submitNode(child: HxbTypedExpr, recursive: Bool = false, passOffset: Int = 0): Void {
        if (child == null || contextStack.length == 0) return;

        var frame = contextStack[contextStack.length - 1];
        var startIndex = frame.currentPassIndex < 0 ? 0 : frame.currentPassIndex + passOffset;

        var enqueue = (node: HxbTypedExpr) -> {
            if (node?.expr == null) {
                return;
            }

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
        var roots: Array<HxbClassField> = [];

        switch type {
            case MClass(def):
                roots = roots.concat(def.fields);
                roots = roots.concat(def.statics);

                if (def.constructor?.expr != null) {
                    roots.push(def.constructor);
                }

            case _: null;
        }

        for (f in roots) {
            if (f.expr?.expr == null) continue;

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

            match(f.expr.expr);

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

        for (f in roots.filter(f -> f.kind.match(KMethod(_)) && f.expr?.expr != null)) {
            Preprocessor.run(f.expr.expr, {}, this);
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