package hx2go;

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

class Cache {
    final enabled:Bool;
    final outputDirectory:String;
    final cacheKeys:Map<String, String>;

    // a module imported by N others is fingerprinted once.
    final fingerprintMemo:Map<String, String> = new Map();

    // fast path byte comparison
    final fpByBytes:Map<String, String>;
    final fpByBytesNext:Map<String, String> = new Map();

    // shared printer for printing out the HXB output to be hashed
    final printer:TypedExprPrinter = new TypedExprPrinter();

    public function new(enabled:Bool, outputDirectory:String) {
        this.enabled = enabled;
        this.outputDirectory = outputDirectory;
        this.cacheKeys = load();
        this.fpByBytes = loadFpMemo();
    }

    public function isHit(codegenVersion:String, archive:HxbArchive, mod:HxbModule, res:ModuleRef):Bool {
        if (!enabled) return false;

        var dotPath = res.dotPath();
        var key = computeModuleKey(codegenVersion, archive, mod, res);
        if (cacheKeys.get(dotPath) == key) {
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
            buf.add('$dotPath\t${cacheKeys.get(dotPath)}\n');
        }
        File.saveContent(manifestPath(), buf.toString());

        var fbuf = new StringBuf();
        for (bytesHash in fpByBytesNext.keys()) {
            fbuf.add('$bytesHash\t${fpByBytesNext.get(bytesHash)}\n');
        }
        File.saveContent(fpMemoPath(), fbuf.toString());
    }

    function manifestPath():String {
        return Path.join([ outputDirectory, ".hx2go_cache" ]);
    }

    function fpMemoPath():String {
        return Path.join([ outputDirectory, ".hx2go_fpmemo" ]);
    }

    function loadFpMemo():Map<String, String> {
        var out = new Map<String, String>();
        if (!enabled) return out;
        var path = fpMemoPath();
        if (!FileSystem.exists(path)) return out;
        for (line in File.getContent(path).split("\n")) {
            var tab = line.indexOf("\t");
            if (tab < 0) continue;
            out.set(line.substr(0, tab), line.substr(tab + 1));
        }
        return out;
    }

    function load():Map<String, String> {
        var out = new Map<String, String>();
        if (!enabled) return out;
        var path = manifestPath();
        if (!FileSystem.exists(path)) return out;
        for (line in File.getContent(path).split("\n")) {
            var tab = line.indexOf("\t");
            if (tab < 0) continue;
            out.set(line.substr(0, tab), line.substr(tab + 1));
        }
        return out;
    }
    
    function fingerprintOf(archive:HxbArchive, dotPath:String, ?decoded:HxbModule):String {
        var memoized = fingerprintMemo.get(dotPath);
        if (memoized != null) return memoized;

        var ref = archive.findModule(dotPath, "go");
        if (ref == null) {
            fingerprintMemo.set(dotPath, "");
            return "";
        }

        var bytes = archive.getBytes(ref.entryPath);
        var bytesHash = bytes != null ? Md5.make(bytes).toHex() : null;

        var fp = bytesHash != null ? fpByBytes.get(bytesHash) : null;
        if (fp == null) {
            fp = hashModule(decoded != null ? decoded : archive.decode(ref));
        }
        if (bytesHash != null) fpByBytesNext.set(bytesHash, fp);
        fingerprintMemo.set(dotPath, fp);
        return fp;
    }

    function hashModule(mod:HxbModule):String {
        var buf = new StringBuf();
        for (type in mod.types) {
            switch type {
                case MClass(c):
                    buf.add("C:"); buf.add(c.path.dotPath());
                    buf.add(":"); buf.add(Std.string(c.flags));
                    buf.add(":"); buf.add(Std.string(c.kind));
                    if (c.superClass != null) { buf.add(":super="); buf.add(c.superClass.t.dotPath()); }
                    for (i in c.interfaces) { buf.add(":iface="); buf.add(i.t.dotPath()); }
                    buf.add("\n");
                    hashField(buf, c.constructor);
                    hashField(buf, c.init);
                    for (f in c.fields) hashField(buf, f);
                    for (f in c.statics) hashField(buf, f);
                case MEnum(e):
                    buf.add("E:"); buf.add(e.path.dotPath());
                    buf.add(":"); buf.add(Std.string(e.flags)); buf.add("\n");
                    for (ctor in e.constructors) {
                        buf.add(ctor.name); buf.add("#"); buf.add(Std.string(ctor.index));
                        buf.add("="); buf.add(fieldTypeStr(ctor.type)); buf.add("\u0001");
                    }
                case MAbstract(a):
                    buf.add("A:"); buf.add(a.path.dotPath());
                    buf.add(":under="); buf.add(fieldTypeStr(a.underlyingThis));
                    if (a.impl != null) { buf.add(":impl="); buf.add(a.impl.dotPath()); }
                    for (t in a.from) { buf.add(":from="); buf.add(fieldTypeStr(t)); }
                    for (t in a.to) { buf.add(":to="); buf.add(fieldTypeStr(t)); }
                    buf.add("\n");
                case MTypedef(t):
                    buf.add("T:"); buf.add(t.path.dotPath()); buf.add("\n");
            }
        }
        return Md5.encode(buf.toString());
    }

    function hashField(buf:StringBuf, f:Null<HxbClassField>):Void {
        if (f == null) return;
        buf.add(f.name);
        buf.add("\u0000");
        buf.add(Std.string(f.flags));
        buf.add("\u0000");

        buf.add(fieldTypeStr(f.type));
        buf.add("\u0000");
        if (f.expr != null) {
            printer.indent = 0;
            printer.typeParams = [];
            printer.fieldParams = [];
            buf.add(try printer.expr(f.expr.expr) catch (_:Dynamic) "?body");
        }
        buf.add("\u0001");
    }


    function fieldTypeStr(t:hxb.HxbType):String {
        return try printer.type(t) catch (_:Dynamic) "?type";
    }

    function computeModuleKey(codegenVersion:String, archive:HxbArchive, mod:HxbModule, res:ModuleRef):String {
        var own = fingerprintOf(archive, res.dotPath(), mod);

        var depHashes:Array<String> = [];
        for (imp in mod.imports) {
            var depPath = imp.pack.length > 0 ? '${imp.pack.join(".")}.${imp.name}' : imp.name;
            if (depPath == res.dotPath()) continue;
            var depHash = fingerprintOf(archive, depPath);
            if (depHash != "") {
                depHashes.push(depHash);
            }
        }
        depHashes.sort((a, b) -> a > b ? 1 : -1);

        var parts = [codegenVersion, own].concat(depHashes);
        return Md5.encode(parts.join("\u0000"));
    }
}
