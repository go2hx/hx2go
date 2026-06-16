package hx2go.hxb;

import hx2go.hxb.Ast.HxbDoc;
import hx2go.hxb.Ast.HxbMetaEntry;

/**
	A typed class field (`Type.tclass_field`): the fully resolved member, static,
	constructor, init, abstract or anonymous-structure field.

	Fields are read in two passes by HXB — a *forward* pass (name/positions/meta/
	overloads) and a *data* pass (type/kind/params/flags/expr) — so the
	expression and type may be filled in after the field object is created. By
	the time a decoded `HxbModule` is handed back, fields are fully populated.

	Co-located helper types (`HxbFieldKind`, `HxbTypeParam`, …) live in this
	module; `import hxb.HxbClassField.HxbFieldKind;` to use them.
**/
class HxbClassField {
	public var name:String;
	public var pos:Pos;
	public var namePos:Pos;
	public var doc:Null<HxbDoc>;
	public var meta:Array<HxbMetaEntry>;

	/** The field's type. A placeholder until the data pass fills it in. **/
	public var type:HxbType;

	public var kind:HxbFieldKind;
	public var params:Array<HxbTypeParam>;

	/** Bit flags (`cf_flags`): public/extern/final/abstract/overload/etc. **/
	public var flags:Int;

	/** The field's typed expression (and its unoptimized form), if any. **/
	public var expr:Null<HxbFieldExpr>;

	/** Overloads of this field, in declaration order. **/
	public var overloads:Array<HxbClassField>;

	public function new(name:String, pos:Pos, namePos:Pos, ?meta:Array<HxbMetaEntry>, ?overloads:Array<HxbClassField>) {
		this.name = name;
		this.pos = pos;
		this.namePos = namePos;
		this.meta = meta == null ? [] : meta;
		this.overloads = overloads == null ? [] : overloads;
		this.doc = null;
		this.type = TVoid;
		this.kind = KVar(AccNormal, AccNormal);
		this.params = [];
		this.flags = 0;
		this.expr = null;
	}

	public function toString():String
		return name;
}

/** A field's typed expression plus its pre-optimization version (if kept). **/
@:structInit
class HxbFieldExpr {
	public var expr:hx2go.hxb.Typed.HxbTypedExpr;
	public var unoptimized:Null<hx2go.hxb.Typed.HxbTypedExpr>;

	public function new(expr, unoptimized) {
		this.expr = expr;
		this.unoptimized = unoptimized;
	}
}

/** Whether a field is a method (and how) or a variable (and its accessors). **/
enum HxbFieldKind {
	KMethod(kind:HxbMethodKind);
	KVar(read:HxbVarAccess, write:HxbVarAccess);
}

/** Method kinds (`Type.method_kind`). **/
enum HxbMethodKind {
	MethNormal;
	MethInline;
	MethDynamic;
	MethMacro;
}

/** Variable accessor kinds (`Type.var_access`). **/
enum HxbVarAccess {
	AccNormal;
	AccNo;
	AccNever;
	AccCtor;
	AccCall;
	AccInline;
	AccRequire(s:String, message:Null<String>);
	AccPrivateCall;
}

/** A typed type parameter (`Type.typed_type_param`). **/
class HxbTypeParam {
	public var name:String;
	public var host:HxbTypeParamHost;
	public var path:TypePath;
	public var pos:Pos;
	public var meta:Array<HxbMetaEntry>;
	public var constraints:Array<HxbType>;
	public var def:Null<HxbType>;

	public function new(name:String, host:HxbTypeParamHost, path:TypePath, pos:Pos) {
		this.name = name;
		this.host = host;
		this.path = path;
		this.pos = pos;
		this.meta = [];
		this.constraints = [];
		this.def = null;
	}

	public function toString():String
		return name;
}

/** Where a type parameter is hosted (`Type.type_param_host`). **/
enum HxbTypeParamHost {
	TPHType;
	TPHConstructor;
	TPHMethod;
	TPHEnumConstructor;
	TPHAnonField;
	TPHLocal;
	TPHUnbound;
}
