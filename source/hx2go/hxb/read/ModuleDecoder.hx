package hx2go.hxb.read;

import haxe.io.Bytes;
import hx2go.hxb.*;
import hx2go.hxb.Ast;
import hx2go.hxb.Typed;
import hx2go.hxb.io.ByteReader;
import hx2go.hxb.HxbModuleType.HxbUsing;
import hx2go.hxb.HxbModuleType.HxbClass;
import hx2go.hxb.HxbModuleType.HxbEnum;
import hx2go.hxb.HxbModuleType.HxbAbstract;
import hx2go.hxb.HxbModuleType.HxbTypedef;
import hx2go.hxb.HxbType.HxbAnon;
import hx2go.hxb.HxbType.HxbFunArg;
import hx2go.hxb.HxbClassField.HxbTypeParam;
import hx2go.hxb.HxbClassField.HxbFieldExpr;
import hx2go.hxb.HxbModuleType.HxbClassKind;
import hx2go.hxb.HxbClassField.HxbVarAccess;
import hx2go.hxb.HxbClassField.HxbFieldKind;
import hx2go.hxb.HxbClassField.HxbTypeParamHost;
import hx2go.hxb.HxbModuleType.HxbTypeRelation;
import hx2go.hxb.HxbModuleType.HxbEnumField;
import hx2go.hxb.HxbType.HxbAnonStatus;
import hx2go.hxb.HxbModuleType.HxbAbstractOp;
import hx2go.hxb.HxbModuleType.HxbAbstractUnop;

/**
	Decodes a serialized HXB module (the bytes of a single `*.hxb` entry) into the
	structured `hxb.HxbModule` model.

	This is a faithful, byte-for-byte port of the Haxe compiler's OCaml reader
	(`hxbReader.ml`): chunks are processed in their canonical on-disk order and
	every primitive consumes bytes in exactly the same sequence the compiler
	wrote them.

	Unlike the compiler it does **not** resolve cross-module references against a
	typer; instead every external reference is kept symbolic (a `TypePath`,
	`FieldRef`, `EnumFieldRef` or symbolic `HxbType`). Field expressions (the
	`EXD` chunk) are decoded eagerly.

	Use the static entry point `ModuleDecoder.decode(bytes)`.
**/
class ModuleDecoder {
	/** The module being built. **/
	final module:HxbModule;

	/** The reader positioned over the chunk currently being processed. **/
	var ch:ByteReader;

	// --- Pools --------------------------------------------------------------
	var stringPool:Array<String> = [];
	var docPool:Array<String> = [];

	// --- Symbolic reference tables (the FIRST entries are this module's own
	//     types, so own-type lists line up with index 0..n). -----------------
	var classRefs:Array<TypePath> = [];
	var enumRefs:Array<TypePath> = [];
	var abstractRefs:Array<TypePath> = [];
	var typedefRefs:Array<TypePath> = [];
	var classFieldRefs:Array<FieldRef> = [];
	var enumFieldRefs:Array<EnumFieldRef> = [];

	// --- This module's own declarations, in declaration order ---------------
	var ownClasses:Array<HxbClass> = [];
	var ownEnums:Array<HxbEnum> = [];
	var ownAbstracts:Array<HxbAbstract> = [];
	var ownTypedefs:Array<HxbTypedef> = [];

	// --- Anonymous structures and their fields ------------------------------
	var anons:Array<HxbAnon> = [];
	var anonFields:Array<HxbClassField> = [];

	// --- Type-parameter path contexts (only their paths matter to us; used to
	//     resolve tags 127/128 to a concrete TypePath). ----------------------
	var typeTypeParams:Array<TypePath> = [];
	var fieldTypeParams:Array<TypePath> = [];
	var localTypeParams:Array<TypePath> = [];
	var fieldTypeParamOffset:Int = 0;

	/**
		For each class field whose data declared a deferred (byte 2) expression,
		the `fieldTypeParams` context active at the time, so the `EXD` chunk can
		restore it before decoding the expression. Keyed by the field object.
	**/
	final deferredFieldParams = new Map<HxbClassField, Array<TypePath>>();

	/** A single shared empty anon used by type-instance tag 80. **/
	final emptyAnon = new HxbAnon(AClosed);

	function new(module:HxbModule) {
		this.module = module;
		this.ch = new ByteReader(Bytes.alloc(0));
	}

	/** Decode the bytes of a single HXB module into an `HxbModule`. **/
	public static function decode(bytes:Bytes):HxbModule {
		final chunked = ChunkedModule.read(bytes);
		// MDF carries the path/file; allocate a placeholder until then.
		final module = new HxbModule([], "", "");
		module.source = chunked;
		final decoder = new ModuleDecoder(module);
		for (chunk in chunked.chunks) {
			decoder.ch = new ByteReader(chunk.data);
			decoder.readChunk(chunk.kind);
		}
		return module;
	}

	// ========================================================================
	// Primitives
	// ========================================================================

	inline function readByte():Int
		return ch.readByte();

	inline function readBool():Bool
		return ch.readBool();

	inline function readUleb128():Int
		return ch.readUleb128();

	inline function readLeb128():Int
		return ch.readLeb128();

	inline function readI32():Int
		return ch.readInt32();

	inline function readString():String
		return stringPool[readUleb128()];

	inline function readRawString():String
		return ch.readRawString();

	function readList<T>(f:Void->T):Array<T> {
		final l = readUleb128();
		return [for (_ in 0...l) f()];
	}

	function readOption<T>(f:Void->T):Null<T> {
		return switch (readByte()) {
			case 0: null;
			case _: f();
		}
	}

	/** read_path: `{pack, name}`. **/
	function readPath():{pack:Array<String>, name:String} {
		final pack = readList(readString);
		final name = readString();
		return {pack: pack, name: name};
	}

	/** read_full_path → (pack, mname, tname) as a `TypePath`. **/
	function readFullPath():TypePath {
		final pack = readList(readString);
		final mname = readString();
		final tname = readString();
		return new TypePath(pack, mname, tname);
	}

	function readPos():Pos {
		final file = readString();
		final min = readLeb128();
		final max = readLeb128();
		return new Pos(file, min, max);
	}

	/** read_pos_pair: pos2 uses pos1.min for BOTH its min and max base. **/
	function readPosPair():{pos1:Pos, pos2:Pos} {
		final file = readString();
		final min1 = readLeb128();
		final max1 = readLeb128();
		final min2 = readLeb128();
		final max2 = readLeb128();
		final pos1 = new Pos(file, min1, max1);
		final pos2 = new Pos(file, min1 + min2, min1 + max2);
		return {pos1: pos1, pos2: pos2};
	}

	function readDocumentation():HxbDoc {
		final own = readOption(() -> docPool[readUleb128()]);
		final inherited = readList(() -> docPool[readUleb128()]);
		return new HxbDoc(own, inherited);
	}

	function readMetadataEntry():HxbMetaEntry {
		final name = readString();
		final p = readPos();
		final params = readList(readExpr);
		return new HxbMetaEntry(name, params, p);
	}

	function readMetadata():Array<HxbMetaEntry>
		return readList(readMetadataEntry);

	// ========================================================================
	// References
	// ========================================================================

