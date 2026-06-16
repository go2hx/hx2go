package hx2go.hxb;

/**
	The untyped Haxe AST as serialized inside HXB (metadata arguments, `@:const`
	type parameters, `KExpr`/`KGenericBuild` class kinds, …).

	It is a clean, self-contained mirror of `haxe.macro.Expr` so it can be used
	at runtime on every target. The main type is `HxbExpr`; the rest of the AST
	vocabulary lives alongside it in this module — import what you need, e.g.
	`import hxb.Ast.HxbBinop;`.
**/
@:structInit
class HxbExpr {
	public var expr:HxbExprDef;
	public var pos:Pos;

	public function new(expr:HxbExprDef, pos:Pos) {
		this.expr = expr;
		this.pos = pos;
	}

	public function toString():String
		return Std.string(expr);
}

/** An object-declaration field in an `EObjectDecl`. **/
typedef HxbObjectField = {
	var name:String;
	var pos:Pos;
	var quotes:HxbQuoteStatus;
	var expr:HxbExpr;
};

/** A `switch` case in an `ESwitch`. **/
typedef HxbCase = {
	var values:Array<HxbExpr>;
	var guard:Null<HxbExpr>;
	var expr:Null<HxbExpr>;
	var pos:Pos;
};

/** A `catch` clause in an `ETry`. **/
typedef HxbCatch = {
	var name:HxbPlacedName;
	var type:Null<HxbTypeHint>;
	var expr:HxbExpr;
	var pos:Pos;
};

/** The untyped expression variants (`Ast.expr_def`). **/
enum HxbExprDef {
	EConst(c:HxbConstant);
	EArray(e1:HxbExpr, e2:HxbExpr);
	EBinop(op:HxbBinop, e1:HxbExpr, e2:HxbExpr);
	EField(e:HxbExpr, field:String, kind:HxbEFieldKind);
	EParenthesis(e:HxbExpr);
	EObjectDecl(fields:Array<HxbObjectField>);
	EArrayDecl(values:Array<HxbExpr>);
	ECall(e:HxbExpr, params:Array<HxbExpr>);
	ENew(t:HxbPlacedTypePath, params:Array<HxbExpr>);
	EUnop(op:HxbUnop, postFix:Bool, e:HxbExpr);
	EVars(vars:Array<HxbEVar>);
	EFunction(kind:HxbFunctionKind, f:HxbFunction);
	EBlock(exprs:Array<HxbExpr>);
	EFor(it:HxbExpr, expr:HxbExpr);
	EIf(econd:HxbExpr, eif:HxbExpr, eelse:Null<HxbExpr>);
	EWhile(econd:HxbExpr, e:HxbExpr, normalWhile:Bool);
	ESwitch(e:HxbExpr, cases:Array<HxbCase>, edef:Null<{expr:Null<HxbExpr>, pos:Pos}>);
	ETry(e:HxbExpr, catches:Array<HxbCatch>);
	EReturn(e:Null<HxbExpr>);
	EBreak;
	EContinue;
	EUntyped(e:HxbExpr);
	EThrow(e:HxbExpr);
	ECast(e:HxbExpr, t:Null<HxbTypeHint>);
	EIs(e:HxbExpr, t:HxbTypeHint);
	EDisplay(e:HxbExpr, kind:HxbDisplayKind);
	ETernary(econd:HxbExpr, eif:HxbExpr, eelse:HxbExpr);
	ECheckType(e:HxbExpr, t:HxbTypeHint);
	EMeta(entry:HxbMetaEntry, e:HxbExpr);
}

/** A literal constant. **/
enum HxbConstant {
	CInt(v:String, suffix:Null<String>);
	CFloat(v:String, suffix:Null<String>);
	CString(s:String, kind:HxbStringKind);
	CIdent(s:String);
	CRegexp(r:String, opt:String);
}

/** How a string literal was quoted. **/
enum HxbStringKind {
	SDoubleQuotes;
	SSingleQuotes;
}

/** Whether an object field key was quoted. **/
enum HxbQuoteStatus {
	NoQuotes;
	DoubleQuotes;
}

/** Normal (`.`) vs null-safe (`?.`) field access. **/
enum HxbEFieldKind {
	EFNormal;
	EFSafe;
}

/** Binary operators (`Ast.binop`). **/
enum HxbBinop {
	OpAdd;
	OpMult;
	OpDiv;
	OpSub;
	OpAssign;
	OpEq;
	OpNotEq;
	OpGt;
	OpGte;
	OpLt;
	OpLte;
	OpAnd;
	OpOr;
	OpXor;
	OpBoolAnd;
	OpBoolOr;
	OpShl;
	OpShr;
	OpUShr;
	OpMod;
	OpInterval;
	OpArrow;
	OpIn;
	OpNullCoal;
	OpAssignOp(op:HxbBinop);
}

/** Unary operators (`Ast.unop`). **/
enum HxbUnop {
	OpIncrement;
	OpDecrement;
	OpNot;
	OpNeg;
	OpNegBits;
	OpSpread;
}

/** Display/completion request kinds. **/
enum HxbDisplayKind {
	DKCall;
	DKDot;
	DKStructure;
	DKMarked;
	DKPattern(outermostExpr:Bool);
}

/** A name with a position. **/
@:structInit
class HxbPlacedName {
	public var name:String;
	public var pos:Pos;

	public function new(name:String, pos:Pos) {
		this.name = name;
		this.pos = pos;
	}

	public function toString():String
		return name;
}

/** One variable in an `EVars`. **/
@:structInit
class HxbEVar {
	public var name:HxbPlacedName;
	public var isFinal:Bool;
	public var isStatic:Bool;
	public var type:Null<HxbTypeHint>;
	public var expr:Null<HxbExpr>;
	public var meta:Array<HxbMetaEntry>;

