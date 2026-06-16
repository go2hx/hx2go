package hx2go.hxb;

/**
	A reference to one module inside an `HxbArchive`.

	Archives store each module as a zip entry named `<target>/<pack…>/<Name>.hxb`,
	so a `ModuleRef` decomposes that into the compilation `target` (e.g. `js`,
	`eval`, `cpp`), the package `pack` and the module `name`.
**/
@:structInit
class ModuleRef {
	/** The compilation target the module was serialized for (first path segment). **/
	public final target:String;

	/** The package parts (may be empty for top-level modules). **/
	public final pack:Array<String>;

	/** The module name (the file name without the `.hxb` extension). **/
	public final name:String;

	/** The exact zip entry path this module lives at. **/
	public final entryPath:String;

	public function new(target:String, pack:Array<String>, name:String, entryPath:String) {
		this.target = target;
		this.pack = pack;
		this.name = name;
		this.entryPath = entryPath;
	}

	/** The dotted module path without the target, e.g. `haxe.ds.Vector`. **/
	public function dotPath():String {
		return pack.length == 0 ? name : pack.join(".") + "." + name;
	}

	/** Build a `ModuleRef` from a raw zip entry path. **/
	public static function ofEntryPath(entryPath:String):ModuleRef {
		final parts = entryPath.split("/");
		var last = parts.pop();
		if (last == null)
			last = "";
		final name = StringTools.endsWith(last, ".hxb") ? last.substr(0, last.length - 4) : last;
		final target = parts.length > 0 ? parts.shift() : "";
		return new ModuleRef(target, parts, name, entryPath);
	}

	/** Build the canonical entry path for a `(target, pack, name)` triple. **/
	public static function toEntryPath(target:String, pack:Array<String>, name:String):String {
		final segs = [target];
		for (p in pack)
			segs.push(p);
		segs.push(name + ".hxb");
		return segs.join("/");
	}

	public function toString():String {
		return '$target:${dotPath()}';
	}
}
