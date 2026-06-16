package hx2go.hxb;

import hx2go.hxb.Ast.HxbExpr;

/**
	A type instance, i.e. the compiler's `Type.t` as serialized in HXB.

	Cross-module references (`TInst`, `TEnum`, `TType`, `TAbstract`) carry the
	target's `TypePath` directly. Type-parameter references are kept symbolic
	(`TTypeParam`); resolve them against the relevant declaration's type
	parameters if you need the concrete `TypeParam`.
**/
enum HxbType {
	/** An open monomorph, identified by its index in the module's mono table. **/
	TMono(index:Int);

	/** A reference to a type parameter's type, by scope and index. **/
	TTypeParam(scope:TypeParamScope, index:Int);

	/** An unbound type parameter referenced only by path. **/
	TUnboundTypeParam(path:TypePath);

	/** The bare `Dynamic` type (no type parameter). **/
	TDynamicAny;

	/** `Dynamic<T>` with an element type. **/
	TDynamic(t:HxbType);

	/** The `Class<…>`-like static type of a class (the compiler's `cl_type`). **/
	TClassStatic(c:TypePath);

	/** The static type of an enum (the compiler's `e_type`). **/
	TEnumStatic(e:TypePath);

	/** The module type of an abstract. **/
	TAbstractStatic(a:TypePath);

	/** A type carried as a constant expression (for `@:const` type params). **/
	TExprType(e:HxbExpr);

	/** A function type. `ret` is `TVoid` for the void-returning compact forms. **/
	TFun(args:Array<HxbFunArg>, ret:HxbType);

	/** A class instance `c<params>`. **/
	TInst(c:TypePath, params:Array<HxbType>);

	/** An enum type `e<params>`. **/
	TEnum(e:TypePath, params:Array<HxbType>);

	/** A typedef type `t<params>`. **/
	TType(t:TypePath, params:Array<HxbType>);

	/** An abstract type `a<params>`. **/
	TAbstract(a:TypePath, params:Array<HxbType>);

	/** An anonymous structure type. **/
	TAnon(anon:HxbAnon);

	// Basic types (resolved by the compiler from `StdTypes`):
	TVoid;
	TInt;
	TFloat;
	TBool;
	TString;
}

/**
	One argument of a `TFun`: its name, whether it is optional, and its type.
**/
@:structInit
class HxbFunArg {
	public var name:String;
	public var opt:Bool;
	public var t:HxbType;

	public function new(name:String, opt:Bool, t:HxbType) {
		this.name = name;
		this.opt = opt;
		this.t = t;
	}
}

/**
	The "openness" of an anonymous structure.
**/
enum HxbAnonStatus {
	AClosed;
	AConst;
	AExtend(types:Array<HxbType>);
}

/**
	An anonymous structure type: its status plus its fields. Anons may be shared
	and self-referential, so they are modeled as mutable objects.
**/
class HxbAnon {
	public var status:HxbAnonStatus;
	public var fields:Array<HxbClassField>;

	public function new(?status:HxbAnonStatus, ?fields:Array<HxbClassField>) {
		this.status = status == null ? AClosed : status;
		this.fields = fields == null ? [] : fields;
	}
}
