package hx2go;

import haxe.io.Bytes;
import hxb.Typed.HxbVar;
import hxb.HxbModule;
import sys.io.Process;
using StringTools;

import haxe.io.Path;
import sys.FileSystem;
import sys.io.File;
import hxb.Typed.HxbTypedExpr;
import hx2go.util.OutputBuffer;
import hxb.HxbModuleType;
import hxb.tools.TypedExprTools;
import hxb.TypePath;
import hx2go.util.StringConversions;
import hx2go.normaliser.Normaliser;
import hxb.Typed.HxbModuleTypeRef;
import hxb.HxbArchive;
import hxb.ModuleRef;
import hxb.flags.HxbClassFlag;
import haxe.CallStack;
import hxb.HxbClassField;
import hxb.HxbType;
import hx2go.util.TypeHelper;
import hxb.flags.HxbClassFieldFlag;
import hx2go.util.ExprHelper;
import hxb.Typed.HxbTypedExprDef;
import hx2go.normaliser.Semantics;
import hx2go.passes.RewriteDynamicBinop;

#if go
import go.Map;
#end

class Context {

    private static final _reservedWords: Array<String> = [
        "_",
        "break", "default", "func", "interface", "select",
        "case", "defer", "go", "map", "struct",
        "chan", "else", "goto", "package", "switch",
        "const", "fallthrough", "if", "range", "type",
        "continue", "for", "import", "return", "var",
        "any", "bool", "byte", "comparable",
        "complex64", "complex128", "error", "float32", "float64",
        "int", "int8", "int16", "int32", "int64",
        "rune", "string",
        "uint", "uint8", "uint16", "uint32", "uint64", "uintptr",
        "true", "false", "iota", "nil",
        "append", "cap", "close", "complex", "copy",
        "delete", "imag", "len", "make", "new",
        "panic", "print", "println", "real", "recover",
    ];

    private static final _reserved: Map<String, Bool> = new Map();
    private var types: Map<String, HxbModuleType>;
    private var moduleCache: Map<String, HxbModule> = new Map();
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
    private var writtenFiles: Map<String, Bool>;
    public var sourcelineComments:Bool = false;
    public var times: hx2go.util.Times;

    private var codegenVersion:String;
    private var disableIncrementalCache:Bool = false;
    private var cache:Cache;

    public function new(archive: HxbArchive, outputDirectory: String, sourcelineComments:Bool, times:hx2go.util.Times, codegenVersion:String, disableIncrementalCache:Bool) {
        this.sourcelineComments = sourcelineComments;
        this.times = times;
        this.types = new Map();
        this.imports = new Map();
        this.outputDirectory = outputDirectory;
        this.topLevelPackage = Path.normalize(outputDirectory).split("/").pop();
        this.passes = createPasses();
        this.writer = new Writer(this);
        this.contextStack = [];
        this.processList = [];
        this.writtenFiles = new Map();
        this.archive = archive;
        this.codegenVersion = codegenVersion;
        this.disableIncrementalCache = disableIncrementalCache;

        for (word in _reservedWords) {
            _reserved.set(word, true);
        }
    }