	inline function readClassRef():TypePath
		return classRefs[readUleb128()];

	inline function readEnumRef():TypePath
		return enumRefs[readUleb128()];

	inline function readAbstractRef():TypePath
		return abstractRefs[readUleb128()];

	inline function readTypedefRef():TypePath
		return typedefRefs[readUleb128()];

	inline function readFieldRef():FieldRef
		return classFieldRefs[readUleb128()];

	inline function readEnumFieldRef():EnumFieldRef
		return enumFieldRefs[readUleb128()];

	function readAnonRef():HxbAnon {
		return switch (readByte()) {
			case 0:
				anons[readUleb128()];
			case 1:
				final an = anons[readUleb128()];
				readAnon(an);
				an;
			case _:
				throw new HxbError("Invalid anon ref tag");
		}
	}

	function readAnonFieldRef():HxbClassField {
		return switch (readByte()) {
			case 0:
				anonFields[readUleb128()];
			case 1:
				final cf = anonFields[readUleb128()];
				readClassFieldAndOverloadsData(cf);
				cf;
			case _:
				throw new HxbError("Invalid anon field ref tag");
		}
	}

	// ========================================================================
	// Operators
	// ========================================================================

	function getBinop(i:Int):HxbBinop {
		return switch (i) {
			case 0: OpAdd;
			case 1: OpMult;
			case 2: OpDiv;
			case 3: OpSub;
			case 4: OpAssign;
			case 5: OpEq;
			case 6: OpNotEq;
			case 7: OpGt;
			case 8: OpGte;
			case 9: OpLt;
			case 10: OpLte;
			case 11: OpAnd;
			case 12: OpOr;
			case 13: OpXor;
			case 14: OpBoolAnd;
			case 15: OpBoolOr;
			case 16: OpShl;
			case 17: OpShr;
			case 18: OpUShr;
			case 19: OpMod;
			case 20: OpInterval;
			case 21: OpArrow;
			case 22: OpIn;
			case 23: OpNullCoal;
			case _: OpAssignOp(getBinop(i - 30));
		}
	}

	/** Returns `{op, postFix}`. **/
	function getUnop(i:Int):{op:HxbUnop, postFix:Bool} {
		return switch (i) {
			case 0: {op: OpIncrement, postFix: false};
			case 1: {op: OpDecrement, postFix: false};
			case 2: {op: OpNot, postFix: false};
			case 3: {op: OpNeg, postFix: false};
			case 4: {op: OpNegBits, postFix: false};
			case 5: {op: OpSpread, postFix: false};
			case 6: {op: OpIncrement, postFix: true};
			case 7: {op: OpDecrement, postFix: true};
			case 8: {op: OpNot, postFix: true};
			case 9: {op: OpNeg, postFix: true};
			case 10: {op: OpNegBits, postFix: true};
			case 11: {op: OpSpread, postFix: true};
			case _: throw new HxbError("Invalid unop id: " + i);
		}
	}

	// ========================================================================
	// Untyped AST (read_expr, reads pos FIRST then tag)
	// ========================================================================

	function readPlacedName():HxbPlacedName {
		final s = readString();
		final p = readPos();
		return new HxbPlacedName(s, p);
	}

	function readTypePath():HxbAstTypePath {
		final pack = readList(readString);
		final name = readString();
		final params = readList(readTypeParamOrConst);
		final sub = readOption(readString);
		return new HxbAstTypePath(pack, name, params, sub);
	}

	function readPlacedTypePath():HxbPlacedTypePath {
		final tp = readTypePath();
		final pp = readPosPair();
		return new HxbPlacedTypePath(tp, pp.pos1, pp.pos2);
	}

	function readTypeParamAst():HxbAstTypeParam {
		final pn = readPlacedName();
		final params = readList(readTypeParamAst);
		final constraints = readOption(readTypeHint);
		final def = readOption(readTypeHint);
		final meta = readMetadata();
		return new HxbAstTypeParam(pn, params, constraints, def, meta);
	}

	function readTypeParamOrConst():HxbTypeParamOrConst {
		return switch (readByte()) {
			case 0: TPType(readTypeHint());
			case 1: TPExpr(readExpr());
			case _: throw new HxbError("Invalid type_param_or_const tag");
		}
	}

	function readFuncArgAst():HxbFunctionArg {
		final pn = readPlacedName();
		final opt = readBool();
		final meta = readMetadata();
		final th = readOption(readTypeHint);
		final eo = readOption(readExpr);
		return new HxbFunctionArg(pn, opt, meta, th, eo);
	}

	function readFunc():HxbFunction {
		final params = readList(readTypeParamAst);
		final args = readList(readFuncArgAst);
		final th = readOption(readTypeHint);
		final eo = readOption(readExpr);
		return new HxbFunction(params, args, th, eo);
	}

	function readComplexType():HxbComplexType {
		return switch (readByte()) {
			case 0: CTPath(readPlacedTypePath());
			case 1:
				final thl = readList(readTypeHint);
				final th = readTypeHint();
				CTFunction(thl, th);
			case 2: CTAnonymous(readList(readCField));
			case 3: CTParent(readTypeHint());
			case 4:
				final ptp = readList(readPlacedTypePath);
				final cffl = readList(readCField);
				CTExtend(ptp, cffl);
			case 5: CTOptional(readTypeHint());
			case 6:
				final pn = readPlacedName();
				final th = readTypeHint();
				CTNamed(pn, th);
			case 7: CTIntersection(readList(readTypeHint));
			case _: throw new HxbError("Invalid complex_type tag");
		}
	}

	function readTypeHint():HxbTypeHint {
		final ct = readComplexType();
		final p = readPos();
		return new HxbTypeHint(ct, p);
	}

	function readAccess():HxbAccess {
		return switch (readByte()) {
			case 0: APublic;
			case 1: APrivate;
			case 2: AStatic;
			case 3: AOverride;
			case 4: ADynamic;
			case 5: AInline;
			case 6: AMacro;
			case 7: AFinal;
			case 8: AExtern;
			case 9: AAbstract;
			case 10: AOverload;
			case 11: AEnum;
			case _: throw new HxbError("Invalid access tag");
		}
	}

	function readPlacedAccess():HxbPlacedAccess {
		final ac = readAccess();
		final p = readPos();
		return new HxbPlacedAccess(ac, p);
	}

	function readCFieldKind():HxbAstFieldKind {
		return switch (readByte()) {
			case 0:
				final th = readOption(readTypeHint);
				final eo = readOption(readExpr);
				FVar(th, eo);
			case 1: FFun(readFunc());
			case 2:
				final pn1 = readPlacedName();
				final pn2 = readPlacedName();
				final th = readOption(readTypeHint);
				final eo = readOption(readExpr);
				FProp(pn1, pn2, th, eo);
			case _: throw new HxbError("Invalid cfield_kind tag");
		}
	}

	function readCField():HxbAstField {
		final pn = readPlacedName();
		final doc = readOption(readDocumentation);
		final pos = readPos();
		final meta = readMetadata();
		final access = readList(readPlacedAccess);
		final kind = readCFieldKind();
		return new HxbAstField(pn, doc, pos, meta, access, kind);
	}

