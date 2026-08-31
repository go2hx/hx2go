package hx2go.writers;

import hxb.Ast.HxbExpr;
import hxb.Ast.HxbMetaEntry;
import hxb.HxbType;
import hxb.Typed.HxbTypedExpr;
import hx2go.util.ExprHelper;

class MetaWriter {

	static inline function node(def, ?t: HxbType): HxbTypedExpr {
		return new HxbTypedExpr(def, t, null);
	}

	static function keep(entries: Array<HxbMetaEntry>): Array<HxbMetaEntry> {
		return entries.filter(m -> m.name.length > 0 && m.name.charAt(0) != ":");
	}

	static function metaArgs(entry: HxbMetaEntry): HxbTypedExpr {
		if (entry.params.length == 0) {
			return node(TConst(TNull), TDynamicAny);
		}
		return node(TArrayDecl(entry.params.map(toTyped)), TDynamicAny);
	}

	static function metaFieldObj(entries: Array<HxbMetaEntry>): Null<HxbTypedExpr> {
		var kept = keep(entries);
		if (kept.length == 0) {
			return null;
		}
		return node(TObjectDecl(kept.map(m -> field(m.name, metaArgs(m)))));
	}

	static function fieldMetaObj(fields: Array<{ name: String, meta: Array<HxbMetaEntry> }>): Null<HxbTypedExpr> {
		var out = [];
		for (f in fields) {
			var mf = metaFieldObj(f.meta);
			if (mf != null) {
				out.push(field(f.name, mf));
			}
		}
		return out.length == 0 ? null : node(TObjectDecl(out));
	}

	public static function build(
		obj: Array<HxbMetaEntry>,
		fields: Array<{ name: String, meta: Array<HxbMetaEntry> }>,
		statics: Array<{ name: String, meta: Array<HxbMetaEntry> }>
	): Null<HxbTypedExpr> {
		var buckets = [];
		var objGo = metaFieldObj(obj);
		if (objGo != null) buckets.push(field("obj", objGo));
		var fieldsGo = fieldMetaObj(fields);
		if (fieldsGo != null) buckets.push(field("fields", fieldsGo));
		var staticsGo = fieldMetaObj(statics);
		if (staticsGo != null) buckets.push(field("statics", staticsGo));

		return buckets.length == 0 ? null : node(TObjectDecl(buckets));
	}

	static inline function field(name: String, expr: HxbTypedExpr): hxb.Typed.HxbTObjectField {
		return { name: name, pos: null, quotes: NoQuotes, expr: expr };
	}

	static function toTyped(e: HxbExpr): HxbTypedExpr {
		return switch e.expr {
			// preserves 0x/0b and large values that would
			// be lost/overflow when going through Std.parseInt.
			case EConst(CInt(v, _)): ExprHelper.createUntyped('any(${v})', []);
			case EConst(CFloat(v, _)): node(TConst(TFloat(v)), TFloat);
			case EConst(CString(s, _)): node(TConst(TString(s)), TString);
			case EConst(CIdent("true")): node(TConst(TBool(true)), TBool);
			case EConst(CIdent("false")): node(TConst(TBool(false)), TBool);
			case EConst(CIdent("null")): node(TConst(TNull), TDynamicAny);
			case EConst(CIdent(s)): node(TConst(TString(s)), TString);
			case EParenthesis(inner): { var t = toTyped(inner); node(TParenthesis(t), t.t); }
			case EUnop(op, postFix, inner): { var t = toTyped(inner); node(TUnop(op, postFix, t), t.t); }
			case EArrayDecl(values): node(TArrayDecl(values.map(toTyped)), TDynamicAny);
			case EObjectDecl(objFields): node(TObjectDecl(objFields.map(f -> field(f.name, toTyped(f.expr)))), TDynamicAny);
			case _: node(TConst(TNull), TDynamicAny);
		}
	}
}
