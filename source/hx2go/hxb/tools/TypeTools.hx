package hx2go.hxb.tools;

/**
	Traversal and rendering helpers for `hxb.HxbType` (type instances).

	`using hxb.tools.TypeTools;` to call these as methods, e.g. `t.toString()`.
**/
class TypeTools {
	/** Call `f` on each immediate sub-type of `t`. **/
	public static function iter(t:HxbType, f:HxbType->Void):Void {
		switch (t) {
			case TDynamic(t2): f(t2);
			case TFun(args, ret):
				for (a in args) f(a.t);
				f(ret);
			case TInst(_, params) | TEnum(_, params) | TType(_, params) | TAbstract(_, params):
				for (p in params) f(p);
			case TAnon(anon):
				for (cf in anon.fields) f(cf.type);
				switch (anon.status) {
					case AExtend(types): for (x in types) f(x);
					case _:
				}
			case _:
		}
	}

	/** Recursively visit `t` and all its sub-types (self first). **/
	public static function walk(t:HxbType, f:HxbType->Void):Void {
		f(t);
		iter(t, x -> walk(x, f));
	}

	/** Render a type instance to a readable, Haxe-like string. **/
	public static function toString(t:HxbType):String {
		return switch (t) {
			case TMono(i): '?$i';
			case TTypeParam(scope, i): '#$scope$i';
			case TUnboundTypeParam(p): p.name;
			case TDynamicAny: "Dynamic";
			case TDynamic(t2): "Dynamic<" + toString(t2) + ">";
			case TClassStatic(c): "Class<" + c.dotPath() + ">";
			case TEnumStatic(e): "Enum<" + e.dotPath() + ">";
			case TAbstractStatic(a): a.dotPath();
			case TExprType(_): "<expr>";
			case TFun(args, ret): "(" + args.map(a -> (a.opt ? "?" : "") + a.name + ":" + toString(a.t)).join(", ") + ") -> " + toString(ret);
			case TInst(c, p): c.dotPath() + params(p);
			case TEnum(e, p): e.dotPath() + params(p);
			case TType(td, p): td.dotPath() + params(p);
			case TAbstract(a, p): a.dotPath() + params(p);
			case TAnon(anon): "{ " + anon.fields.map(cf -> cf.name + ":" + toString(cf.type)).join(", ") + " }";
			case TVoid: "Void";
			case TInt: "Int";
			case TFloat: "Float";
			case TBool: "Bool";
			case TString: "String";
		}
	}

	static function params(p:Array<HxbType>):String {
		return p.length == 0 ? "" : "<" + p.map(toString).join(", ") + ">";
	}
}
