package hx2go.hxb;

import hx2go.hxb.HxbType.HxbAnon;
import hx2go.hxb.HxbModuleType.HxbClass;
import hx2go.hxb.HxbModuleType.HxbEnum;
import hx2go.hxb.HxbModuleType.HxbAbstract;
import hx2go.hxb.HxbModuleType.HxbTypedef;

/** An `import`/dependency recorded in a module's `IMP` chunk. **/
typedef HxbImport = {
	var pack:Array<String>;
	var name:String;
};

/**
	A fully decoded HXB module: its path and source file, the module types it
	defines, its imports, and the symbol tables (anon structures and external
	type references) that its expressions and type instances point at.

	Obtain one via `hxb.Hxb.decodeModule`, `HxbArchive.decode`, or
	`hxb.read.ModuleDecoder`. The original `source` chunks are kept so the module
	can be inspected or re-serialized at the container level.
**/
class HxbModule {
	public var pack:Array<String>;
	public var name:String;
	public var file:String;

	/** Number of anonymous structures the module allocates. **/
	public var anonCount:Int;

	/** Number of monomorphs the module allocates. **/
	public var monoCount:Int;

	/** The module types defined here, in declaration order. **/
	public var types:Array<HxbModuleType>;

	/** Imported module paths (the `IMP` chunk). **/
	public var imports:Array<HxbImport>;

	/** Anonymous structure table, indexed as referenced by type instances. **/
	public var anons:Array<HxbAnon>;

	/** External class references (`CLR`). **/
	public var classRefs:Array<TypePath>;

	/** External enum references (`ENR`). **/
	public var enumRefs:Array<TypePath>;

	/** External abstract references (`ABR`). **/
	public var abstractRefs:Array<TypePath>;

	/** External typedef references (`TDR`). **/
	public var typedefRefs:Array<TypePath>;

	/** The raw container the module was decoded from, if any. **/
	public var source:Null<ChunkedModule>;

	public function new(pack:Array<String>, name:String, file:String) {
		this.pack = pack;
		this.name = name;
		this.file = file;
		this.anonCount = 0;
		this.monoCount = 0;
		this.types = [];
		this.imports = [];
		this.anons = [];
		this.classRefs = [];
		this.enumRefs = [];
		this.abstractRefs = [];
		this.typedefRefs = [];
		this.source = null;
	}

	/** The dotted module path, e.g. `haxe.ds.Vector`. **/
	public function dotPath():String {
		return pack.length == 0 ? name : pack.join(".") + "." + name;
	}

	/** All classes defined in this module. **/
	public function classes():Array<HxbClass> {
		final out = [];
		for (t in types)
			switch (t) {
				case MClass(c): out.push(c);
				case _:
			}
		return out;
	}

	/** All enums defined in this module. **/
	public function enums():Array<HxbEnum> {
		final out = [];
		for (t in types)
			switch (t) {
				case MEnum(e): out.push(e);
				case _:
			}
		return out;
	}

	/** All abstracts defined in this module. **/
	public function abstracts():Array<HxbAbstract> {
		final out = [];
		for (t in types)
			switch (t) {
				case MAbstract(a): out.push(a);
				case _:
			}
		return out;
	}

	/** All typedefs defined in this module. **/
	public function typedefs():Array<HxbTypedef> {
		final out = [];
		for (t in types)
			switch (t) {
				case MTypedef(t2): out.push(t2);
				case _:
			}
		return out;
	}

	/** Find a defined module type by its (sub-)type name. **/
	public function findType(name:String):Null<HxbModuleType> {
		for (t in types) {
			final p = switch (t) {
				case MClass(c): c.path;
				case MEnum(e): e.path;
				case MAbstract(a): a.path;
				case MTypedef(td): td.path;
			}
			if (p.name == name)
				return t;
		}
		return null;
	}

	public function toString():String {
		return 'HxbModule(${dotPath()}, ${types.length} types)';
	}
}
