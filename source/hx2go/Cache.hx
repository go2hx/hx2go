package hx2go;

import haxe.io.BytesBuffer;
import haxe.io.Bytes;
import hxb.HxbModule;
import hxb.HxbModuleType;
import hxb.HxbClassField;
import hxb.HxbArchive;
import hxb.ModuleRef;
import hxb.print.TypedExprPrinter;
import sys.io.File;
import haxe.crypto.Md5;
import haxe.io.Path;
import sys.FileSystem;

/**
    Per-module incremental cache. A module whose key is unchanged since the last
    run skips the whole transform+emit pipeline (its `.go` stays on disk).

    The key has two parts, both position-independent so the frontend's per-run
    HXB non-determinism doesn't cause false misses:

    1. A hash of every HXB chunk EXCEPT the EXD chunk (deferred field-expression
       bodies). EXD is the one chunk the Haxe frontend rewrites non-deterministically
       each run (it shuffles a few source-position varints), so hashing raw bytes
       including EXD reported ~80 modules "changed" every run and cascaded false
       misses to every importer. The other chunks (STR/CLS/CFD/…) are byte-stable
       and carry every signature/type/pool change.

    2. A hash of the field-expression BODIES rendered through `TypedExprPrinter`
       (position-free Haxe source). This is REQUIRED: a change isolated to EXD —
       e.g. swapping one operator `a - b` → `a + b`, same operands and string pool
       — leaves ALL non-EXD chunks byte-identical, so part 1 alone would false-HIT
       and emit stale Go. Printing the bodies catches those edits while ignoring
       the position noise that made raw EXD bytes unusable.

    A module's key also folds in each direct dependency's source key, so a
    dependency's signature change re-keys its dependents (one level; the cascade
    covers transitive deps because each dependent is itself re-keyed).
**/
class Cache {
    final enabled:Bool;
    final outputDirectory:String;
    final cacheKeys:Map<String, Bytes>;
    final cacheSourceKeys:Map<String, Bytes> = [];

    final srcKeyByBytes:Map<String, Bytes>;
    final srcKeyByBytesNext:Map<String, Bytes> = [];

    final printer:TypedExprPrinter = new TypedExprPrinter();

    public function new(enabled:Bool, outputDirectory:String) {
        this.enabled = enabled;
        this.outputDirectory = outputDirectory;
        this.cacheKeys = load();
        this.srcKeyByBytes = loadSrcMemo();
    }

    public function isHit(codegenVersion:String, archive:HxbArchive, mod:HxbModule):Bool {
        if (!enabled) return false;

        var dotPath = mod.dotPath();
        var key = computeModuleKey(codegenVersion, archive, mod);
        if (bytesEqual(cacheKeys.get(dotPath), key)) {
            return true;
        }
        cacheKeys.set(dotPath, key);
        return false;
    }

    public function keys():Array<String> {
        return [for (dotPath in cacheKeys.keys()) dotPath];
    }

    public function save():Void {
        if (!enabled) return;
        var buf = new StringBuf();
        for (dotPath in cacheKeys.keys()) {
            buf.add(dotPath);
            buf.add("\t");
            buf.add(cacheKeys.get(dotPath).toHex());
            buf.add("\n");
        }
        File.saveContent(manifestPath(), buf.toString());

        var mbuf = new StringBuf();
        for (bytesHash in srcKeyByBytesNext.keys()) {
            mbuf.add(bytesHash);
            mbuf.add("\t");
            mbuf.add(srcKeyByBytesNext.get(bytesHash).toHex());
            mbuf.add("\n");
        }
        File.saveContent(srcMemoPath(), mbuf.toString());
    }

    function manifestPath():String {
        return Path.join([ outputDirectory, ".hx2go_cache" ]);
    }

    function srcMemoPath():String {
        return Path.join([ outputDirectory, ".hx2go_srcmemo" ]);
    }

    function load():Map<String, Bytes> {
        return loadHexTsv(manifestPath());
    }

    function loadSrcMemo():Map<String, Bytes> {
        return loadHexTsv(srcMemoPath());
    }

    function loadHexTsv(path:String):Map<String, Bytes> {
        var out = new Map<String, Bytes>();
        if (!enabled || !FileSystem.exists(path))
            return out;
        for (line in File.getContent(path).split("\n")) {
            var tab = line.indexOf("\t");
            if (tab < 0) continue;
            try {
                out.set(line.substr(0, tab), Bytes.ofHex(line.substr(tab + 1)));
            } catch (_:Dynamic) {}
        }
        return out;
    }