    private function createPasses(): Array<ICompilerPass> {
        return [
            new hx2go.passes.FieldAccessGeneric(this), // TODO: c1
            new hx2go.passes.DefaultArgs(this),
            new hx2go.passes.FunctionCompare(this),
            new hx2go.passes.TypeNormaliserCallReturn(this),
            new hx2go.passes.RewriteSyntaxCode(this),
            new hx2go.passes.RewriteArrayLength(this),
            new hx2go.passes.RewriteGoUIntNegativeConst(this),
            new hx2go.passes.TypeNormaliserCall(this), // TODO: c2
            new hx2go.passes.TypeNormaliserNew(this),
            new hx2go.passes.NullableCompareValid(this),
            new hx2go.passes.NullableCompare(this),
            new hx2go.passes.NullableConst(this),
            new hx2go.passes.NullableFieldAccess(this),
            new hx2go.passes.NullableIndex(this),
            new hx2go.passes.NullableCall(this),
            new hx2go.passes.CastInstToClass(this),
            new hx2go.passes.CastInstToEnum(this),
            new hx2go.passes.RewriteDynamicCall(this),
            new hx2go.passes.RewriteDynamicUnop(this),
            new hx2go.passes.RewriteDynamicBinop(this),
            new hx2go.passes.FieldAccessDynamicSet(this),
            new hx2go.passes.FieldAccessDynamicGet(this),
            new hx2go.passes.TypeNormaliserUnop(this),
            new hx2go.passes.TypeNormaliserBinop(this),
            new hx2go.passes.DynamicInstFunctionAssign(this),
            new hx2go.passes.TypeNormaliserVar(this),
            new hx2go.passes.TypeNormaliserReturn(this),
            new hx2go.passes.TypeNormaliserArray(this),
            new hx2go.passes.TypeNormaliserObject(this),
            new hx2go.passes.TypeNormaliserIf(this),
            new hx2go.passes.TypeNormaliserSwitch(this),
            new hx2go.passes.RewriteTupleCreation(this),
            new hx2go.passes.SuperCtor(this),
            new hx2go.passes.CastClosure(this),
            new hx2go.passes.CastNullableTo(this),
            new hx2go.passes.CastNullableFrom(this),
            new hx2go.passes.CastString(this),
            new hx2go.passes.CastArray(this),
            new hx2go.passes.CastClass(this),
            new hx2go.passes.CastPointerInterface(this),
            new hx2go.passes.RewriteThrow(this),
            new hx2go.passes.FloatMod(this),
            new hx2go.passes.ArrayAccessDynamicSet(this),
            new hx2go.passes.ArrayAccessDynamicGet(this),
            new hx2go.passes.FieldAccessSuper(this),
            new hx2go.passes.CastDynamicFrom(this),
            new hx2go.passes.RewriteTupleAssign(this),
            new hx2go.passes.RewriteResultAssign(this),
            new hx2go.passes.RewriteResultSwitch(this),
            new hx2go.passes.RewriteResultSwitchParam(this),
            new hx2go.passes.RewriteMethodAssign(this),
            new hx2go.passes.FieldAccessExtern(this),
            new hx2go.passes.FieldAccessInstance(this),
            new hx2go.passes.InterfaceDynamic(this),
            new hx2go.passes.InterfaceCompare(this),
            new hx2go.passes.RewriteAbstractThis(this),
            new hx2go.passes.RewriteGoBuiltinCreation(this),
            new hx2go.passes.RewriteStringMethod(this),
            new hx2go.passes.RewriteStringLength(this),
            new hx2go.passes.RewriteSyntaxSelect(this),
            new hx2go.passes.RewriteSyntaxDefer(this),
            new hx2go.passes.RewriteSyntaxGo(this),
            new hx2go.passes.RewriteArrayCreation(this),
            new hx2go.passes.RewriteStringCreation(this),
            new hx2go.passes.RewritePointerCastFrom(this),
            new hx2go.passes.RewritePointerCastTo(this),
            new hx2go.passes.CoerceDynamicInt(this),
            new hx2go.passes.OptimiseEnumParameter(this),
//            new hx2go.passes.ResolveVarDecl(this),
//            new hx2go.passes.ResolveCast(this),
        ];
    }

    public function getWriter(): Writer {
        return writer;
    }