	function readExpr():HxbExpr {
		final p = readPos();
		final def:HxbExprDef = switch (readByte()) {
			case 0:
				final s = readString();
				final suffix = readOption(readString);
				EConst(CInt(s, suffix));
			case 1:
				final s = readString();
				final suffix = readOption(readString);
				EConst(CFloat(s, suffix));
			case 2:
				final s = readString();
				final qs = switch (readByte()) {
					case 0: SDoubleQuotes;
					case 1: SSingleQuotes;
					case _: throw new HxbError("Invalid string kind");
				}
				EConst(CString(s, qs));
			case 3:
				EConst(CIdent(readString()));
			case 4:
				final s1 = readString();
				final s2 = readString();
				EConst(CRegexp(s1, s2));
			case 5:
				final e1 = readExpr();
				final e2 = readExpr();
				EArray(e1, e2);
			case 6:
				final op = getBinop(readByte());
				final e1 = readExpr();
				final e2 = readExpr();
				EBinop(op, e1, e2);
			case 7:
				final e = readExpr();
				final s = readString();
				final kind = switch (readByte()) {
					case 0: EFNormal;
					case 1: EFSafe;
					case _: throw new HxbError("Invalid efield kind");
				}
				EField(e, s, kind);
			case 8:
				EParenthesis(readExpr());
			case 9:
				final fields = readList(function():HxbObjectField {
					final n = readString();
					final fp = readPos();
					final qs = switch (readByte()) {
						case 0: NoQuotes;
						case 1: DoubleQuotes;
						case _: throw new HxbError("Invalid quote status");
					}
					final e = readExpr();
					return {name: n, pos: fp, quotes: qs, expr: e};
				});
				EObjectDecl(fields);
			case 10:
				EArrayDecl(readList(readExpr));
			case 11:
				final e = readExpr();
				final el = readList(readExpr);
				ECall(e, el);
			case 12:
				final ptp = readPlacedTypePath();
				final el = readList(readExpr);
				ENew(ptp, el);
			case 13:
				final u = getUnop(readByte());
				final e = readExpr();
				EUnop(u.op, u.postFix, e);
			case 14:
				final vl = readList(function():HxbEVar {
					final name = readPlacedName();
					final isFinal = readBool();
					final isStatic = readBool();
					final t = readOption(readTypeHint);
					final expr = readOption(readExpr);
					final meta = readMetadata();
					return new HxbEVar(name, isFinal, isStatic, t, expr, meta);
				});
				EVars(vl);
			case 15:
				final fk:HxbFunctionKind = switch (readByte()) {
					case 0: FKAnonymous;
					case 1:
						final pn = readPlacedName();
						final b = readBool();
						FKNamed(pn, b);
					case 2: FKArrow;
					case _: throw new HxbError("Invalid function kind");
				}
				final f = readFunc();
				EFunction(fk, f);
			case 16:
				EBlock(readList(readExpr));
			case 17:
				final e1 = readExpr();
				final e2 = readExpr();
				EFor(e1, e2);
			case 18:
				final e1 = readExpr();
				final e2 = readExpr();
				EIf(e1, e2, null);
			case 19:
				final e1 = readExpr();
				final e2 = readExpr();
				final e3 = readExpr();
				EIf(e1, e2, e3);
			case 20:
				final e1 = readExpr();
				final e2 = readExpr();
				EWhile(e1, e2, true);
			case 21:
				final e1 = readExpr();
				final e2 = readExpr();
				EWhile(e1, e2, false);
			case 22:
				final e1 = readExpr();
				final cases = readList(function():HxbCase {
					final el = readList(readExpr);
					final eg = readOption(readExpr);
					final eo = readOption(readExpr);
					final cp = readPos();
					return {values: el, guard: eg, expr: eo, pos: cp};
				});
				final def = readOption(function():{expr:Null<HxbExpr>, pos:Pos} {
					final eo = readOption(readExpr);
					final dp = readPos();
					return {expr: eo, pos: dp};
				});
				ESwitch(e1, cases, def);
			case 23:
				final e1 = readExpr();
				final catches = readList(function():HxbCatch {
					final pn = readPlacedName();
					final th = readOption(readTypeHint);
					final e = readExpr();
					final cp = readPos();
					return {name: pn, type: th, expr: e, pos: cp};
				});
				ETry(e1, catches);
			case 24: EReturn(null);
			case 25: EReturn(readExpr());
			case 26: EBreak;
			case 27: EContinue;
			case 28: EUntyped(readExpr());
			case 29: EThrow(readExpr());
			case 30: ECast(readExpr(), null);
			case 31:
				final e1 = readExpr();
				final th = readTypeHint();
				ECast(e1, th);
			case 32:
				final e1 = readExpr();
				final th = readTypeHint();
				EIs(e1, th);
			case 33:
				final e1 = readExpr();
				final dk:HxbDisplayKind = switch (readByte()) {
					case 0: DKCall;
					case 1: DKDot;
					case 2: DKStructure;
					case 3: DKMarked;
					case 4: DKPattern(readBool());
					case _: throw new HxbError("Invalid display kind");
				}
				EDisplay(e1, dk);
			case 34:
				final e1 = readExpr();
				final e2 = readExpr();
				final e3 = readExpr();
				ETernary(e1, e2, e3);
			case 35:
				final e1 = readExpr();
				final th = readTypeHint();
				ECheckType(e1, th);
			case 36:
				final m = readMetadataEntry();
				final e = readExpr();
				EMeta(m, e);
			case t:
				throw new HxbError("Invalid expr tag: " + t);
		}
		return new HxbExpr(def, p);
	}

	// ========================================================================
	// Type instances (read_type_instance)
	// ========================================================================

	function readFunArg():HxbFunArg {
		final name = readString();
		final opt = readBool();
		final t = readTypeInstance();
		return new HxbFunArg(name, opt, t);
	}