    function computeModuleKey(codegenVersion:String, archive:HxbArchive, mod:HxbModule):Bytes {
        var depKeys:Array<Bytes> = [];
        for (imp in mod.imports) {
            var depPath = imp.pack.length > 0 ? '${imp.pack.join(".")}.${imp.name}' : imp.name;
            if (depPath == mod.dotPath()) continue;
            var ref = archive.findModule(depPath, "go");
            if (ref == null) continue;
            depKeys.push(depSourceKey(archive, depPath, ref));
        }
        depKeys.sort((a, b) -> a.compare(b));

        var buf = new BytesBuffer();
        buf.addString(codegenVersion);
        buf.addInt32(0);
        buf.add(ownSourceKey(archive, mod));
        buf.addInt32(0);
        for (k in depKeys) {
            buf.add(k);
            buf.addInt32(0);
        }
        return buf.getBytes();
    }

    function ownSourceKey(archive:HxbArchive, mod:HxbModule):Bytes {
        var dotPath = mod.dotPath();
        var cached = cacheSourceKeys.get(dotPath);
        if (cached != null) return cached;
        var ref = archive.findModule(dotPath, "go");
        var rawBytes = ref == null ? null : archive.getBytes(ref.entryPath);
        var key = sourceKeyFromBytes(dotPath, rawBytes, () -> mod);
        cacheSourceKeys.set(dotPath, key);
        return key;
    }

    function depSourceKey(archive:HxbArchive, depPath:String, ref:ModuleRef):Bytes {
        var cached = cacheSourceKeys.get(depPath);
        if (cached != null) return cached;
        var rawBytes = archive.getBytes(ref.entryPath);
        var key = sourceKeyFromBytes(depPath, rawBytes, () -> archive.decode(ref));
        cacheSourceKeys.set(depPath, key);
        return key;
    }

    function sourceKeyFromBytes(dotPath:String, rawBytes:Null<Bytes>, decodeFn:Void->HxbModule):Bytes {
        if (rawBytes != null) {
            var bytesHash = hashBytes(rawBytes).toHex();
            var memo = srcKeyByBytes.get(bytesHash);
            if (memo != null) {
                srcKeyByBytesNext.set(bytesHash, memo);
                return memo;
            }
            var key = computeModuleSourceKey(decodeFn());
            srcKeyByBytesNext.set(bytesHash, key);
            return key;
        }
        return computeModuleSourceKey(decodeFn());
    }

    function computeModuleSourceKey(mod:HxbModule):Bytes {
        var dotPath = mod.dotPath();
        var cached = cacheSourceKeys.get(dotPath);
        if (cached != null) return cached;

        var buf = new BytesBuffer();
        if (mod.source != null) {
            for (chunk in mod.source.chunks) {
                if (chunk.kind == EXD)
                    continue;
                buf.add(hashBytes(chunk.data));
                buf.addInt32(0);
            }
        }
        // position free body content EXD substitute
        var bodies = new StringBuf();
        for (type in mod.types) {
            switch type {
                case MClass(c):
                    hashFieldBody(bodies, c.constructor);
                    hashFieldBody(bodies, c.init);
                    for (f in c.fields) hashFieldBody(bodies, f);
                    for (f in c.statics) hashFieldBody(bodies, f);
                case _:
            }
        }
        buf.add(hashBytes(Bytes.ofString(bodies.toString())));

        var key = hashBytes(buf.getBytes());
        cacheSourceKeys.set(dotPath, key);
        return key;
    }

    function hashFieldBody(buf:StringBuf, f:Null<HxbClassField>):Void {
        if (f == null || f.expr == null) return;
        buf.add(f.name);
        buf.add("\u0000");
        buf.add(try printer.expr(f.expr.expr) catch (_:Dynamic) "?body");
        buf.add("\u0001");
    }

    inline function hashBytes(b:Bytes):Bytes {
        #if go
        var sum:go.GoArray<go.Byte, 16> = go.crypto.Md5_.sum(b.getData());
        return haxe.io.Bytes.ofData(sum.toSlice());
        #else
        return Md5.make(b);
        #end
    }

    static function bytesEqual(a:Null<Bytes>, b:Null<Bytes>):Bool {
        if (a == null || b == null) return a == b;
        return a.compare(b) == 0;
    }
}