    public static function sanitiseString(v: String): String {
        return _reserved.exists(v) ? '_hx_reserved_$v' : v;
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
    }
    public var res:haxe.ds.Map<String, Bytes> = [];
    public function build(mainClass: String, singleFile:Bool, res:haxe.ds.Map<String, Bytes>): Void {
        typesByModule = new Map();
        typeQueue = [];
        this.res = res;
        this.cache = new Cache(!singleFile && codegenVersion != "" && !disableIncrementalCache, outputDirectory, res);

        var mod = resolveModule(StringConversions.pathToLossyTypePath(mainClass));
        var cls = mod.classes();
        for (cl in cls) {
            if (cl.path.name.endsWith("_Fields_")) {
                mainClass = cl.path.dotPath();
                break;
            }
        }
        
        var profileType: TypePath = { name: "HxProfile", moduleName: "HxProfile", pack: ["go", "haxe"] };
        resolve(profileType);

        var buf = new OutputBuffer();
        var importList:Array<String> = [];

        while (typeQueue.length != 0) {
            var module = typesByModule[typeQueue.pop()];
            if (module.length == 0) {
                continue;
            }

            var file = new OutputBuffer();
            var header = new OutputBuffer();

            var path = module[0].module;

            var hasWrittenSomething = false;
            var closeEmit = times.start("emit");
            for (entry in module) {
                var old = writer.types.importTarget;
                writer.types.importTarget = entry.module;
                var localBuf = writer.types.writeModuleTypeDecl(entry.type);
                writer.types.importTarget = old;

                if (!localBuf.isEmpty()) {
                    hasWrittenSomething = true;
                }

                file.addBufferInline(localBuf);
            }
            closeEmit();

            var imports = imports.exists(path) ? imports[path] : [];

            if (!singleFile) {
                header.add('package $topLevelPackage');
            }

            if (imports.length > 0) {
                header.add("");
            }

            for (imp in imports) {
                _reserved[imp] = true;
                if (singleFile) {
                    if (!importList.contains(imp))
                        importList.push(imp);
                }else{
                    header.add('import "$imp"');
                }
            }

            if (!hasWrittenSomething) continue;
            else header.add(file.toString());

            if (singleFile) {
                buf.add(header.toString());
            }else{
                writeFile("/", StringConversions.stringPathGetFileName(module[0].module), header.toString());
            }
        }
        if (!singleFile) {
            buf.add('package ${topLevelPackage}');
        }
        buf.add('');
        var profileStart = StringConversions.typePathStaticFieldName("start", profileType);
        var profileStop = StringConversions.typePathStaticFieldName("stop", profileType);
        buf.add('func main() {');
        buf.add('$profileStart()', 1);
        buf.add('${StringConversions.typePathStaticFieldName("main", StringConversions.pathToLossyTypePath(mainClass))}()', 1);
        buf.add('$profileStop()', 1);
        buf.add('}');

        var prefix = new OutputBuffer();
        if (singleFile) {
            prefix.add('package ${topLevelPackage}');
            prefix.add('');
            prefix.add('import (');
            for (imp in importList) {
                prefix.add('  "$imp"');
            }
            prefix.add(')');
        }

        writeFile("", "Main", prefix + buf.toString());

        cache.prune([for (m in moduleCache.keys()) m]);
        removeStaleFiles();
        cache.save();

        copyRuntime();

        var closeFmt = times.start("gofmt");
        var proc = new sys.io.Process('gofmt -w $outputDirectory');

        var closeDeps = times.start("go get");
        installGoDeps(imports);
        closeDeps();

        proc.exitCode(true);
        closeFmt();
    }

    function copyRuntime() {
        #if go
        var libPath = Path.join([ Sys.programPath(), '..', '..', '..', '..' ]);
        #else
        var libPath = Path.join([ Path.directory(Sys.programPath()), '..', '..' ]);
        #end

        var runtimePath = Path.join([ libPath, 'runtime' ]);
        var runtimeFiles = FileSystem.readDirectory(runtimePath);

        for (entry in runtimeFiles) {
            var src = Path.join([ runtimePath, entry ]);
            var dst = Path.join([ outputDirectory, entry ]);
            File.saveContent(dst, File.getContent(src));
        }
    }

    function installGoDeps(imports:Map<String, Array<String>>) {
        final previousCwd = Sys.getCwd();
        Sys.setCwd(outputDirectory);
        
        var seen: Map<String, Bool> = new Map();
        var deps: Array<String> = [];
        for (moduleDeps in imports) {
            for (dep in moduleDeps) {
                if (dep.contains(".") && !seen.exists(dep)) {
                    seen.set(dep, true);
                    deps.push(dep);
                }
            }
        }

        if (deps.length > 0) {
            deps.sort((a, b) -> a < b ? -1 : (a > b ? 1 : 0));
            var libCache = deps.join("\n");
            var libCachePath = ".hx2go_deps";
            var haveModule = FileSystem.exists("go.mod") && FileSystem.exists("go.sum");
            var prev = FileSystem.exists(libCachePath) ? File.getContent(libCachePath) : null;
            if (!(haveModule && prev == libCache)) {
                var args = ["get"].concat(deps);
                var code = Sys.command("go", args);
                if (code != 0) {
                    Sys.println("command failed: go " + args.join(" "));
                } else {
                    File.saveContent(libCachePath, libCache);
                }
            }
        }

        Sys.setCwd(previousCwd);
    }

