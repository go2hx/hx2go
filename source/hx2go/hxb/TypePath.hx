package hx2go.hxb;

/**
	The fully-qualified path of a module type: its package, the *module* it lives
	in, and the type's own name (which differs from the module name for secondary
	types declared in the same file).

	HXB stores cross-references as these paths (the compiler's `full_path`), so
	`hxb` exposes them directly instead of opaque indices.
**/
@:structInit
class TypePath {
	public var pack:Array<String>;
	public var moduleName:String;
	public var name:String;

	public function new(pack:Array<String>, moduleName:String, name:String) {
		this.pack = pack;
		this.moduleName = moduleName;
		this.name = name;
	}

	/** The dotted module path, e.g. `haxe.ds.Vector`. **/
	public function moduleDotPath():String {
		return pack.length == 0 ? moduleName : pack.join(".") + "." + moduleName;
	}

	/** The dotted type path. Equals the module path unless this is a sub-type. **/
	public function dotPath():String {
		final m = moduleDotPath();
		return name == moduleName ? m : m + "." + name;
	}

	public function toString():String {
		return dotPath();
	}
}
