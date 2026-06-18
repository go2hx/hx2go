package hx2go.hxb;

import hx2go.hxb.Ast.HxbBinop;
import hx2go.hxb.Ast.HxbUnop;
import hx2go.hxb.Ast.HxbQuoteStatus;
import hx2go.hxb.Ast.HxbMetaEntry;

/**
	The typed Haxe AST as serialized inside HXB — the contents of a field's
	`EXD` expression.

	It mirrors `haxe.macro.TypedExpr`/`TypedExprDef` as closely as a
	compiler-free library can: expression structure is exact, while the
	type-carrying parts (`t`, module-type and field references) use `hxb`'s
	symbolic model (`HxbType`, `TypePath`, `FieldRef`, …).

	`hxb.convert.ToMacro` maps these to the real `haxe.macro` types when you run
	inside a macro. The main type here is `HxbTypedExpr`.
**/
@:structInit
class HxbTypedExpr {
	public var expr:HxbTypedExprDef;
	public var t:HxbType;
	public var pos:Pos;

	public function new(expr:HxbTypedExprDef, t:HxbType, pos:Pos) {
		this.expr = expr;
		this.t = t;
		this.pos = pos;
	}

	public function toString():String
		return Std.string(expr);
}

/** A field of a `TObjectDecl`. **/
typedef HxbTObjectField = {
	var name:String;
	var pos:Pos;
	var quotes:HxbQuoteStatus;
	var expr:HxbTypedExpr;
};

/** A case of a `TSwitch`. **/
typedef HxbTCase = {
	var patterns:Array<HxbTypedExpr>;
	var expr:HxbTypedExpr;
};

/** A catch clause of a `TTry`. **/
typedef HxbTCatch = {
	var v:HxbVar;
	var expr:HxbTypedExpr;
};

/** An argument of a `TFunction`. **/
typedef HxbTFuncArg = {
	var v:HxbVar;
	var value:Null<HxbTypedExpr>;
};

/**
	The typed expression variants. Note HXB never serializes `TFor` (it is
	desugared to `TWhile` before serialization), so it has no constructor here.
**/
enum HxbTypedExprDef {
	TConst(c:HxbTConstant);
	TLocal(v:HxbVar);
	TArray(e1:HxbTypedExpr, e2:HxbTypedExpr);
	TBinop(op:HxbBinop, e1:HxbTypedExpr, e2:HxbTypedExpr);
	TField(e:HxbTypedExpr, fa:HxbFieldAccess);
	TTypeExpr(m:HxbModuleTypeRef);
	TParenthesis(e:HxbTypedExpr);
	TObjectDecl(fields:Array<HxbTObjectField>);
	TArrayDecl(el:Array<HxbTypedExpr>);
	TCall(e:HxbTypedExpr, el:Array<HxbTypedExpr>);
	TNew(c:TypePath, params:Array<HxbType>, el:Array<HxbTypedExpr>);
	TUnop(op:HxbUnop, postFix:Bool, e:HxbTypedExpr);
	TFunction(tfunc:HxbTFunc);
	TVar(v:HxbVar, expr:Null<HxbTypedExpr>);
	TBlock(el:Array<HxbTypedExpr>);
	TIf(econd:HxbTypedExpr, eif:HxbTypedExpr, eelse:Null<HxbTypedExpr>);
	TWhile(econd:HxbTypedExpr, e:HxbTypedExpr, normalWhile:Bool);
	TSwitch(subject:HxbTypedExpr, cases:Array<HxbTCase>, edef:Null<HxbTypedExpr>);
	TTry(e:HxbTypedExpr, catches:Array<HxbTCatch>);
	TReturn(e:Null<HxbTypedExpr>);
	TBreak;
	TContinue;
	TThrow(e:HxbTypedExpr);
	TCast(e:HxbTypedExpr, m:Null<HxbModuleTypeRef>);
	TMeta(m:HxbMetaEntry, e:HxbTypedExpr);
	TEnumParameter(e:HxbTypedExpr, ef:EnumFieldRef, index:Int);
	TEnumIndex(e:HxbTypedExpr);
	TIdent(s:String);
}

/** A typed constant (`Type.tconstant`). **/
enum HxbTConstant {
	TNull;
	TThis;
	TSuper;
	TBool(b:Bool);
	TInt(i:Int);
	TFloat(s:String);
	TString(s:String);
}

/**
	How a `TField` reaches its field. `FInstance`/`FStatic`/`FClosureInstance`
	carry a `FieldRef`; `FAnon`/`FClosureAnon` carry the resolved anonymous
	field; `FEnum` an `EnumFieldRef`.
**/
enum HxbFieldAccess {
	FInstance(c:TypePath, params:Array<HxbType>, cf:FieldRef);
	FStatic(c:TypePath, cf:FieldRef);
	FAnon(cf:HxbClassField);
	FClosureInstance(c:TypePath, params:Array<HxbType>, cf:FieldRef);
	FClosureAnon(cf:HxbClassField);
	FEnum(e:TypePath, ef:EnumFieldRef);
	FDynamic(s:String);
}

/** A reference to a module type, as carried by `TTypeExpr`/`TCast`. **/
enum HxbModuleTypeRef {
	MTClass(c:TypePath);
	MTEnum(e:TypePath);
	MTAbstract(a:TypePath);
	MTTypedef(t:TypePath);

	/**
		A module type referenced only by path, with no statically-known kind.
		Used by `TCast`'s optional target, which HXB serializes as a bare
		`full_path` (the compiler resolves it against the typer; this library,
		being typer-free, keeps it symbolic).
	**/
	MTUnknown(path:TypePath);
}

/** The body of a `TFunction`. **/
@:structInit
class HxbTFunc {
	public var args:Array<HxbTFuncArg>;
	public var t:HxbType;
	public var expr:HxbTypedExpr;

	public function new(args, t, expr) {
		this.args = args;
		this.t = t;
		this.expr = expr;
	}
}

/**
	A typed local variable (`Type.tvar`). Within one field's expression the same
	`HxbVar` instance is shared by its declaration and all `TLocal` uses.
**/
@:structInit
class HxbVar {
	public var id:Int;
	public var name:String;
	public var type:Null<HxbType>;
	public var kind:HxbVarKind;
	public var flags:Int;
	public var meta:Array<HxbMetaEntry>;
	public var pos:Pos;
	public var extra:Null<HxbVarExtra>;

	public function new(id, name, kind, flags, meta, pos, type = null, extra = null) {
		this.id = id;
		this.name = name;
		this.kind = kind;
		this.flags = flags;
		this.meta = meta;
		this.pos = pos;
		this.type = type;
		this.extra = extra;
	}

	public function toString():String
		return '$name<$id>';
}

/** Extra info attached to a variable: captured type params and a bound expr. **/
typedef HxbVarExtra = {
	var params:Array<Int>; // indices into the field's local type parameters
	var expr:Null<HxbTypedExpr>;
};

/** Variable kinds (`Type.tvar_kind`). **/
enum HxbVarKind {
	VUser(origin:HxbVarOrigin);
	VGenerated;
	VInlined;
	VInlinedConstructorVariable(names:Array<String>);
	VExtractorVariable;
	VAbstractThis;
}

/** Where a user variable came from (`Type.var_origin`). **/
enum HxbVarOrigin {
	TVOLocalVariable;
	TVOArgument;
	TVOForVariable;
	TVOPatternVariable;
	TVOCatchVariable;
	TVOLocalFunction;
}