	function readTypeInstance():HxbType {
		return switch (readByte()) {
			case 0: TMono(readUleb128());
			case 1: TTypeParam(TPSType, readUleb128());
			case 2: TTypeParam(TPSField, readUleb128());
			case 3: TTypeParam(TPSLocal, readUleb128());
			case 4: TDynamicAny;
			case 5:
				final path = readPath();
				TUnboundTypeParam(new TypePath(path.pack, path.name, path.name));
			case 10: TClassStatic(readClassRef());
			case 11: TEnumStatic(readEnumRef());
			case 12: TAbstractStatic(readAbstractRef());
			case 13: TExprType(readExpr());
			case 20: TFun([], HxbType.TVoid);
			case 21: TFun([readFunArg()], HxbType.TVoid);
			case 22: TFun([readFunArg(), readFunArg()], HxbType.TVoid);
			case 23: TFun([readFunArg(), readFunArg(), readFunArg()], HxbType.TVoid);
			case 24: TFun([readFunArg(), readFunArg(), readFunArg(), readFunArg()], HxbType.TVoid);
			case 29: TFun(readList(readFunArg), HxbType.TVoid);
			case 30:
				final ret = readTypeInstance();
				TFun([], ret);
			case 31:
				final a1 = readFunArg();
				final ret = readTypeInstance();
				TFun([a1], ret);
			case 32:
				final a1 = readFunArg();
				final a2 = readFunArg();
				final ret = readTypeInstance();
				TFun([a1, a2], ret);
			case 33:
				final a1 = readFunArg();
				final a2 = readFunArg();
				final a3 = readFunArg();
				final ret = readTypeInstance();
				TFun([a1, a2, a3], ret);
			case 34:
				final a1 = readFunArg();
				final a2 = readFunArg();
				final a3 = readFunArg();
				final a4 = readFunArg();
				final ret = readTypeInstance();
				TFun([a1, a2, a3, a4], ret);
			case 39:
				final args = readList(readFunArg);
				final ret = readTypeInstance();
				TFun(args, ret);
			case 40: TInst(readClassRef(), []);
			case 41:
				final c = readClassRef();
				final t1 = readTypeInstance();
				TInst(c, [t1]);
			case 42:
				final c = readClassRef();
				final t1 = readTypeInstance();
				final t2 = readTypeInstance();
				TInst(c, [t1, t2]);
			case 49:
				final c = readClassRef();
				final tl = readTypes();
				TInst(c, tl);
			case 50: TEnum(readEnumRef(), []);
			case 51:
				final e = readEnumRef();
				final t1 = readTypeInstance();
				TEnum(e, [t1]);
			case 52:
				final e = readEnumRef();
				final t1 = readTypeInstance();
				final t2 = readTypeInstance();
				TEnum(e, [t1, t2]);
			case 59:
				final e = readEnumRef();
				final tl = readTypes();
				TEnum(e, tl);
			case 60: TType(readTypedefRef(), []);
			case 61:
				final td = readTypedefRef();
				final t1 = readTypeInstance();
				TType(td, [t1]);
			case 62:
				final td = readTypedefRef();
				final t1 = readTypeInstance();
				final t2 = readTypeInstance();
				TType(td, [t1, t2]);
			case 69:
				final td = readTypedefRef();
				final tl = readTypes();
				TType(td, tl);
			case 70: TAbstract(readAbstractRef(), []);
			case 71:
				final a = readAbstractRef();
				final t1 = readTypeInstance();
				TAbstract(a, [t1]);
			case 72:
				final a = readAbstractRef();
				final t1 = readTypeInstance();
				final t2 = readTypeInstance();
				TAbstract(a, [t1, t2]);
			case 79:
				final a = readAbstractRef();
				final tl = readTypes();
				TAbstract(a, tl);
			case 80: TAnon(emptyAnon);
			case 81: TAnon(readAnonRef());
			case 89: TDynamic(readTypeInstance());
			case 100: HxbType.TVoid;
			case 101: HxbType.TInt;
			case 102: HxbType.TFloat;
			case 103: HxbType.TBool;
			case 104: HxbType.TString;
			case i: throw new HxbError("Bad type instance id: " + i);
		}
	}

	function readTypes():Array<HxbType>
		return readList(readTypeInstance);

	// ========================================================================
	// Type parameters
	// ========================================================================

	/** read_type_parameters_forward. Returns the params; also their paths. **/
	function readTypeParametersForward():Array<HxbTypeParam> {
		final length = readUleb128();
		return [
			for (_ in 0...length) {
				final path = readPath();
				final pos = readPos();
				final host:HxbTypeParamHost = switch (readByte()) {
					case 0: TPHType;
					case 1: TPHConstructor;
					case 2: TPHMethod;
					case 3: TPHEnumConstructor;
					case 4: TPHAnonField;
					case 5: TPHLocal;
					case i: throw new HxbError("Invalid type parameter host: " + i);
				}
				new HxbTypeParam(path.name, host, new TypePath(path.pack, path.name, path.name), pos);
			}
		];
	}

	function readTypeParametersData(a:Array<HxbTypeParam>):Void {
		for (ttp in a) {
			final meta = readMetadata();
			final constraints = readTypes();
			final def = readOption(readTypeInstance);
			ttp.meta = meta;
			ttp.constraints = constraints;
			ttp.def = def;
		}
	}

	/** The paths of an array of type parameters (for ttp-ref resolution). **/
	inline function paramPaths(a:Array<HxbTypeParam>):Array<TypePath>
		return [for (p in a) p.path];

	// ========================================================================
	// Field & var kinds
	// ========================================================================

	function readAccessor():HxbVarAccess {
		return switch (readByte()) {
			case 0: AccNormal;
			case 1: AccNo;
			case 2: AccNever;
			case 3: AccCtor;
			case 4: AccCall;
			case 5: AccInline;
			case 6:
				final s = readString();
				final so = readOption(readString);
				AccRequire(s, so);
			case 7: AccPrivateCall;
			case i: throw new HxbError("Bad accessor kind: " + i);
		}
	}

	function readFieldKind():HxbFieldKind {
		return switch (readByte()) {
			case 0: KMethod(MethNormal);
			case 1: KMethod(MethInline);
			case 2: KMethod(MethDynamic);
			case 3: KMethod(MethMacro);
			case 10: KVar(AccNormal, AccNormal);
			case 11: KVar(AccNormal, AccNo);
			case 12: KVar(AccNormal, AccNever);
			case 13: KVar(AccNormal, AccCtor);
			case 14: KVar(AccNormal, AccCall);
			case 20: KVar(AccInline, AccNever);
			case 30: KVar(AccCall, AccNormal);
			case 31: KVar(AccCall, AccNo);
			case 32: KVar(AccCall, AccNever);
			case 33: KVar(AccCall, AccCtor);
			case 34: KVar(AccCall, AccCall);
			case 100:
				final r = readAccessor();
				final w = readAccessor();
				KVar(r, w);
			case i: throw new HxbError("Bad field kind: " + i);
		}
	}

	function readVarKind():HxbVarKind {
		return switch (readByte()) {
			case 0: VUser(TVOLocalVariable);
			case 1: VUser(TVOArgument);
			case 2: VUser(TVOForVariable);
			case 3: VUser(TVOPatternVariable);
			case 4: VUser(TVOCatchVariable);
			case 5: VUser(TVOLocalFunction);
			case 6: VGenerated;
			case 7: VInlined;
			case 8: VInlinedConstructorVariable(readList(readString));
			case 9: VExtractorVariable;
			case 10: VAbstractThis;
			case _: throw new HxbError("Invalid var kind");
		}
	}

	function readVar():HxbVar {
		final id = readUleb128();
		final name = readString();
		final kind = readVarKind();
		final flags = readUleb128();
		final meta = readMetadata();
		final pos = readPos();
		return new HxbVar(id, name, kind, flags, meta, pos);
	}

	// ========================================================================
	// Typed expressions (read_texpr)
	// ========================================================================

