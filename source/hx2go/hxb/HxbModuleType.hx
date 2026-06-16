package hx2go.hxb;

import hx2go.hxb.Ast.HxbDoc;
import hx2go.hxb.Ast.HxbMetaEntry;
import hx2go.hxb.Ast.HxbExpr;
import hx2go.hxb.Ast.HxbAstField;
import hx2go.hxb.Ast.HxbBinop;
import hx2go.hxb.Ast.HxbUnop;
import hx2go.hxb.HxbClassField.HxbTypeParam;

/** A class/interface extends/implements relation: the related type + its params. **/
typedef HxbTypeRelation = {
	var t:TypePath;
	var params:Array<HxbType>;
};

/** A `using` entry on a module type. **/
typedef HxbUsing = {
	var c:TypePath;
	var pos:Pos;
};

/** An abstract operator overload binding. **/
typedef HxbAbstractOp = {
	var op:HxbBinop;
	var field:FieldRef;
};

/** An abstract unary-operator overload binding. **/
typedef HxbAbstractUnop = {
	var op:HxbUnop;
	var postFix:Bool;
	var field:FieldRef;
};

/**
	A module type defined in a module: a class, enum, abstract or typedef.

	This is the main type of the module; the concrete declaration classes
	(`HxbClass`, `HxbEnum`, `HxbAbstract`, `HxbTypedef`) and their helpers are
	co-located — `import hxb.HxbModuleType.HxbClass;` to use them.
**/
enum HxbModuleType {
	MClass(c:HxbClass);
	MEnum(e:HxbEnum);
	MAbstract(a:HxbAbstract);
	MTypedef(t:HxbTypedef);
}

/** A defined class or interface (`Type.tclass`). **/
class HxbClass {
	public var path:TypePath;
	public var pos:Pos;
	public var namePos:Pos;
	public var isPrivate:Bool;
	public var doc:Null<HxbDoc>;
	public var meta:Array<HxbMetaEntry>;
	public var params:Array<HxbTypeParam>;
	public var usings:Array<HxbUsing>;
	public var kind:HxbClassKind;
	public var flags:Int;
	public var superClass:Null<HxbTypeRelation>;
	public var interfaces:Array<HxbTypeRelation>;
	public var dynamicType:Null<HxbType>;
	public var arrayAccess:Null<HxbType>;
	public var constructor:Null<HxbClassField>;
	public var init:Null<HxbClassField>;
	public var fields:Array<HxbClassField>;
	public var statics:Array<HxbClassField>;

	public function new(path:TypePath, pos:Pos, namePos:Pos) {
		this.path = path;
		this.pos = pos;
		this.namePos = namePos;
		this.isPrivate = false;
		this.doc = null;
		this.meta = [];
		this.params = [];
		this.usings = [];
		this.kind = KNormal;
		this.flags = 0;
		this.superClass = null;
		this.interfaces = [];
		this.dynamicType = null;
		this.arrayAccess = null;
		this.constructor = null;
		this.init = null;
		this.fields = [];
		this.statics = [];
	}

	public function toString():String
		return "class " + path.dotPath();
}

/** Class kinds (`Type.tclass_kind`). **/
enum HxbClassKind {
	KNormal;
	KExpr(e:HxbExpr);
	KGeneric;
	KGenericInstance(c:TypePath, params:Array<HxbType>);
	KMacroType;
	KGenericBuild(fields:Array<HxbAstField>);
	KAbstractImpl(a:TypePath);
	KModuleFields;
}

/** A defined enum (`Type.tenum`). **/
class HxbEnum {
	public var path:TypePath;
	public var pos:Pos;
	public var namePos:Pos;
	public var isPrivate:Bool;
	public var doc:Null<HxbDoc>;
	public var meta:Array<HxbMetaEntry>;
	public var params:Array<HxbTypeParam>;
	public var usings:Array<HxbUsing>;
	public var flags:Int;
	public var names:Array<String>;
	public var constructors:Array<HxbEnumField>;

	public function new(path:TypePath, pos:Pos, namePos:Pos) {
		this.path = path;
		this.pos = pos;
		this.namePos = namePos;
		this.isPrivate = false;
		this.doc = null;
		this.meta = [];
		this.params = [];
		this.usings = [];
		this.flags = 0;
		this.names = [];
		this.constructors = [];
	}

	public function toString():String
		return "enum " + path.dotPath();
}

/** An enum constructor (`Type.tenum_field`). **/
class HxbEnumField {
	public var name:String;
	public var pos:Pos;
	public var namePos:Pos;
	public var index:Int;
	public var type:HxbType;
	public var doc:Null<HxbDoc>;
	public var meta:Array<HxbMetaEntry>;
	public var params:Array<HxbTypeParam>;

	public function new(name:String, pos:Pos, namePos:Pos, index:Int) {
		this.name = name;
		this.pos = pos;
		this.namePos = namePos;
		this.index = index;
		this.type = TVoid;
		this.doc = null;
		this.meta = [];
		this.params = [];
	}

	public function toString():String
		return name;
}

/** A defined abstract (`Type.tabstract`). **/
class HxbAbstract {
	public var path:TypePath;
	public var pos:Pos;
	public var namePos:Pos;
	public var isPrivate:Bool;
	public var doc:Null<HxbDoc>;
	public var meta:Array<HxbMetaEntry>;
	public var params:Array<HxbTypeParam>;
	public var usings:Array<HxbUsing>;
	public var impl:Null<TypePath>;
	public var underlyingThis:HxbType;
	public var from:Array<HxbType>;
	public var to:Array<HxbType>;
	public var isExtern:Bool;
	public var isEnum:Bool;
	public var arrayAccess:Array<FieldRef>;
	public var read:Null<FieldRef>;
	public var write:Null<FieldRef>;
	public var call:Null<FieldRef>;
	public var constructor:Null<FieldRef>;
	public var ops:Array<HxbAbstractOp>;
	public var unops:Array<HxbAbstractUnop>;
	public var fromField:Array<FieldRef>;
	public var toField:Array<FieldRef>;

	public function new(path:TypePath, pos:Pos, namePos:Pos) {
		this.path = path;
		this.pos = pos;
		this.namePos = namePos;
		this.isPrivate = false;
		this.doc = null;
		this.meta = [];
		this.params = [];
		this.usings = [];
		this.impl = null;
		this.underlyingThis = TVoid;
		this.from = [];
		this.to = [];
		this.isExtern = false;
		this.isEnum = false;
		this.arrayAccess = [];
		this.read = null;
		this.write = null;
		this.call = null;
		this.constructor = null;
		this.ops = [];
		this.unops = [];
		this.fromField = [];
		this.toField = [];
	}

	public function toString():String
		return "abstract " + path.dotPath();
}

/** A defined typedef (`Type.tdef`). **/
class HxbTypedef {
	public var path:TypePath;
	public var pos:Pos;
	public var namePos:Pos;
	public var isPrivate:Bool;
	public var doc:Null<HxbDoc>;
	public var meta:Array<HxbMetaEntry>;
	public var params:Array<HxbTypeParam>;
	public var usings:Array<HxbUsing>;
	public var type:HxbType;

	public function new(path:TypePath, pos:Pos, namePos:Pos) {
		this.path = path;
		this.pos = pos;
		this.namePos = namePos;
		this.isPrivate = false;
		this.doc = null;
		this.meta = [];
		this.params = [];
		this.usings = [];
		this.type = TVoid;
	}

	public function toString():String
		return "typedef " + path.dotPath();
}