    public function omitVTable(cls: HxbClass): Bool {
        return false;
    }

    public function resolve(tp: TypePath): HxbModuleType {
        if (types.exists(tp.dotPath())) {
            return types[tp.dotPath()];
        }

        var mod = resolveModule(tp);
        if (mod == null) {
            return null;
        }

        return types[tp.dotPath()];
    }

    public function resolvedInstanceName(tp: TypePath): String {
        var mt = resolve(tp);
        return StringConversions.typePathClassInstanceName(mt == null ? tp : StringConversions.moduleTypeGetTypePath(mt));
    }

    public function resolveModule(tp: TypePath): Null<HxbModule> {
        var res = archive.findModule(tp.moduleDotPath(), "go");
        if (res == null) return null;

        var key = res.dotPath();
        if (moduleCache.exists(key)) {
            return moduleCache[key];
        }

        var closeArcDecode = times.start("archive.decode");
        var mod = archive.decode(res);
        closeArcDecode();
        moduleCache.set(key, mod);

        var closeDecode = times.start("decode");
        for (type in mod.types) buildType(type, res);
        closeDecode();

        var closeRefs = times.start("resolveRefs");
        resolveModuleRefs(mod);
        closeRefs();

        var closeHit = times.start("cache.isHit");
        var hit = cache.isHit(codegenVersion, archive, mod);
        closeHit();
        if (hit) {
            for (type in mod.types) normalizeSignatures(type, key);
            typesByModule.set(key, []);
            return mod;
        }

        var closeTransform = times.start("transform");
        for (type in mod.types) transformType(type, key);
        closeTransform();

        return mod;
    }

    // resolve a module's external type references so it's reachable for the module graph
    private function resolveModuleRefs(mod: HxbModule): Void {
        inline function resolveAll(refs: Array<TypePath>) {
            for (ref in refs) {
                resolve(ref);
            }
        }
        resolveAll(mod.classRefs);
        resolveAll(mod.enumRefs);
        resolveAll(mod.abstractRefs);
        resolveAll(mod.typedefRefs);
    }

    private function writeFile(directory: String, fileName: String, content: String): Void {
        var fullPath = Path.join([ outputDirectory, directory, '$fileName.go' ]);
        ensureDirectory(Path.directory(fullPath));

        writtenFiles.set(Path.normalize(fullPath), true);
        File.saveContent(fullPath, content);
    }

    private function removeStaleFiles(): Void {
        if (!FileSystem.exists(outputDirectory)) {
            return;
        }

        for (key in cache.keys()) {
            var fileName = StringConversions.stringPathGetFileName(key);
            var kept = Path.normalize(Path.join([ outputDirectory, '$fileName.go' ]));
            writtenFiles.set(kept, true);
        }

        for (entry in FileSystem.readDirectory(outputDirectory)) {
            if (!entry.endsWith(".go")) continue;
            if (!entry.startsWith("Hx_") && entry != "Main.go") continue;

            var fullPath = Path.normalize(Path.join([ outputDirectory, entry ]));
            if (writtenFiles.exists(fullPath) || FileSystem.isDirectory(fullPath)) {
                continue;
            }

            FileSystem.deleteFile(fullPath);
        }
    }