	/** Per-field reading context for `read_texpr`. **/
	function readTexpr(fctx:FieldReaderContext):HxbTypedExpr {
		// --- helpers tied to fctx -------------------------------------------
		function declareLocal():HxbVar {
			final v = fctx.vars[readUleb128()];
			v.extra = readOption(function():HxbVarExtra {
				final params = readList(function():Int {
					return readUleb128(); // index into local type params
				});
				final vexpr = readOption(() -> readTexpr(fctx));
				return {params: params, expr: vexpr};
			});
			v.type = readTypeInstance();
			return v;
		}

		function readRelpos():Pos {
			switch (readByte()) {
				case 0:
				case 1: fctx.cur.min = readLeb128();
				case 2: fctx.cur.max = readLeb128();
				case 3:
					fctx.cur.min = readLeb128();
					fctx.cur.max = readLeb128();
				case 4: fctx.cur = readPos();
				case _: throw new HxbError("Invalid relpos tag");
			}
			// Pos is mutable and shared; hand out a private snapshot.
			return new Pos(fctx.cur.file, fctx.cur.min, fctx.cur.max);
		}

		// loop: read one typed expr. `optType==null` means read t from t_pool.
		function loop():HxbTypedExpr {
			var optType:Null<HxbType> = null;
			final def:HxbTypedExprDef = switch (readByte()) {
				// values 0-19
				case 0: HxbTypedExprDef.TConst(HxbTConstant.TNull);
				case 1:
					optType = fctx.tthis;
					HxbTypedExprDef.TConst(HxbTConstant.TThis);
				case 2: HxbTypedExprDef.TConst(HxbTConstant.TSuper);
				case 3:
					optType = HxbType.TBool;
					HxbTypedExprDef.TConst(HxbTConstant.TBool(false));
				case 4:
					optType = HxbType.TBool;
					HxbTypedExprDef.TConst(HxbTConstant.TBool(true));
				case 5:
					optType = HxbType.TInt;
					HxbTypedExprDef.TConst(HxbTConstant.TInt(readI32()));
				case 6:
					optType = HxbType.TFloat;
					HxbTypedExprDef.TConst(HxbTConstant.TFloat(readString()));
				case 7:
					optType = HxbType.TString;
					HxbTypedExprDef.TConst(HxbTConstant.TString(readString()));
				case 13: HxbTypedExprDef.TConst(HxbTConstant.TBool(false));
				case 14: HxbTypedExprDef.TConst(HxbTConstant.TBool(true));
				case 15: HxbTypedExprDef.TConst(HxbTConstant.TInt(readI32()));
				case 16: HxbTypedExprDef.TConst(HxbTConstant.TFloat(readString()));
				case 17: HxbTypedExprDef.TConst(HxbTConstant.TString(readString()));

				// vars 20-29
				case 20: TLocal(fctx.vars[readUleb128()]);
				case 21:
					final v = declareLocal();
					optType = HxbType.TVoid;
					TVar(v, null);
				case 22:
					final v = declareLocal();
					final e = loop();
					optType = HxbType.TVoid;
					TVar(v, e);

				// blocks 30-49
				case 30: TBlock([]);
				case 31: TBlock([for (_ in 0...1) loop()]);
				case 32: TBlock([for (_ in 0...2) loop()]);
				case 33: TBlock([for (_ in 0...3) loop()]);
				case 34: TBlock([for (_ in 0...4) loop()]);
				case 35: TBlock([for (_ in 0...5) loop()]);
				case 36:
					final l = readByte();
					TBlock([for (_ in 0...l) loop()]);
				case 39: TBlock(readList(loop));

				// function 50-59
				case 50:
					final args = readList(function():HxbTFuncArg {
						final v = declareLocal();
						final cto = readOption(loop);
						return {v: v, value: cto};
					});
					final r = readTypeInstance();
					final e = loop();
					TFunction(new HxbTFunc(args, r, e));

				// texpr compounds 60-79
				case 60:
					final e1 = loop();
					final e2 = loop();
					TArray(e1, e2);
				case 61:
					final e = loop();
					optType = e.t;
					TParenthesis(e);
				case 62: TArrayDecl(readList(loop));
				case 63:
					final fl = readList(function():HxbTObjectField {
						final name = readString();
						final p = readPos();
						final qs = switch (readByte()) {
							case 0: NoQuotes;
							case 1: DoubleQuotes;
							case _: throw new HxbError("Invalid quote status");
						}
						final e = loop();
						return {name: name, pos: p, quotes: qs, expr: e};
					});
					TObjectDecl(fl);
				case 65:
					final m = readMetadataEntry();
					final e1 = loop();
					TMeta(m, e1);

				// calls 70-79
				case 70:
					final e1 = loop();
					TCall(e1, []);
				case 71:
					final e1 = loop();
					TCall(e1, [for (_ in 0...1) loop()]);
				case 72:
					final e1 = loop();
					TCall(e1, [for (_ in 0...2) loop()]);
				case 73:
					final e1 = loop();
					TCall(e1, [for (_ in 0...3) loop()]);
				case 74:
					final e1 = loop();
					TCall(e1, [for (_ in 0...4) loop()]);
				case 79:
					final e1 = loop();
					final el = readList(loop);
					TCall(e1, el);

				// branching 80-89
				case 80:
					final e1 = loop();
					final e2 = loop();
					optType = HxbType.TVoid;
					TIf(e1, e2, null);
				case 81:
					final e1 = loop();
					final e2 = loop();
					final e3 = loop();
					TIf(e1, e2, e3);
				case 82:
					final subj = loop();
					final cases = readList(function():HxbTCase {
						final patterns = readList(loop);
						final ec = loop();
						return {patterns: patterns, expr: ec};
					});
					final def = readOption(loop);
					TSwitch(subj, cases, def);
				case 83:
					final e1 = loop();
					final catches = readList(function():HxbTCatch {
						final v = declareLocal();
						final e = loop();
						return {v: v, expr: e};
					});
					TTry(e1, catches);
				case 84:
					final e1 = loop();
					final e2 = loop();
					optType = HxbType.TVoid;
					TWhile(e1, e2, true);
				case 85:
					final e1 = loop();
					final e2 = loop();
					optType = HxbType.TVoid;
					TWhile(e1, e2, false);

				// control flow 90-99
				case 90: TReturn(null);
				case 91: TReturn(loop());
				case 92: TContinue;
				case 93: TBreak;
				case 94: TThrow(loop());

				// access 100-119
				case 100:
					optType = HxbType.TInt;
					TEnumIndex(loop());
				case 101:
					final e1 = loop();
					final ef = readEnumFieldRef();
					final i = readUleb128();
					TEnumParameter(e1, ef, i);
				case 102:
					final e1 = loop();
					final c = readClassRef();
					final tl = readTypes();
					final cf = readFieldRef();
					TField(e1, FInstance(c, tl, cf));
				case 103:
					final e1 = loop();
					final c = readClassRef();
					final cf = readFieldRef();
					TField(e1, FStatic(c, cf));
				case 104:
					final e1 = loop();
					final cf = readAnonFieldRef();
					TField(e1, FAnon(cf));
				case 105:
					final e1 = loop();
					final c = readClassRef();
					final tl = readTypes();
					final cf = readFieldRef();
					TField(e1, FClosureInstance(c, tl, cf));
				case 106:
					final e1 = loop();
					final cf = readAnonFieldRef();
					TField(e1, FClosureAnon(cf));
				case 107:
					final e1 = loop();
					final en = readEnumRef();
					final ef = readEnumFieldRef();
					TField(e1, FEnum(en, ef));
				case 108:
					final e1 = loop();
					final s = readString();
					TField(e1, FDynamic(s));

				case 110:
					// reads an INNER relpos before the outer one
					final p = readRelpos();
					final c = readClassRef();
					final cf = readFieldRef();
					final e1 = new HxbTypedExpr(TTypeExpr(MTClass(c)), TClassStatic(c), p);
					TField(e1, FStatic(c, cf));
				case 111:
					final p = readRelpos();
					final c = readClassRef();
					final tl = readTypes();
					final cf = readFieldRef();
					final tthis = fctx.tthis != null ? fctx.tthis : HxbType.TVoid;
					final ethis = new HxbTypedExpr(HxbTypedExprDef.TConst(HxbTConstant.TThis), tthis, p);
					TField(ethis, FInstance(c, tl, cf));

				// module types 120-139
				case 120:
					final c = readClassRef();
					optType = TClassStatic(c);
					TTypeExpr(MTClass(c));
				case 121:
					final e = readEnumRef();
					optType = TEnumStatic(e);
					TTypeExpr(MTEnum(e));
				case 122:
					final a = readAbstractRef();
					TTypeExpr(MTAbstract(a));
				case 123:
					final t = readTypedefRef();
					TTypeExpr(MTTypedef(t));
				case 124: TCast(loop(), null);
				case 125:
					final e1 = loop();
					final path = readFullPath();
					TCast(e1, MTUnknown(path));
				case 126:
					final c = readClassRef();
					final tl = readTypes();
					final el = readList(loop);
					TNew(c, tl, el);
				case 127:
					final scope = readUleb128();
					final idx = readUleb128();
					final path = resolveTtpPath(scope, idx);
					final tl = readTypes();
					final el = readList(loop);
					TNew(path, tl, el);
				case 128:
					final scope = readUleb128();
					final idx = readUleb128();
					final path = resolveTtpPath(scope, idx);
					TTypeExpr(MTClass(path));

				// unops 140-159
				case t if (t >= 140 && t < 160):
					final u = getUnop(t - 140);
					final e = loop();
					TUnop(u.op, u.postFix, e);

				// binops 160-219
				case t if (t >= 160 && t < 220):
					final op = getBinop(t - 160);
					final e1 = loop();
					final e2 = loop();
					TBinop(op, e1, e2);

				// rest 250
				case 250: TIdent(readString());

				case t: throw new HxbError("Unhandled texpr tag: " + t);
			}
			final t:HxbType = optType != null ? optType : fctx.tPool[readUleb128()];
			final p = readRelpos();
			return new HxbTypedExpr(def, t, p);
		}

		return loop();
	}

