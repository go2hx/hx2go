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
import hx2go.normaliser.Normaliser;
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
            new hx2go.passes.FieldAccessGeneric(this),
            new hx2go.passes.TypeNormaliserCall(this),
            new hx2go.passes.RewriteDynamicBinop(this),
            new hx2go.passes.NullableCompare(this),
            new hx2go.passes.NullableConst(this),
            new hx2go.passes.NullableField(this),
            new hx2go.passes.NullableIndex(this),
            new hx2go.passes.TypeNormaliserUnop(this),
            new hx2go.passes.TypeNormaliserBinop(this),
            new hx2go.passes.TypeNormaliserVar(this),
            new hx2go.passes.TypeNormaliserReturn(this),
            new hx2go.passes.CastAnon(this),
            new hx2go.passes.CastNullableTo(this),
            new hx2go.passes.CastNullableFrom(this),
            new hx2go.passes.CastClosure(this),
            new hx2go.passes.CastString(this),
            new hx2go.passes.CastDynamic(this),
            new hx2go.passes.RewriteThrow(this),
            new hx2go.passes.FieldAccessExtern(this),
            new hx2go.passes.FieldAccessInstance(this),
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
                path: def.path
            };

            case MTypedef(def): {
                path: def.path
            };

            case MEnum(def): {
                path: def.path
            };

            case MAbstract(def): {
                path: def.path
            };

            case _: return;
        }

        var modulePath = ref.dotPath();
        var typePath = infos.path.dotPath() == ref.dotPath() ? ref.dotPath() : ref.dotPath() + '.' + infos.path.name;

        if (!typesByModule.exists(modulePath)) {
            typesByModule.set(modulePath, []);
        }

        typesByModule[modulePath].push({ type: t, name: infos.path.name, module: modulePath });
        if (!typeQueue.contains(modulePath)) typeQueue.push(modulePath);
        types.set(typePath, t);

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
            var path = module[0].module;
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

            writeFile("/", StringConversions.stringPathGetFileName(module[0].module), buf.toString());
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
        if (types.exists(tp.dotPath())) {
            return types[tp.dotPath()];
        }

        var res = archive.findModule(tp.moduleDotPath(), "go");
        if (res == null) {
            return null;
        }

        var mod = archive.decode(res);
        for (type in mod.types) {
            buildType(type, res);
        }

        return types[tp.dotPath()];
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
        prepass(child);

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

    private function prepass(expr: HxbTypedExpr): Void {
        if (expr.t != null && expr.t.match(TTypeParam(_) | TUnboundTypeParam(_))) {
            expr.t = TDynamicAny;
        }

        TypedExprTools.iter(expr, prepass);
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

            var frame = new ContextFrame(passes, type, f);
            contextStack.push(frame);

            var match: HxbTypedExpr -> Void;

            match = node -> {
                for (p in frame.passes) {
                    if (!p.match(node)) continue;
                    frame.pending[p].push(node);
                }

                TypedExprTools.iter(node, match);
            };

            prepass(f.expr.expr);
            match(f.expr.expr);

            for (i in 0...frame.passes.length) {
                frame.currentPassIndex = i;

                var p = frame.passes[i];
                var queue = frame.pending[p];
                var idx = 0;
                while (idx < queue.length) {
                    p.execute(queue[idx], frame);
                    idx++;
                }
            }

            contextStack.pop();
        }

        for (f in roots.filter(f -> f.kind.match(KMethod(_)) && f.expr?.expr != null)) {
            Normaliser.run(f.expr.expr, {}, this);
        }
    }

    public function defineImport(module: HxbModuleType, goImport: String): Void {
        var path = StringConversions.moduleTypeGetDotPath(module, true);
        if (!imports.exists(path)) {
            imports.set(path, []);
        }

        var localImports = imports[path];
        if (!localImports.contains(goImport)) {
            localImports.push(goImport);
        }
    }

}