	public function new(name, isFinal, isStatic, type, expr, meta) {
		this.name = name;
		this.isFinal = isFinal;
		this.isStatic = isStatic;
		this.type = type;
		this.expr = expr;
		this.meta = meta;
	}
}

/** A function literal/declaration. **/
@:structInit
class HxbFunction {
	public var params:Array<HxbAstTypeParam>;
	public var args:Array<HxbFunctionArg>;
	public var ret:Null<HxbTypeHint>;
	public var expr:Null<HxbExpr>;

	public function new(params, args, ret, expr) {
		this.params = params;
		this.args = args;
		this.ret = ret;
		this.expr = expr;
	}
}

/** A function argument. **/
@:structInit
class HxbFunctionArg {
	public var name:HxbPlacedName;
	public var opt:Bool;
	public var meta:Array<HxbMetaEntry>;
	public var type:Null<HxbTypeHint>;
	public var value:Null<HxbExpr>;

	public function new(name, opt, meta, type, value) {
		this.name = name;
		this.opt = opt;
		this.meta = meta;
		this.type = type;
		this.value = value;
	}
}

/** Whether/how an `EFunction` is named. **/
enum HxbFunctionKind {
	FKAnonymous;
	FKNamed(name:HxbPlacedName, inlined:Bool);
	FKArrow;
}

/** A syntactic type annotation: a complex type with its position. **/
@:structInit
class HxbTypeHint {
	public var type:HxbComplexType;
	public var pos:Pos;

	public function new(type, pos) {
		this.type = type;
		this.pos = pos;
	}
}

/** Syntactic ("complex") types (`Ast.complex_type`). **/
enum HxbComplexType {
	CTPath(p:HxbPlacedTypePath);
	CTFunction(args:Array<HxbTypeHint>, ret:HxbTypeHint);
	CTAnonymous(fields:Array<HxbAstField>);
	CTParent(t:HxbTypeHint);
	CTExtend(p:Array<HxbPlacedTypePath>, fields:Array<HxbAstField>);
	CTOptional(t:HxbTypeHint);
	CTNamed(n:HxbPlacedName, t:HxbTypeHint);
	CTIntersection(types:Array<HxbTypeHint>);
}

/** A syntactic type path. **/
@:structInit
class HxbAstTypePath {
	public var pack:Array<String>;
	public var name:String;
	public var params:Array<HxbTypeParamOrConst>;
	public var sub:Null<String>;

	public function new(pack, name, params, sub) {
		this.pack = pack;
		this.name = name;
		this.params = params;
		this.sub = sub;
	}
}

/** A syntactic type path with positions. **/
@:structInit
class HxbPlacedTypePath {
	public var path:HxbAstTypePath;
	public var posFull:Pos;
	public var posPath:Pos;

	public function new(path, posFull, posPath) {
		this.path = path;
		this.posFull = posFull;
		this.posPath = posPath;
	}
}

/** A syntactic type-parameter argument: a type or a constant expression. **/
enum HxbTypeParamOrConst {
	TPType(t:HxbTypeHint);
	TPExpr(e:HxbExpr);
}

/** A syntactic type parameter declaration. **/
@:structInit
class HxbAstTypeParam {
	public var name:HxbPlacedName;
	public var params:Array<HxbAstTypeParam>;
	public var constraints:Null<HxbTypeHint>;
	public var def:Null<HxbTypeHint>;
	public var meta:Array<HxbMetaEntry>;

	public function new(name, params, constraints, def, meta) {
		this.name = name;
		this.params = params;
		this.constraints = constraints;
		this.def = def;
		this.meta = meta;
	}
}

/** Field access modifiers (`Ast.access`). **/
enum HxbAccess {
	APublic;
	APrivate;
	AStatic;
	AOverride;
	ADynamic;
	AInline;
	AMacro;
	AFinal;
	AExtern;
	AAbstract;
	AOverload;
	AEnum;
}

/** An access modifier with its position. **/
@:structInit
class HxbPlacedAccess {
	public var access:HxbAccess;
	public var pos:Pos;

	public function new(access, pos) {
		this.access = access;
		this.pos = pos;
	}
}

/** Syntactic field kinds (`Ast.field_kind`). **/
enum HxbAstFieldKind {
	FVar(type:Null<HxbTypeHint>, expr:Null<HxbExpr>);
	FFun(f:HxbFunction);
	FProp(get:HxbPlacedName, set:HxbPlacedName, type:Null<HxbTypeHint>, expr:Null<HxbExpr>);
}

/** A syntactic class field (as found in `CTAnonymous`/`CTExtend`). **/
@:structInit
class HxbAstField {
	public var name:HxbPlacedName;
	public var doc:Null<HxbDoc>;
	public var pos:Pos;
	public var meta:Array<HxbMetaEntry>;
	public var access:Array<HxbPlacedAccess>;
	public var kind:HxbAstFieldKind;

	public function new(name, doc, pos, meta, access, kind) {
		this.name = name;
		this.doc = doc;
		this.pos = pos;
		this.meta = meta;
		this.access = access;
		this.kind = kind;
	}
}

/** A single metadata entry `@name(params)`. **/
@:structInit
class HxbMetaEntry {
	public var name:String;
	public var params:Array<HxbExpr>;
	public var pos:Pos;

	public function new(name, params, pos) {
		this.name = name;
		this.params = params;
		this.pos = pos;
	}

	public function toString():String
		return "@" + name;
}

/** Documentation: the type/field's own doc plus inherited docs. **/
@:structInit
class HxbDoc {
	public var own:Null<String>;
	public var inherited:Array<String>;

	public function new(own, inherited) {
		this.own = own;
		this.inherited = inherited;
	}
}