	/** resolve_ttp_ref scope (1=type, 2=field, 3=local) + index → a path. **/
	function resolveTtpPath(scope:Int, idx:Int):TypePath {
		final arr = switch (scope) {
			case 1: typeTypeParams;
			case 2: fieldTypeParams;
			case 3: localTypeParams;
			case _: null;
		}
		if (arr != null && idx >= 0 && idx < arr.length)
			return arr[idx];
		return new TypePath([], "", "TypeParam" + idx);
	}

	/** start_texpr (1384): build the per-field reading context. **/
	function startTexpr():FieldReaderContext {
		switch (readByte()) {
			case 0:
			case 1:
				final a = readTypeParametersForward();
				localTypeParams = paramPaths(a);
				readTypeParametersData(a);
			case _:
				throw new HxbError("Invalid start_texpr tag");
		}
		final tthis = readOption(readTypeInstance);
		final lTypes = readUleb128();
		final tPool = [for (_ in 0...lTypes) readTypeInstance()];
		final lVars = readUleb128();
		final vars = [for (_ in 0...lVars) readVar()];
		final pos = readPos();
		return new FieldReaderContext(tPool, vars, tthis, pos);
	}

	/** read_expression = read_texpr + option(read_texpr). **/
	function readExpression(fctx:FieldReaderContext):HxbFieldExpr {
		final e = readTexpr(fctx);
		final eUnopt = readOption(() -> readTexpr(fctx));
		return new HxbFieldExpr(e, eUnopt);
	}

	// ========================================================================
	// Fields (forward + data)
	// ========================================================================

	function readClassFieldForward():HxbClassField {
		final name = readString();
		final pp = readPosPair();
		final meta = readMetadata();
		final overloads = readList(readClassFieldForward);
		return new HxbClassField(name, pp.pos1, pp.pos2, meta, overloads);
	}

	/** read_field_type_parameters: returns the field's own params slice. **/
	function readFieldTypeParameters():Array<HxbTypeParam> {
		final numParams = readUleb128();
		switch (readByte()) {
			case 0:
			case 1:
				final a = readTypeParametersForward();
				fieldTypeParams = paramPaths(a);
				readTypeParametersData(a);
				fieldTypeParamOffset = 0; // numParams added below
			case _:
				throw new HxbError("Invalid read_field_type_parameters tag");
		}
		// The actual HxbTypeParam objects are not kept around per-field by the
		// model; we only track their paths (in fieldTypeParams) for ttp refs.
		// Build a params slice with synthesized entries from the path window.
		final params = [
			for (offset in 0...numParams) {
				final p = fieldTypeParams[fieldTypeParamOffset + offset];
				new HxbTypeParam(p != null ? p.name : "T", TPHMethod, p != null ? p : new TypePath([], "", "T"), Pos.none());
			}
		];
		fieldTypeParamOffset += numParams;
		return params;
	}

	function readClassFieldData(cf:HxbClassField):Void {
		final params = readFieldTypeParameters();
		final t = readTypeInstance();
		final flags = readUleb128();
		final doc = readOption(readDocumentation);
		final kind = readFieldKind();
		switch (readByte()) {
			case 0:
			// no expr
			case 1:
				final fctx = startTexpr();
				final fe = readExpression(fctx);
				cf.expr = fe;
			case 2:
				// deferred: EXD will attach the expression. Remember the field
				// type-parameter context (paths) active right now.
				deferredFieldParams.set(cf, fieldTypeParams.copy());
			case _:
				throw new HxbError("Invalid class field expr tag");
		}
		cf.type = t;
		cf.doc = doc;
		cf.kind = kind;
		cf.params = params;
		cf.flags = flags;
	}

	function readClassFieldAndOverloadsData(cf:HxbClassField):Void {
		final depth = readUleb128();
		final cfl = [cf].concat(cf.overloads);
		for (i in 0...depth)
			readClassFieldData(cfl[i]);
	}

	/** select_class_type_parameters: set typeTypeParams from the class. **/
	function selectClassTypeParameters(c:HxbClass):Void {
		// KAbstractImpl uses the abstract's params; we approximate with the
		// class's own params (the impl class carries the same param paths).
		typeTypeParams = paramPaths(c.params);
	}

	function readClassFields(c:HxbClass):Void {
		selectClassTypeParameters(c);
		readOption(function() {
			readClassFieldAndOverloadsData(c.constructor);
			return true;
		});
		readOption(function() {
			readClassFieldAndOverloadsData(c.init);
			return true;
		});
		final numMembers = readUleb128();
		for (i in 0...numMembers)
			readClassFieldAndOverloadsData(c.fields[i]);
		final numStatics = readUleb128();
		for (i in 0...numStatics)
			readClassFieldAndOverloadsData(c.statics[i]);
	}