    private function ensureDirectory(path: String): Void {
        if (path == null || path == "") return;

        var norm = Path.normalize(path);
        var parts = norm.split("/");
        var full = [];

        for (part in parts) {
            full.push(part);

            var p = full.join("/");
            // if path is absolute prevent an empty directory from trying to be created
            if (p == "") {
                continue;
            }
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

    public function normalize(t: HxbType): HxbType {
        return switch (t) {
            case TAbstract({ name: "Null", pack: [], moduleName: mName }, [inner]):
                var n = normalize(inner);
                // Null<Null<T> -> Null<T>
                if (n.match(TAbstract({name: "Null", pack: []}, _))) {
                    return n;
                }
                switch n {
                    case TInst(c, _):
                        var m = resolve(c);
                        switch m {
                            case MTypedef(_.meta => meta), MClass(_.meta => meta):
                                if (meta.filter(m -> m.name == ":go.Type").length > 0) {
                                    return TAbstract({ name: "Null", moduleName: mName, pack: [] }, [n]);
                                }
                            default:
                        }
                    default:
                }

                if (!Semantics.isBoolType(this, n) && !Semantics.isIntegerType(this, n) && !Semantics.isFloatType(this, n) && !Semantics.isStringType(this, n)) {
                    n;
                }else{
                    switch (n) {
                        case TDynamicAny | TDynamic(_):
                            TDynamicAny;
                        case _:
                            TAbstract({ name: "Null", moduleName: mName, pack: [] }, [n]);
                    }
                }

            case TTypeParam(_) | TUnboundTypeParam(_) | TAnon(_):
                TDynamicAny;

            case TInst(path, params):
                TInst(path, params.map(normalize));

            case TType(path, [TAnon(anon)]) if (path.dotPath() == "go.Tuple"):
                TType(path, [ TAnon(new HxbAnon(AClosed, anon.fields.map(f -> {
                    var v = f.shallowCopy();
                    v.type = normalize(f.type);
                    v;
                }) )) ]);

            case TType(path, params):
                var fwd = TypeHelper.followToDef(this, t, true);
                var fwdNorm = normalize(fwd);

                if (fwdNorm.match(TDynamic(_) | TDynamicAny | TInst({ name: "Array", pack: [] }, [TDynamic(_) | TDynamicAny]))) { // the Array<Dynamic> case is not ideal, but will do for now...
                    TDynamicAny;
                } else {
                    TType(path, params.map(normalize));
                }

            case TAbstract(path, params):
                var mt = resolve(path);
                if (mt == null) {
                    return TAbstract(path, params.map(normalize));
                }

                switch mt {
                    case MAbstract({ meta: meta }) if (meta.filter(m -> m.name == ':coreApi' || m.name == ':coreType' || m.name == ":go.AbstractNoGenericErasure").length != 0): t;
                    case MAbstract({ isExtern: true }): t;
                    case MAbstract({ underlyingThis: TAbstract(uPath, _) }) if (TypeHelper.comparePath(path, uPath)): TAbstract(path, params.map(normalize));
                    case MAbstract(a): normalize(a.underlyingThis);
                    case _: TAbstract(path, params.map(normalize));
                }

            case TFun(args, ret):
                TFun(args.map(a -> new HxbFunArg(
                sanitiseString(a.name),
                a.opt,
                normalize(a.t)
                )), normalize(ret));

            case _:
                t;
        }
    }

    private function prepass(expr: HxbTypedExpr): Void {
        if (expr.t != null) {
            expr.t = normalize(expr.t);
        }

        TypedExprTools.iter(expr, prepass);

        switch expr.expr {
            case TField(e, FAnon(fa)) if (e.t.match(TType({ name: 'Tuple', pack: ['go'] }, _))): {
                // we don't want to do anything.
            }

            case TField({ t: t }, FAnon(fa)) if (t.match(TType(_)) && TypeHelper.followToDef(this, t, true).match(TInst(_))): {
                // we don't want to do anything.
            }

            case TField(e, FAnon(fa)): {
                expr.expr = TField(e, FDynamic(fa.name));
                expr.t = TDynamicAny;
            }

            case TField(e, FInstance(_, _, fa)) if (e.t != null && e.t.match(TDynamic(_) | TDynamicAny)): {
                expr.expr = TField(e, FDynamic(fa.name));
                expr.t = TDynamicAny;
            }

            case TField(e, FInstance(_, _, fa)) if (e.t != null && switch e.t {
                case TInst(tp, _): switch resolve(tp) {
                    case MClass(c): (c.flags & HxbClassFlag.CInterface != 0) && !expr.t.match(TFun(_)) && fa.name != "VTable";
                    case _: false;
                };

                case _: false;
            }): {
                expr.expr = TField(ExprHelper.createUntyped("({0}).VTable", [e]), FDynamic(fa.name));
                expr.t = TDynamicAny;
            }

            case TField(e, FDynamic(_)): {
                expr.t = TDynamicAny;
            }

            case TVar(v, _) | TLocal(v):
                v.name = sanitiseString(v.name);
                if (v.type != null) {
                    v.type = normalize(v.type);
                }

            case TParenthesis(e):
                expr.t = e.t; // update paren type

            case TCall(e, _) if (e.t != null && e.t.match(TDynamic(_) | TDynamicAny)):
                expr.t = TDynamicAny;

            case TFunction(f):
                f.t = normalize(f.t);
                for (a in f.args) {
                    a.v.type = normalize(a.v.type);
                } // prepass is already done on a.value.t

            case TMeta(_, e):
                expr.expr = e.expr;
                expr.t = e.t;

            case TBinop(OpAssign, _, _):
                // skip

            case TBinop(op, left, right) if (left.t != null && right.t != null && (left.t.match(TDynamic(_) | TDynamicAny) || right.t.match(TDynamic(_) | TDynamicAny))):
                expr.t = RewriteDynamicBinop.returnsBool(op) ? TBool : TDynamicAny;

            case _: null;
        }
    }

    var enumClassIndex = MClass(null).getIndex();

    private function transformType(type: HxbModuleType, moduleKey: String): Void {
        var roots = normalizeSignatures(type, moduleKey);
        if (roots == null) return;
        transformBodies(type, moduleKey, roots);
    }

    private function normalizeSignatures(type: HxbModuleType, moduleKey: String): Null<Array<HxbClassField>> {
        if (type.getIndex() != enumClassIndex) {
            return null;
        }

        var roots: Array<HxbClassField> = [];
        var baseInstFields: Map<String, HxbClassField> = new Map();

        switch type {
            case MClass(def):
                roots = roots.concat(def.fields);
                roots = roots.concat(def.statics);
                roots = roots.filter(f -> f.flags & HxbClassFieldFlag.CfExtern == 0);

                if (def.flags & HxbClassFlag.CExtern != 0) {
                    return null;
                }

                if (def.constructor?.expr != null) {
                    roots.push(def.constructor);
                }

                if (def.init?.expr != null) {
                    roots.push(def.init);
                }

                for (f in def.fields.concat(def.statics)) {
                    var needsCoerce = switch f.type {
                        case TType(_): true;
                        case TAbstract({ pack: ['haxe', 'ds'], name: 'Map' }, _): true;
                        case _: false;
                    };
                    if (f.kind.match(KVar(_)) && f.expr?.expr != null && needsCoerce) {
                        f.expr.expr = ExprHelper.createCast(f.expr.expr, f.type);
                    }
                }

                var queue: Array<HxbClass> = [def];

                while (queue.length > 0) {
                    var curr = queue.pop();

                    for (f in curr.fields) {
                        baseInstFields.set(f.name, f);
                    }

                    for (iface in curr.interfaces) {
                        var m = resolve(iface.t);
                        if (m == null) {
                            continue;
                        }

                        switch m {
                            case MClass(x): queue.push(x);
                            case _: continue;
                        }
                    }

                    if (curr.superClass == null) {
                        continue;
                    }

                    var m = resolve(curr.superClass.t);
                    if (m == null) {
                        continue;
                    }

                    switch m {
                        case MClass(x): queue.push(x);
                        case _: continue;
                    }
                }

            case _: null;
        }

        var old = writer.types.importTarget;
        writer.types.importTarget = moduleKey;

        for (f in roots) {
            if (baseInstFields.exists(f.name)) {
                var base = baseInstFields.get(f.name);
                var assign: Array<HxbTypedExpr> = [];
                var args: Array<HxbFunArg> = [];

                if (!TypeHelper.compare(base.type, f.type)) {
                    f.type = switch [f.type, base.type] {
                        case [
                        TFun(f_args, f_ret),
                        TFun(b_args, b_ret)
                        ]: {
                            for (idx in 0...b_args.length) {
                                var farg = f_args[idx];
                                var barg = b_args[idx];
                                var name = '_hx_param_' + farg.name;

                                var toType = farg.t;
                                var fromType = b_args[idx].t;
                                var localVar = new HxbVar(-1, name, VUser(TVOLocalVariable), 0, [], f.pos, fromType);
                                var local = new HxbTypedExpr(TLocal(localVar), fromType, f.pos);
                                var sanName = Context.sanitiseString(farg.name);

                                assign.push(
                                    ExprHelper.createUntyped('${sanName} := {0}; _ = ${sanName}', [ExprHelper.createCast(local, toType)])
                                );

                                args.push({
                                    name: name,
                                    opt: b_args[idx].opt,
                                    t: b_args[idx].t,
                                });
                            }

                            TFun(args, b_ret);
                        }

                        case _: f.type;
                    }

                    if (f.expr?.expr != null) {
                        f.expr.expr.expr = switch f.expr.expr.expr {
                            case TFunction({ args: args, t: t, expr: { expr: TBlock(exprs), t: blockt, pos: blockpos } }) if (assign.length > 0): TFunction({
                                args: args,
                                t: t,
                                expr: new HxbTypedExpr(TBlock(assign.concat(exprs)), blockt, blockpos)
                            });

                            case _: f.expr.expr.expr;
                        }
                    }
                }
            }

            f.type = normalize(f.type);
        }

        writer.types.importTarget = old;
        return roots;
    }

    private function transformBodies(type: HxbModuleType, moduleKey: String, roots: Array<HxbClassField>): Void {
        var old = writer.types.importTarget;
        writer.types.importTarget = moduleKey;

        for (f in roots) {
            if (f.expr?.expr == null) continue;

            var frame = new ContextFrame(passes, type, moduleKey, f);
            contextStack.push(frame);

            var match: HxbTypedExpr -> Void;

            match = node -> {
                for (p in frame.passes) {
                    if (!p.match(node)) continue;
                    frame.pending[p].push(node);
                }

                TypedExprTools.iter(node, match);
            };

            var closePrepass = times.start("transform.prepass");
            prepass(f.expr.expr);
            closePrepass();

            var closeMatch = times.start("transform.match");
            match(f.expr.expr);
            closeMatch();

            for (i in 0...frame.passes.length) {
                frame.currentPassIndex = i;

                var p = frame.passes[i];
                var queue = frame.pending[p];
                if (queue.length == 0) continue;

                var passName = Type.getClassName(Type.getClass(p)).split(".").pop();
                var close = times.start("transform.passes." + passName);
                var idx = 0;
                while (idx < queue.length) {
                    p.execute(queue[idx], frame);
                    idx++;
                }
                close();
            }

            contextStack.pop();
        }

        var closeNorm = times.start("transform.normalise");
        for (f in roots.filter(f -> f.kind.match(KMethod(_)) && f.expr?.expr != null)) {
            Normaliser.run(f.expr.expr, {}, this);
        }
        closeNorm();

        writer.types.importTarget = old;
    }

    public function defineImportOnModule(moduleKey: String, goImport: String): Void {
        if (!imports.exists(moduleKey)) {
            imports.set(moduleKey, []);
        }

        var localImports = imports[moduleKey];
        if (!localImports.contains(goImport)) {
            localImports.push(goImport);
        }
    }

    public function defineImport(module: ContextFrame, goImport: String): Void {
        if (!imports.exists(module.moduleKey)) {
            imports.set(module.moduleKey, []);
        }

        if (module.field.flags & HxbClassFieldFlag.CfExtern != 0) {
            return;
        }

        var localImports = imports[module.moduleKey];
        if (!localImports.contains(goImport)) {
            localImports.push(goImport);
        }
    }

}