	function readEnumFields(e:HxbEnum):Void {
		typeTypeParams = paramPaths(e.params);
		readList(function() {
			final name = readString();
			final ef = findEnumConstructor(e, name);
			ef.params = readFieldTypeParameters();
			ef.type = readTypeInstance();
			ef.doc = readOption(readDocumentation);
			ef.meta = readMetadata();
			return true;
		});
	}

	function findEnumConstructor(e:HxbEnum, name:String):HxbEnumField {
		for (ef in e.constructors)
			if (ef.name == name)
				return ef;
		throw new HxbError('Unknown enum constructor $name on ${e.path.dotPath()}');
	}

	// ========================================================================
	// Module types
	// ========================================================================

	/**
		read_common_module_type. `infos` is one of the declaration classes; the
		params array is passed explicitly so we can set `typeTypeParams`.
	**/
	function readCommonModuleType(params:Array<HxbTypeParam>, set:CommonInfo):Void {
		set.set_isPrivate(readBool());
		set.set_doc(readOption(readDocumentation));
		set.set_meta(readMetadata());
		typeTypeParams = paramPaths(params);
		readTypeParametersData(params);
		set.set_using(readList(function():HxbUsing {
			final c = readClassRef();
			final p = readPos();
			return {c: c, pos: p};
		}));
	}

	function readClassKind():HxbClassKind {
		return switch (readByte()) {
			case 0: KNormal;
			case 1: throw new HxbError("Invalid class kind 1 (KTypeParameter)");
			case 2: KExpr(readExpr());
			case 3: KGeneric;
			case 4:
				final c = readClassRef();
				final tl = readTypes();
				KGenericInstance(c, tl);
			case 5: KMacroType;
			case 6: KGenericBuild(readList(readCField));
			case 7: KAbstractImpl(readAbstractRef());
			case 8: KModuleFields;
			case i: throw new HxbError("Invalid class kind id: " + i);
		}
	}

	function readClass(c:HxbClass):Void {
		readCommonModuleType(c.params, {
			set_isPrivate: v -> c.isPrivate = v,
			set_doc: v -> c.doc = v,
			set_meta: v -> c.meta = v,
			set_using: v -> c.usings = v
		});
		c.kind = readClassKind();
		function readRelation():HxbTypeRelation {
			final rc = readClassRef();
			final tl = readTypes();
			return {t: rc, params: tl};
		}
		c.superClass = readOption(readRelation);
		c.interfaces = readList(readRelation);
		c.dynamicType = readOption(readTypeInstance);
		c.arrayAccess = readOption(readTypeInstance);
	}

	function readAbstract(a:HxbAbstract):Void {
		readCommonModuleType(a.params, {
			set_isPrivate: v -> a.isPrivate = v,
			set_doc: v -> a.doc = v,
			set_meta: v -> a.meta = v,
			set_using: v -> a.usings = v
		});
		a.impl = readOption(readClassRef);
		switch (readByte()) {
			case 0:
				// a_this = TAbstract(self, params...). Approximate with self+[].
				a.underlyingThis = TAbstract(a.path, []);
			case _:
				a.underlyingThis = readTypeInstance();
		}
		a.from = readList(readTypeInstance);
		a.to = readList(readTypeInstance);
		a.isExtern = readBool();
		a.isEnum = readBool();
	}

	function readAbstractFields(a:HxbAbstract):Void {
		a.arrayAccess = readList(readFieldRef);
		a.read = readOption(readFieldRef);
		a.write = readOption(readFieldRef);
		a.call = readOption(readFieldRef);
		a.constructor = readOption(readFieldRef);
		a.ops = readList(function():HxbAbstractOp {
			final op = getBinop(readByte());
			final cf = readFieldRef();
			return {op: op, field: cf};
		});
		a.unops = readList(function():HxbAbstractUnop {
			final u = getUnop(readByte());
			final cf = readFieldRef();
			return {op: u.op, postFix: u.postFix, field: cf};
		});
		// from_field / to_field: OCaml derives a type from cf.cf_type; we just
		// keep the field reference (the type is recoverable from the field).
		a.fromField = readList(readFieldRef);
		a.toField = readList(readFieldRef);
	}

	function readEnum(e:HxbEnum):Void {
		readCommonModuleType(e.params, {
			set_isPrivate: v -> e.isPrivate = v,
			set_doc: v -> e.doc = v,
			set_meta: v -> e.meta = v,
			set_using: v -> e.usings = v
		});
		e.flags = readUleb128();
		e.names = readList(readString);
	}

	function readTypedef(td:HxbTypedef):Void {
		readCommonModuleType(td.params, {
			set_isPrivate: v -> td.isPrivate = v,
			set_doc: v -> td.doc = v,
			set_meta: v -> td.meta = v,
			set_using: v -> td.usings = v
		});
		td.type = readTypeInstance();
	}

	function readAnon(an:HxbAnon):Void {
		final status:HxbAnonStatus = switch (readByte()) {
			case 0: AClosed;
			case 1: AConst;
			case 2: AExtend(readTypes());
			case _: throw new HxbError("Invalid anon status");
		}
		an.status = status;
		final l = readUleb128();
		final fields = [for (_ in 0...l) readAnonFieldRef()];
		an.fields = fields;
	}

	// ========================================================================
	// Chunk processing
	// ========================================================================

	function readStringPool():Array<String> {
		final l = readUleb128();
		return [for (_ in 0...l) readRawString()];
	}

	function readMtf():Void {
		final types = readList(function():HxbModuleType {
			final kind = readByte();
			final path = readPath();
			final pp = readPosPair();
			final params = readTypeParametersForward();
			final tp = new TypePath(path.pack, path.name, path.name);
			return switch (kind) {
				case 0:
					final c = new HxbClass(tp, pp.pos1, pp.pos2);
					c.params = params;
					c.flags = readUleb128();
					c.constructor = readOption(readClassFieldForward);
					c.init = readOption(readClassFieldForward);
					final numFields = readUleb128();
					final numStatics = readUleb128();
					// Forwards are emitted in reverse declaration order; reverse
					// to restore declaration order.
					final fields = [for (_ in 0...numFields) readClassFieldForward()];
					fields.reverse();
					c.fields = fields;
					final statics = [for (_ in 0...numStatics) readClassFieldForward()];
					statics.reverse();
					c.statics = statics;
					ownClasses.push(c);
					MClass(c);
				case 1:
					final e = new HxbEnum(tp, pp.pos1, pp.pos2);
					e.params = params;
					final ctors = readList(function():HxbEnumField {
						final name = readString();
						final cpp = readPosPair();
						final index = readUleb128();
						return new HxbEnumField(name, cpp.pos1, cpp.pos2, index);
					});
					e.constructors = ctors;
					ownEnums.push(e);
					MEnum(e);
				case 2:
					final td = new HxbTypedef(tp, pp.pos1, pp.pos2);
					td.params = params;
					ownTypedefs.push(td);
					MTypedef(td);
				case 3:
					final a = new HxbAbstract(tp, pp.pos1, pp.pos2);
					a.params = params;
					ownAbstracts.push(a);
					MAbstract(a);
				case _:
					throw new HxbError("Invalid type kind: " + kind);
			}
		});
		module.types = types;
	}

	function readMdf():Void {
		final path = readPath();
		module.pack = path.pack;
		module.name = path.name;
		module.file = readString();
		final anonCount = readUleb128();
		module.anonCount = anonCount;
		anons = [for (_ in 0...anonCount) new HxbAnon(AClosed)];
		module.anons = anons;
		final monoCount = readUleb128();
		module.monoCount = monoCount;
	}

	function readImports():Void {
		final l = readUleb128();
		for (_ in 0...l) {
			final path = readPath();
			module.imports.push({pack: path.pack, name: path.name});
		}
	}

	function readClr():Void {
		final l = readUleb128();
		classRefs = [for (_ in 0...l) readFullPath()];
		module.classRefs = classRefs;
	}

	function readEnr():Void {
		final l = readUleb128();
		enumRefs = [for (_ in 0...l) readFullPath()];
		module.enumRefs = enumRefs;
	}

	function readAbr():Void {
		final l = readUleb128();
		abstractRefs = [for (_ in 0...l) readFullPath()];
		module.abstractRefs = abstractRefs;
	}

	function readTdr():Void {
		final l = readUleb128();
		typedefRefs = [for (_ in 0...l) readFullPath()];
		module.typedefRefs = typedefRefs;
	}

	function readEfr():Void {
		final l = readUleb128();
		enumFieldRefs = [
			for (_ in 0...l) {
				final owner = readEnumRef();
				final name = readString();
				new EnumFieldRef(owner, name);
			}
		];
	}

	function readCfr():Void {
		final l = readUleb128();
		classFieldRefs = [
			for (_ in 0...l) {
				final owner = readClassRef();
				final kind:FieldRefKind = switch (readByte()) {
					case 0: FRStatic;
					case 1: FRMember;
					case 2: FRConstructor;
					case 3: FRInit;
					case _: throw new HxbError("Invalid field ref kind");
				}
				final name = switch (kind) {
					case FRStatic | FRMember: readString();
					case FRConstructor | FRInit: null;
				}
				final depth = readUleb128();
				new FieldRef(owner, kind, name, depth);
			}
		];
	}

	function readOfr():Void {
		final l = readUleb128();
		anonFields = [for (_ in 0...l) readClassFieldForward()];
	}

	function readOfd():Void {
		final l = readUleb128();
		for (_ in 0...l) {
			final index = readUleb128();
			readClassFieldAndOverloadsData(anonFields[index]);
		}
	}

	function readObd():Void {
		final l = readUleb128();
		for (_ in 0...l) {
			final index = readUleb128();
			readAnon(anons[index]);
		}
	}

	function readCld():Void {
		final l = readUleb128();
		for (i in 0...l)
			readClass(ownClasses[i]);
	}

	function readEnd():Void {
		final l = readUleb128();
		for (i in 0...l)
			readEnum(ownEnums[i]);
	}

	function readAbd():Void {
		final l = readUleb128();
		for (i in 0...l)
			readAbstract(ownAbstracts[i]);
	}

	function readTdd():Void {
		final l = readUleb128();
		for (i in 0...l)
			readTypedef(ownTypedefs[i]);
	}

	function readCfd():Void {
		final l = readUleb128();
		for (i in 0...l)
			readClassFields(ownClasses[i]);
	}

	function readEfd():Void {
		final l = readUleb128();
		for (i in 0...l)
			readEnumFields(ownEnums[i]);
	}

	function readAfd():Void {
		final l = readUleb128();
		for (i in 0...l)
			readAbstractFields(ownAbstracts[i]);
	}

	function readExd():Void {
		readList(function() {
			// The class ref is a uleb index into the class pool whose first
			// entries are this module's own classes (same order as ownClasses),
			// so it indexes ownClasses directly.
			final idx = readUleb128();
			final ownClass = ownClasses[idx];
			if (ownClass == null)
				throw new HxbError('EXD references unknown own class at ref index $idx');
			readList(function() {
				final cf = readFieldRef();
				final field = resolveField(ownClass, cf);
				final length = readUleb128();
				final bytes = ch.readBytes(length);
				// Decode the expression from its own sub-reader, restoring the
				// field-type-parameter context recorded during the data pass.
				final old = ch;
				selectClassTypeParameters(ownClass);
				final saved = deferredFieldParams.get(field);
				fieldTypeParams = saved != null ? saved : [];
				deferredFieldParams.remove(field);
				fieldTypeParamOffset = 0;
				ch = new ByteReader(bytes);
				final fctx = startTexpr();
				final fe = readExpression(fctx);
				ch = old;
				field.expr = fe;
				return true;
			});
			return true;
		});
	}

	/** Resolve a FieldRef to the concrete field object on `c`. **/
	function resolveField(c:HxbClass, ref:FieldRef):HxbClassField {
		final base:HxbClassField = switch (ref.kind) {
			case FRStatic: findField(c.statics, ref.name);
			case FRMember: findField(c.fields, ref.name);
			case FRConstructor: c.constructor;
			case FRInit: c.init;
		}
		if (base == null)
			throw new HxbError('EXD references missing field ${ref.toString()}');
		if (ref.depth == 0)
			return base;
		final cfl = [base].concat(base.overloads);
		if (ref.depth >= cfl.length)
			throw new HxbError('EXD bad overload depth ${ref.depth} for ${ref.toString()}');
		return cfl[ref.depth];
	}

	function findField(fields:Array<HxbClassField>, name:String):Null<HxbClassField> {
		for (f in fields)
			if (f.name == name)
				return f;
		return null;
	}

	/** Dispatch one chunk by kind, reading from the current `ch`. **/
	function readChunk(kind:ChunkKind):Void {
		switch (kind) {
			case STR: stringPool = readStringPool();
			case DOC: docPool = readStringPool();
			case MDF: readMdf();
			case MTF: readMtf();
			case IMP: readImports();
			case CLR: readClr();
			case ENR: readEnr();
			case ABR: readAbr();
			case TDR: readTdr();
			case OFR: readOfr();
			case OFD: readOfd();
			case OBD: readObd();
			case CLD: readCld();
			case END: readEnd();
			case ABD: readAbd();
			case TDD: readTdd();
			case EOT: // nothing
			case EFR: readEfr();
			case CFR: readCfr();
			case CFD: readCfd();
			case EFD: readEfd();
			case AFD: readAfd();
			case EOF: // nothing
			case EXD: readExd();
			case EOM: // nothing
		}
	}
}

/**
	The per-field context used while reading a typed expression: the type pool,
	the variable table, the optional `this` type, and the mutable "current"
	position threaded through `read_relpos`.
**/
private class FieldReaderContext {
	public var tPool:Array<HxbType>;
	public var vars:Array<HxbVar>;
	public var tthis:Null<HxbType>;
	public var cur:Pos;

	public function new(tPool:Array<HxbType>, vars:Array<HxbVar>, tthis:Null<HxbType>, cur:Pos) {
		this.tPool = tPool;
		this.vars = vars;
		this.tthis = tthis;
		this.cur = cur;
	}
}

/** A small bundle of setters so `readCommonModuleType` can write back to any
	of the four declaration classes without reflection. **/
private typedef CommonInfo = {
	var set_isPrivate:Bool->Void;
	var set_doc:Null<HxbDoc>->Void;
	var set_meta:Array<HxbMetaEntry>->Void;
	var set_using:Array<HxbUsing>->Void;
}
