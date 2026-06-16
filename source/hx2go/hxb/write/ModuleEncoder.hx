package hx2go.hxb.write;

import haxe.io.Bytes;
import hx2go.hxb.*;
import hx2go.hxb.Ast;
import hx2go.hxb.Typed;
import hx2go.hxb.io.ByteWriter;
import hx2go.hxb.HxbType.HxbAnon;
import hx2go.hxb.HxbType.HxbFunArg;
import hx2go.hxb.HxbClassField.HxbTypeParamHost;
import hx2go.hxb.HxbClassField.HxbTypeParam;
import hx2go.hxb.HxbClassField.HxbVarAccess;
import hx2go.hxb.HxbClassField.HxbFieldKind;
import hx2go.hxb.HxbClassField.HxbFieldExpr;
import hx2go.hxb.HxbModuleType.HxbEnum;
import hx2go.hxb.HxbModuleType.HxbAbstract;
import hx2go.hxb.HxbModuleType.HxbUsing;
import hx2go.hxb.HxbModuleType.HxbClassKind;
import hx2go.hxb.HxbModuleType.HxbClass;
import hx2go.hxb.HxbModuleType.HxbTypedef;

/**
	Serializes a decoded `hxb.HxbModule` back into HXB module bytes.

	This is the inverse of `hxb.read.ModuleDecoder`. It walks the structured
	model, rebuilds the string/reference/anon pools the format requires, and emits
	each chunk in the byte layout the decoder (and the Haxe compiler's
	`hxbReader.ml`) expects.

	It emits the *simplest valid* encoding of every construct the decoder accepts
	(list forms for type instances and typed expressions, `relpos` tag 4 for every
	position, inline field expressions rather than the deferred `EXD` path), so it
	never has to replicate the compiler's optimizer state while still producing a
	module that round-trips through this library's decoder into an equal model.

	Use the static entry point `ModuleEncoder.encode(module)`.
**/
class ModuleEncoder {
	final module:HxbModule;

	/** The writer for the chunk currently being built. **/
	var ch:ByteWriter;

	// --- Pools --------------------------------------------------------------
	final stringPool:Array<String> = [];
	final stringIndex = new Map<String, Int>();
	final docPool:Array<String> = [];
	final docIndex = new Map<String, Int>();

	// --- Reference pools. The module's OWN types occupy the first N slots
	//     (in `module.types` order), matching the decoder's expectation that
	//     ownClasses[i]/ownEnums[i]/... line up with ref index i. -----------
	final classPool:Array<TypePath> = [];
	final classIndex = new Map<String, Int>();
	final enumPool:Array<TypePath> = [];
	final enumIndex = new Map<String, Int>();
	final abstractPool:Array<TypePath> = [];
	final abstractIndex = new Map<String, Int>();
	final typedefPool:Array<TypePath> = [];
	final typedefIndex = new Map<String, Int>();

	// --- Class-field and enum-field reference pools -------------------------
	final fieldRefPool:Array<FieldRef> = [];
	final fieldRefIndex = new Map<String, Int>();
	final enumFieldRefPool:Array<EnumFieldRef> = [];
	final enumFieldRefIndex = new Map<String, Int>();

	// --- Anonymous structures + their fields (identity-keyed). --------------
	final anonPool = new haxe.ds.ObjectMap<HxbAnon, Int>();
	final anonList:Array<HxbAnon> = [];
	final anonFieldPool = new haxe.ds.ObjectMap<HxbClassField, Int>();
	final anonFieldList:Array<HxbClassField> = [];

	function new(module:HxbModule) {
		this.module = module;
		this.ch = new ByteWriter();
	}

	/** Encode an `HxbModule` to the bytes of a single HXB module. **/
	public static function encode(module:HxbModule):Bytes {
		return new ModuleEncoder(module).run();
	}

	function run():Bytes {
		seedOwnTypes();

		// Build the body chunks first; this populates every pool. The pool
		// chunks (STR/DOC/CLR/...) are emitted afterwards from the finalized
		// pools, so the indices baked into the bodies line up. ChunkedModule
		// sorts everything into canonical on-disk order.
		final chunks:Array<Chunk> = [];

		final mtf = buildMtf();
		final cld = buildCld();
		final cfd = buildCfd();
		final end = buildEnd();
		final efd = buildEfd();
		final abd = buildAbd();
		final afd = buildAfd();
		final tdd = buildTdd();

		// Anon chunks must be built before snapshotting the reference pools:
		// serializing anon definitions and anon-field data discovers further
		// class/abstract/enum/typedef/field references that belong in CLR/...,
		// CFR and EFR. (buildOfr drives anon-pool population to a fixed point.)
		final ofr = buildOfr();
		final ofd = buildOfd();
		final obd = buildObd();

		// CFR/EFR reference owner classes/enums, so they too may extend the
		// class/enum ref pools — build them before snapshotting those pools.
		final cfr = buildCfr();
		final efr = buildEfr();

		// Reference pool chunks (snapshot once every body has been written).
		final imp = buildImp();
		final clr = buildRefPool(classPool);
		final enr = buildRefPool(enumPool);
		final abr = buildRefPool(abstractPool);
		final tdr = buildRefPool(typedefPool);
		final mdf = buildMdf();

		// String pools last (they accumulate from absolutely everything).
		final str = buildStringPool(stringPool);
		final doc = buildStringPool(docPool);

		function push(kind:ChunkKind, data:Null<Bytes>) {
			if (data != null)
				chunks.push(new Chunk(kind, data));
		}

		push(STR, str);
		if (docPool.length > 0)
			push(DOC, doc);
		push(MDF, mdf);
		push(MTF, mtf);
		push(IMP, imp);
		push(CLR, clr);
		push(ENR, enr);
		push(ABR, abr);
		push(TDR, tdr);
		push(OFR, ofr);
		push(OFD, ofd);
		push(OBD, obd);
		push(CLD, cld);
		push(END, end);
		push(ABD, abd);
		push(TDD, tdd);
		push(EFR, efr);
		push(CFR, cfr);
		push(CFD, cfd);
		push(EFD, efd);
		push(AFD, afd);
		// EO* markers are always present, even when empty.
		chunks.push(new Chunk(EOT, Bytes.alloc(0)));
		chunks.push(new Chunk(EOF, Bytes.alloc(0)));
		chunks.push(new Chunk(EOM, Bytes.alloc(0)));

		return new ChunkedModule(chunks).write();
	}

	/**
		Maps every known spelling of one of this module's own types to its
		canonical reference path.

		The full_path of any own type — what `write_full_path` emits in CLR/...
		and what the compiler resolves against — is `(module.pack, module.name,
		type.name)`. But an own type's *own* path (as stored in MTF, and as it
		appears inside type instances built from it) can differ:

		  - MTF only stores `(pack, name)`, so the decoder sets `moduleName ==
		    name`;
		  - abstract-implementation classes (`X_Impl_`) carry a synthetic `_<Mod>`
		    package segment, so their pack differs from the module's pack.

		Both spellings, and the reference spelling, must collapse to one ref-pool
		entry, so we register each by its exact `pathKey` → the single canonical
		path. External references (different module/pack) are left untouched.
	**/
	final ownTypeCanon = new Map<String, TypePath>();

	/** Pre-seed the four ref pools with the module's own types, in order. **/
	function seedOwnTypes():Void {
		for (t in module.types) {
			final ownPath = switch (t) {
				case MClass(c): c.path;
				case MEnum(e): e.path;
				case MAbstract(a): a.path;
				case MTypedef(td): td.path;
			}
			final canonical = new TypePath(module.pack, module.name, ownPath.name);
			// Register both the MTF own-path spelling and the canonical spelling.
			ownTypeCanon.set(pathKey(ownPath), canonical);
			ownTypeCanon.set(pathKey(canonical), canonical);
		}
		// Seed in declaration order so own types occupy the first ref slots.
		for (t in module.types) {
			switch (t) {
				case MClass(c): refAdd(classPool, classIndex, canonRefPath(c.path));
				case MEnum(e): refAdd(enumPool, enumIndex, canonRefPath(e.path));
				case MAbstract(a): refAdd(abstractPool, abstractIndex, canonRefPath(a.path));
				case MTypedef(td): refAdd(typedefPool, typedefIndex, canonRefPath(td.path));
			}
		}
	}

	/** Map a reference path to its canonical own-type path, if it is an own type. **/
	inline function canonRefPath(p:TypePath):TypePath {
		final own = ownTypeCanon.get(pathKey(p));
		return own != null ? own : p;
	}

	// ========================================================================
	// Pool helpers
	// ========================================================================

	function getString(s:String):Int {
		final i = stringIndex.get(s);
		if (i != null)
			return i;
		final idx = stringPool.length;
		stringPool.push(s);
		stringIndex.set(s, idx);
		return idx;
	}

	function getDoc(s:String):Int {
		final i = docIndex.get(s);
		if (i != null)
			return i;
		final idx = docPool.length;
		docPool.push(s);
		docIndex.set(s, idx);
		return idx;
	}

	static inline function pathKey(p:TypePath):String
		return p.pack.join("/") + "|" + p.moduleName + "|" + p.name;

	function refAdd(pool:Array<TypePath>, index:Map<String, Int>, p:TypePath):Int {
		final key = pathKey(p);
		final existing = index.get(key);
		if (existing != null)
			return existing;
		final idx = pool.length;
		pool.push(p);
		index.set(key, idx);
		return idx;
	}

	// ========================================================================
	// Primitives
	// ========================================================================

	inline function writeByte(v:Int):Void
		ch.writeByte(v);

	inline function writeBool(b:Bool):Void
		ch.writeBool(b);

	inline function writeUleb128(v:Int):Void
		ch.writeUleb128(v);

	inline function writeLeb128(v:Int):Void
		ch.writeLeb128(v);

	inline function writeI32(v:Int):Void
		ch.writeInt32(v);

	inline function writeString(s:String):Void
		ch.writeUleb128(getString(s));

	function writeList<T>(l:Array<T>, f:T->Void):Void {
		ch.writeUleb128(l.length);
		for (x in l)
			f(x);
	}

	function writeOption<T>(v:Null<T>, f:T->Void):Void {
		if (v == null) {
			writeByte(0);
		} else {
			writeByte(1);
			f(v);
		}
	}

	/** write_path: list of pack strings + name. **/
	function writePath(pack:Array<String>, name:String):Void {
		writeList(pack, writeString);
		writeString(name);
	}

	/** write_full_path: pack + module name + type name. **/
	function writeFullPath(p:TypePath):Void {
		writeList(p.pack, writeString);
		writeString(p.moduleName);
		writeString(p.name);
	}

	function writePos(p:Pos):Void {
		writeString(p.file);
		writeLeb128(p.min);
		writeLeb128(p.max);
	}

	/** write_pos_pair: full pos1, then pos2 offsets relative to pos1.min. **/
	function writePosPair(p1:Pos, p2:Pos):Void {
		writeString(p1.file);
		writeLeb128(p1.min);
		writeLeb128(p1.max);
		writeLeb128(p2.min - p1.min);
		writeLeb128(p2.max - p1.min);
	}

	/** maybe_write_documentation: presence byte + (own option + inherited list). **/
	function writeDoc(doc:Null<HxbDoc>):Void {
		if (doc == null) {
			writeByte(0);
		} else {
			writeByte(1);
			writeOption(doc.own, s -> writeUleb128(getDoc(s)));
			writeList(doc.inherited, s -> writeUleb128(getDoc(s)));
		}
	}

	function writeMetadataEntry(m:HxbMetaEntry):Void {
		writeString(m.name);
		writePos(m.pos);
		writeList(m.params, writeExpr);
	}

	function writeMetadata(ml:Array<HxbMetaEntry>):Void
		writeList(ml, writeMetadataEntry);

	// ========================================================================
	// References
	// ========================================================================

	inline function writeClassRef(p:TypePath):Void
		writeUleb128(refAdd(classPool, classIndex, canonRefPath(p)));

	inline function writeEnumRef(p:TypePath):Void
		writeUleb128(refAdd(enumPool, enumIndex, canonRefPath(p)));

	inline function writeAbstractRef(p:TypePath):Void
		writeUleb128(refAdd(abstractPool, abstractIndex, canonRefPath(p)));

	inline function writeTypedefRef(p:TypePath):Void
		writeUleb128(refAdd(typedefPool, typedefIndex, canonRefPath(p)));

	function writeFieldRef(ref:FieldRef):Void {
		// Canonicalize the owner so own-type field refs dedup regardless of how
		// the owner's module name was spelled.
		final owner = canonRefPath(ref.owner);
		final canonical = new FieldRef(owner, ref.kind, ref.name, ref.depth);
		final key = fieldRefKey(canonical);
		var idx = fieldRefIndex.get(key);
		if (idx == null) {
			idx = fieldRefPool.length;
			fieldRefPool.push(canonical);
			fieldRefIndex.set(key, idx);
		}
		writeUleb128(idx);
	}

	static function fieldRefKey(ref:FieldRef):String {
		final k = switch (ref.kind) {
			case FRStatic: 0;
			case FRMember: 1;
			case FRConstructor: 2;
			case FRInit: 3;
		}
		return pathKey(ref.owner) + "#" + k + "#" + (ref.name == null ? "" : ref.name) + "#" + ref.depth;
	}

	function writeEnumFieldRef(ref:EnumFieldRef):Void {
		final owner = canonRefPath(ref.owner);
		final canonical = new EnumFieldRef(owner, ref.name);
		final key = pathKey(owner) + "." + ref.name;
		var idx = enumFieldRefIndex.get(key);
		if (idx == null) {
			idx = enumFieldRefPool.length;
			enumFieldRefPool.push(canonical);
			enumFieldRefIndex.set(key, idx);
		}
		writeUleb128(idx);
	}

	function anonRefIndex(an:HxbAnon):Int {
		var idx = anonPool.get(an);
		if (idx == null) {
			idx = anonList.length;
			anonList.push(an);
			anonPool.set(an, idx);
		}
		return idx;
	}

	function anonFieldRefIndex(cf:HxbClassField):Int {
		var idx = anonFieldPool.get(cf);
		if (idx == null) {
			idx = anonFieldList.length;
			anonFieldList.push(cf);
			anonFieldPool.set(cf, idx);
		}
		return idx;
	}

	/** anon_ref: byte 0 (already defined) + index. We define all anons in OBD. **/
	function writeAnonRef(an:HxbAnon):Void {
		final idx = anonRefIndex(an);
		writeByte(0);
		writeUleb128(idx);
	}

	/** anon_field_ref: byte 0 (already defined) + index. Defined in OFR/OFD. **/
	function writeAnonFieldRef(cf:HxbClassField):Void {
		final idx = anonFieldRefIndex(cf);
		writeByte(0);
		writeUleb128(idx);
	}

	// ========================================================================
	// Operators
	// ========================================================================

	function binopIndex(op:HxbBinop):Int {
		return switch (op) {
			case OpAdd: 0;
			case OpMult: 1;
			case OpDiv: 2;
			case OpSub: 3;
			case OpAssign: 4;
			case OpEq: 5;
			case OpNotEq: 6;
			case OpGt: 7;
			case OpGte: 8;
			case OpLt: 9;
			case OpLte: 10;
			case OpAnd: 11;
			case OpOr: 12;
			case OpXor: 13;
			case OpBoolAnd: 14;
			case OpBoolOr: 15;
			case OpShl: 16;
			case OpShr: 17;
			case OpUShr: 18;
			case OpMod: 19;
			case OpInterval: 20;
			case OpArrow: 21;
			case OpIn: 22;
			case OpNullCoal: 23;
			case OpAssignOp(op2): 30 + binopIndex(op2);
		}
	}

	function unopIndex(op:HxbUnop, postFix:Bool):Int {
		return switch [op, postFix] {
			case [OpIncrement, false]: 0;
			case [OpDecrement, false]: 1;
			case [OpNot, false]: 2;
			case [OpNeg, false]: 3;
			case [OpNegBits, false]: 4;
			case [OpSpread, false]: 5;
			case [OpIncrement, true]: 6;
			case [OpDecrement, true]: 7;
			case [OpNot, true]: 8;
			case [OpNeg, true]: 9;
			case [OpNegBits, true]: 10;
			case [OpSpread, true]: 11;
		}
	}

	// ========================================================================
	// Untyped AST (write_expr: pos FIRST, then tag)
	// ========================================================================

	function writePlacedName(pn:HxbPlacedName):Void {
		writeString(pn.name);
		writePos(pn.pos);
	}

	function writeTypePath(tp:HxbAstTypePath):Void {
		writeList(tp.pack, writeString);
		writeString(tp.name);
		writeList(tp.params, writeTypeParamOrConst);
		writeOption(tp.sub, writeString);
	}

	function writePlacedTypePath(ptp:HxbPlacedTypePath):Void {
		writeTypePath(ptp.path);
		writePosPair(ptp.posFull, ptp.posPath);
	}

	function writeTypeParamAst(tp:HxbAstTypeParam):Void {
		writePlacedName(tp.name);
		writeList(tp.params, writeTypeParamAst);
		writeOption(tp.constraints, writeTypeHint);
		writeOption(tp.def, writeTypeHint);
		writeMetadata(tp.meta);
	}

	function writeTypeParamOrConst(tpc:HxbTypeParamOrConst):Void {
		switch (tpc) {
			case TPType(th):
				writeByte(0);
				writeTypeHint(th);
			case TPExpr(e):
				writeByte(1);
				writeExpr(e);
		}
	}

	function writeFuncArgAst(a:HxbFunctionArg):Void {
		writePlacedName(a.name);
		writeBool(a.opt);
		writeMetadata(a.meta);
		writeOption(a.type, writeTypeHint);
		writeOption(a.value, writeExpr);
	}

	function writeFunc(f:HxbFunction):Void {
		writeList(f.params, writeTypeParamAst);
		writeList(f.args, writeFuncArgAst);
		writeOption(f.ret, writeTypeHint);
		writeOption(f.expr, writeExpr);
	}

	function writeComplexType(ct:HxbComplexType):Void {
		switch (ct) {
			case CTPath(ptp):
				writeByte(0);
				writePlacedTypePath(ptp);
			case CTFunction(args, ret):
				writeByte(1);
				writeList(args, writeTypeHint);
				writeTypeHint(ret);
			case CTAnonymous(fields):
				writeByte(2);
				writeList(fields, writeCField);
			case CTParent(th):
				writeByte(3);
				writeTypeHint(th);
			case CTExtend(ptps, fields):
				writeByte(4);
				writeList(ptps, writePlacedTypePath);
				writeList(fields, writeCField);
			case CTOptional(th):
				writeByte(5);
				writeTypeHint(th);
			case CTNamed(pn, th):
				writeByte(6);
				writePlacedName(pn);
				writeTypeHint(th);
			case CTIntersection(types):
				writeByte(7);
				writeList(types, writeTypeHint);
		}
	}

	function writeTypeHint(th:HxbTypeHint):Void {
		writeComplexType(th.type);
		writePos(th.pos);
	}

	function writeAccess(ac:HxbAccess):Void {
		final i = switch (ac) {
			case APublic: 0;
			case APrivate: 1;
			case AStatic: 2;
			case AOverride: 3;
			case ADynamic: 4;
			case AInline: 5;
			case AMacro: 6;
			case AFinal: 7;
			case AExtern: 8;
			case AAbstract: 9;
			case AOverload: 10;
			case AEnum: 11;
		}
		writeByte(i);
	}

	function writePlacedAccess(pa:HxbPlacedAccess):Void {
		writeAccess(pa.access);
		writePos(pa.pos);
	}

	function writeCFieldKind(k:HxbAstFieldKind):Void {
		switch (k) {
			case FVar(th, eo):
				writeByte(0);
				writeOption(th, writeTypeHint);
				writeOption(eo, writeExpr);
			case FFun(f):
				writeByte(1);
				writeFunc(f);
			case FProp(pn1, pn2, th, eo):
				writeByte(2);
				writePlacedName(pn1);
				writePlacedName(pn2);
				writeOption(th, writeTypeHint);
				writeOption(eo, writeExpr);
		}
	}

	function writeCField(f:HxbAstField):Void {
		writePlacedName(f.name);
		writeOption(f.doc, writeDocInner);
		writePos(f.pos);
		writeMetadata(f.meta);
		writeList(f.access, writePlacedAccess);
		writeCFieldKind(f.kind);
	}

	/**
		The doc body as read by `readDocumentation` (own option + inherited
		list) — used where the decoder calls `readOption(readDocumentation)`,
		i.e. the leading presence byte is written by `writeOption`.
	**/
	function writeDocInner(doc:HxbDoc):Void {
		writeOption(doc.own, s -> writeUleb128(getDoc(s)));
		writeList(doc.inherited, s -> writeUleb128(getDoc(s)));
	}

	function writeExpr(e:HxbExpr):Void {
		writePos(e.pos);
		switch (e.expr) {
			case EConst(CInt(s, suffix)):
				writeByte(0);
				writeString(s);
				writeOption(suffix, writeString);
			case EConst(CFloat(s, suffix)):
				writeByte(1);
				writeString(s);
				writeOption(suffix, writeString);
			case EConst(CString(s, kind)):
				writeByte(2);
				writeString(s);
				writeByte(switch (kind) {
					case SDoubleQuotes: 0;
					case SSingleQuotes: 1;
				});
			case EConst(CIdent(s)):
				writeByte(3);
				writeString(s);
			case EConst(CRegexp(s1, s2)):
				writeByte(4);
				writeString(s1);
				writeString(s2);
			case EArray(e1, e2):
				writeByte(5);
				writeExpr(e1);
				writeExpr(e2);
			case EBinop(op, e1, e2):
				writeByte(6);
				writeByte(binopIndex(op));
				writeExpr(e1);
				writeExpr(e2);
			case EField(e1, s, kind):
				writeByte(7);
				writeExpr(e1);
				writeString(s);
				writeByte(switch (kind) {
					case EFNormal: 0;
					case EFSafe: 1;
				});
			case EParenthesis(e1):
				writeByte(8);
				writeExpr(e1);
			case EObjectDecl(fields):
				writeByte(9);
				writeList(fields, function(f) {
					writeString(f.name);
					writePos(f.pos);
					writeByte(switch (f.quotes) {
						case NoQuotes: 0;
						case DoubleQuotes: 1;
					});
					writeExpr(f.expr);
				});
			case EArrayDecl(values):
				writeByte(10);
				writeList(values, writeExpr);
			case ECall(e1, params):
				writeByte(11);
				writeExpr(e1);
				writeList(params, writeExpr);
			case ENew(ptp, params):
				writeByte(12);
				writePlacedTypePath(ptp);
				writeList(params, writeExpr);
			case EUnop(op, postFix, e1):
				writeByte(13);
				writeByte(unopIndex(op, postFix));
				writeExpr(e1);
			case EVars(vars):
				writeByte(14);
				writeList(vars, function(v) {
					writePlacedName(v.name);
					writeBool(v.isFinal);
					writeBool(v.isStatic);
					writeOption(v.type, writeTypeHint);
					writeOption(v.expr, writeExpr);
					writeMetadata(v.meta);
				});
			case EFunction(kind, f):
				writeByte(15);
				switch (kind) {
					case FKAnonymous:
						writeByte(0);
					case FKNamed(pn, inlined):
						writeByte(1);
						writePlacedName(pn);
						writeBool(inlined);
					case FKArrow:
						writeByte(2);
				}
				writeFunc(f);
			case EBlock(exprs):
				writeByte(16);
				writeList(exprs, writeExpr);
			case EFor(it, expr):
				writeByte(17);
				writeExpr(it);
				writeExpr(expr);
			case EIf(econd, eif, null):
				writeByte(18);
				writeExpr(econd);
				writeExpr(eif);
			case EIf(econd, eif, eelse):
				writeByte(19);
				writeExpr(econd);
				writeExpr(eif);
				writeExpr(eelse);
			case EWhile(econd, e1, true):
				writeByte(20);
				writeExpr(econd);
				writeExpr(e1);
			case EWhile(econd, e1, false):
				writeByte(21);
				writeExpr(econd);
				writeExpr(e1);
			case ESwitch(e1, cases, def):
				writeByte(22);
				writeExpr(e1);
				writeList(cases, function(c) {
					writeList(c.values, writeExpr);
					writeOption(c.guard, writeExpr);
					writeOption(c.expr, writeExpr);
					writePos(c.pos);
				});
				writeOption(def, function(d) {
					writeOption(d.expr, writeExpr);
					writePos(d.pos);
				});
			case ETry(e1, catches):
				writeByte(23);
				writeExpr(e1);
				writeList(catches, function(c) {
					writePlacedName(c.name);
					writeOption(c.type, writeTypeHint);
					writeExpr(c.expr);
					writePos(c.pos);
				});
			case EReturn(null):
				writeByte(24);
			case EReturn(e1):
				writeByte(25);
				writeExpr(e1);
			case EBreak:
				writeByte(26);
			case EContinue:
				writeByte(27);
			case EUntyped(e1):
				writeByte(28);
				writeExpr(e1);
			case EThrow(e1):
				writeByte(29);
				writeExpr(e1);
			case ECast(e1, null):
				writeByte(30);
				writeExpr(e1);
			case ECast(e1, th):
				writeByte(31);
				writeExpr(e1);
				writeTypeHint(th);
			case EIs(e1, th):
				writeByte(32);
				writeExpr(e1);
				writeTypeHint(th);
			case EDisplay(e1, dk):
				writeByte(33);
				writeExpr(e1);
				switch (dk) {
					case DKCall: writeByte(0);
					case DKDot: writeByte(1);
					case DKStructure: writeByte(2);
					case DKMarked: writeByte(3);
					case DKPattern(b):
						writeByte(4);
						writeBool(b);
				}
			case ETernary(econd, eif, eelse):
				writeByte(34);
				writeExpr(econd);
				writeExpr(eif);
				writeExpr(eelse);
			case ECheckType(e1, th):
				writeByte(35);
				writeExpr(e1);
				writeTypeHint(th);
			case EMeta(entry, e1):
				writeByte(36);
				writeMetadataEntry(entry);
				writeExpr(e1);
		}
	}

	// ========================================================================
	// Type instances (write_type_instance) — always the list / generic forms
	// ========================================================================

	function writeFunArg(a:HxbFunArg):Void {
		writeString(a.name);
		writeBool(a.opt);
		writeTypeInstance(a.t);
	}

	function writeTypeInstance(t:HxbType):Void {
		switch (t) {
			case TMono(index):
				writeByte(0);
				writeUleb128(index);
			case TTypeParam(TPSType, index):
				writeByte(1);
				writeUleb128(index);
			case TTypeParam(TPSField, index):
				writeByte(2);
				writeUleb128(index);
			case TTypeParam(TPSLocal, index):
				writeByte(3);
				writeUleb128(index);
			case TDynamicAny:
				writeByte(4);
			case TUnboundTypeParam(path):
				writeByte(5);
				writePath(path.pack, path.name);
			case TClassStatic(c):
				writeByte(10);
				writeClassRef(c);
			case TEnumStatic(e):
				writeByte(11);
				writeEnumRef(e);
			case TAbstractStatic(a):
				writeByte(12);
				writeAbstractRef(a);
			case TExprType(e):
				writeByte(13);
				writeExpr(e);
			case TFun(args, ret):
				if (isVoid(ret)) {
					writeByte(29);
					writeList(args, writeFunArg);
				} else {
					writeByte(39);
					writeList(args, writeFunArg);
					writeTypeInstance(ret);
				}
			case TInst(c, params):
				writeByte(49);
				writeClassRef(c);
				writeTypes(params);
			case TEnum(e, params):
				writeByte(59);
				writeEnumRef(e);
				writeTypes(params);
			case TType(td, params):
				writeByte(69);
				writeTypedefRef(td);
				writeTypes(params);
			case TAbstract(a, params):
				writeByte(79);
				writeAbstractRef(a);
				writeTypes(params);
			case TAnon(anon):
				if (anon.fields.length == 0 && anon.status.match(AClosed)) {
					writeByte(80);
				} else {
					writeByte(81);
					writeAnonRef(anon);
				}
			case TDynamic(t2):
				writeByte(89);
				writeTypeInstance(t2);
			case TVoid:
				writeByte(100);
			case TInt:
				writeByte(101);
			case TFloat:
				writeByte(102);
			case TBool:
				writeByte(103);
			case TString:
				writeByte(104);
		}
	}

	static inline function isVoid(t:HxbType):Bool
		return t.match(TVoid);

	function writeTypes(tl:Array<HxbType>):Void
		writeList(tl, writeTypeInstance);

	// ========================================================================
	// Type parameters
	// ========================================================================

	function typeParamHostIndex(h:HxbTypeParamHost):Int {
		return switch (h) {
			case TPHType: 0;
			case TPHConstructor: 1;
			case TPHMethod: 2;
			case TPHEnumConstructor: 3;
			case TPHAnonField: 4;
			case TPHLocal: 5;
			case TPHUnbound: 6;
		}
	}

	function writeTypeParametersForward(params:Array<HxbTypeParam>):Void {
		writeList(params, function(ttp) {
			writePath(ttp.path.pack, ttp.path.name);
			writePos(ttp.pos);
			writeByte(typeParamHostIndex(ttp.host));
		});
	}

	function writeTypeParametersData(params:Array<HxbTypeParam>):Void {
		for (ttp in params) {
			writeMetadata(ttp.meta);
			writeTypes(ttp.constraints);
			writeOption(ttp.def, writeTypeInstance);
		}
	}

	function writeTypeParameters(params:Array<HxbTypeParam>):Void {
		writeTypeParametersForward(params);
		writeTypeParametersData(params);
	}

	// ========================================================================
	// Field & var kinds
	// ========================================================================

	function writeAccessor(a:HxbVarAccess):Void {
		switch (a) {
			case AccNormal: writeByte(0);
			case AccNo: writeByte(1);
			case AccNever: writeByte(2);
			case AccCtor: writeByte(3);
			case AccCall: writeByte(4);
			case AccInline: writeByte(5);
			case AccRequire(s, message):
				writeByte(6);
				writeString(s);
				writeOption(message, writeString);
			case AccPrivateCall: writeByte(7);
		}
	}

	function writeFieldKind(k:HxbFieldKind):Void {
		switch (k) {
			case KMethod(MethNormal): writeByte(0);
			case KMethod(MethInline): writeByte(1);
			case KMethod(MethDynamic): writeByte(2);
			case KMethod(MethMacro): writeByte(3);
			case KVar(AccNormal, AccNormal): writeByte(10);
			case KVar(AccNormal, AccNo): writeByte(11);
			case KVar(AccNormal, AccNever): writeByte(12);
			case KVar(AccNormal, AccCtor): writeByte(13);
			case KVar(AccNormal, AccCall): writeByte(14);
			case KVar(AccInline, AccNever): writeByte(20);
			case KVar(AccCall, AccNormal): writeByte(30);
			case KVar(AccCall, AccNo): writeByte(31);
			case KVar(AccCall, AccNever): writeByte(32);
			case KVar(AccCall, AccCtor): writeByte(33);
			case KVar(AccCall, AccCall): writeByte(34);
			case KVar(r, w):
				writeByte(100);
				writeAccessor(r);
				writeAccessor(w);
		}
	}

	function writeVarKind(vk:HxbVarKind):Void {
		switch (vk) {
			case VUser(TVOLocalVariable): writeByte(0);
			case VUser(TVOArgument): writeByte(1);
			case VUser(TVOForVariable): writeByte(2);
			case VUser(TVOPatternVariable): writeByte(3);
			case VUser(TVOCatchVariable): writeByte(4);
			case VUser(TVOLocalFunction): writeByte(5);
			case VGenerated: writeByte(6);
			case VInlined: writeByte(7);
			case VInlinedConstructorVariable(names):
				writeByte(8);
				writeList(names, writeString);
			case VExtractorVariable: writeByte(9);
			case VAbstractThis: writeByte(10);
		}
	}

	// ========================================================================
	// Typed expressions (write_texpr)
	// ========================================================================

	function writeTexpr(fctx:FieldWriterContext, e:HxbTypedExpr):Void {
		// declare_local: write the var's local index, its extra, and var type.
		function declareLocal(v:HxbVar):Void {
			writeUleb128(fctx.localIndex(v));
			writeOption(v.extra, function(ve) {
				writeList(ve.params, i -> writeUleb128(i));
				writeOption(ve.expr, e2 -> writeTexpr(fctx, e2));
			});
			writeTypeInstance(v.type != null ? v.type : TVoid);
		}

		function loop(e2:HxbTypedExpr):Void {
			// `writeT` mirrors the OCaml `write_type` boolean: when true the
			// decoder reads a t_pool index after the node body, so we emit one.
			var writeT = true;
			switch (e2.expr) {
				case TConst(TNull):
					writeByte(0);
				case TConst(TThis):
					fctx.thisType = e2.t;
					writeByte(1);
					writeT = false;
				case TConst(TSuper):
					writeByte(2);
				case TConst(TBool(false)):
					writeByte(13);
				case TConst(TBool(true)):
					writeByte(14);
				case TConst(TInt(i)):
					writeByte(15);
					writeI32(i);
				case TConst(TFloat(s)):
					writeByte(16);
					writeString(s);
				case TConst(TString(s)):
					writeByte(17);
					writeString(s);
				case TLocal(v):
					writeByte(20);
					writeUleb128(fctx.localIndex(v));
				case TVar(v, null):
					writeByte(21);
					declareLocal(v);
					writeT = false;
				case TVar(v, e3):
					writeByte(22);
					declareLocal(v);
					loop(e3);
					writeT = false;
				case TBlock([]):
					writeByte(30);
				case TBlock(el):
					writeByte(39);
					writeUleb128(el.length);
					for (x in el)
						loop(x);
				case TFunction(tf):
					writeByte(50);
					writeList(tf.args, function(arg) {
						declareLocal(arg.v);
						writeOption(arg.value, v -> loop(v));
					});
					writeTypeInstance(tf.t);
					loop(tf.expr);
				case TArray(e3, e4):
					writeByte(60);
					loop(e3);
					loop(e4);
				case TParenthesis(e3):
					writeByte(61);
					loop(e3);
					writeT = false;
				case TArrayDecl(el):
					writeByte(62);
					writeList(el, x -> loop(x));
				case TObjectDecl(fl):
					writeByte(63);
					writeList(fl, function(f) {
						writeString(f.name);
						writePos(f.pos);
						writeByte(switch (f.quotes) {
							case NoQuotes: 0;
							case DoubleQuotes: 1;
						});
						loop(f.expr);
					});
				case TMeta(m, e3):
					writeByte(65);
					writeMetadataEntry(m);
					loop(e3);
				case TCall(e3, el):
					writeByte(79);
					loop(e3);
					writeList(el, x -> loop(x));
				case TIf(econd, eif, null):
					writeByte(80);
					loop(econd);
					loop(eif);
					writeT = false;
				case TIf(econd, eif, eelse):
					writeByte(81);
					loop(econd);
					loop(eif);
					loop(eelse);
				case TSwitch(subject, cases, edef):
					writeByte(82);
					loop(subject);
					writeList(cases, function(c) {
						writeList(c.patterns, x -> loop(x));
						loop(c.expr);
					});
					writeOption(edef, x -> loop(x));
				case TTry(e3, catches):
					writeByte(83);
					loop(e3);
					writeList(catches, function(c) {
						declareLocal(c.v);
						loop(c.expr);
					});
				case TWhile(econd, e3, normalWhile):
					writeByte(normalWhile ? 84 : 85);
					loop(econd);
					loop(e3);
					writeT = false;
				case TReturn(null):
					writeByte(90);
				case TReturn(e3):
					writeByte(91);
					loop(e3);
				case TContinue:
					writeByte(92);
				case TBreak:
					writeByte(93);
				case TThrow(e3):
					writeByte(94);
					loop(e3);
				case TEnumIndex(e3):
					writeByte(100);
					loop(e3);
					writeT = false;
				case TEnumParameter(e3, ef, i):
					writeByte(101);
					loop(e3);
					writeEnumFieldRef(ef);
					writeUleb128(i);
				case TField(e3, FInstance(c, tl, cf)):
					writeByte(102);
					loop(e3);
					writeClassRef(c);
					writeTypes(tl);
					writeFieldRef(cf);
				case TField(e3, FStatic(c, cf)):
					writeByte(103);
					loop(e3);
					writeClassRef(c);
					writeFieldRef(cf);
				case TField(e3, FAnon(cf)):
					writeByte(104);
					loop(e3);
					writeAnonFieldRef(cf);
				case TField(e3, FClosureInstance(c, tl, cf)):
					writeByte(105);
					loop(e3);
					writeClassRef(c);
					writeTypes(tl);
					writeFieldRef(cf);
				case TField(e3, FClosureAnon(cf)):
					writeByte(106);
					loop(e3);
					writeAnonFieldRef(cf);
				case TField(e3, FEnum(en, ef)):
					writeByte(107);
					loop(e3);
					writeEnumRef(en);
					writeEnumFieldRef(ef);
				case TField(e3, FDynamic(s)):
					writeByte(108);
					loop(e3);
					writeString(s);
				case TTypeExpr(MTClass(c)):
					writeByte(120);
					writeClassRef(c);
					writeT = false;
				case TTypeExpr(MTEnum(e3)):
					writeByte(121);
					writeEnumRef(e3);
					writeT = false;
				case TTypeExpr(MTAbstract(a)):
					writeByte(122);
					writeAbstractRef(a);
				case TTypeExpr(MTTypedef(td)):
					writeByte(123);
					writeTypedefRef(td);
				case TTypeExpr(MTUnknown(path)):
					// No tag reads a bare MTUnknown for TTypeExpr; the decoder
					// only produces MTUnknown via TCast (tag 125). Treat it as a
					// class type expression by path.
					writeByte(120);
					writeClassRef(path);
					writeT = false;
				case TCast(e3, null):
					writeByte(124);
					loop(e3);
				case TCast(e3, m):
					writeByte(125);
					loop(e3);
					writeFullPath(moduleTypeRefPath(m));
				case TNew(c, tl, el):
					writeByte(126);
					writeClassRef(c);
					writeTypes(tl);
					writeList(el, x -> loop(x));
				case TUnop(op, postFix, e3):
					writeByte(140 + unopIndex(op, postFix));
					loop(e3);
				case TBinop(op, e3, e4):
					writeByte(160 + binopIndex(op));
					loop(e3);
					loop(e4);
				case TIdent(s):
					writeByte(250);
					writeString(s);
			}
			if (writeT)
				writeUleb128(fctx.tPoolIndex(e2.t));
			// Always full position (relpos tag 4).
			writeByte(4);
			writePos(e2.pos);
		}

		loop(e);
	}

	static function moduleTypeRefPath(m:HxbModuleTypeRef):TypePath {
		return switch (m) {
			case MTClass(c) | MTEnum(c) | MTAbstract(c) | MTTypedef(c) | MTUnknown(c): c;
		}
	}

	function writeVar(fctx:FieldWriterContext, v:HxbVar):Void {
		// The var id is its local index within this field's expression.
		writeUleb128(fctx.localIndex(v));
		writeString(v.name);
		writeVarKind(v.kind);
		writeUleb128(v.flags);
		writeMetadata(v.meta);
		writePos(v.pos);
	}

	/**
		start_texpr + the expression(s). The compiler builds the body first
		(collecting the t_pool, var table and `this` type) and only then writes
		the prologue. We do the same: render the body into a temporary writer,
		then emit byte 0 (no local type params) + this-option + t_pool + vars +
		pos, followed by the body bytes.
	**/
	function writeFieldExpr(fe:HxbFieldExpr):Void {
		final fctx = new FieldWriterContext();

		final outer = ch;
		final body = new ByteWriter();
		ch = body;
		writeTexpr(fctx, fe.expr);
		writeOption(fe.unoptimized, e -> writeTexpr(fctx, e));
		final bodyBytes = body.getBytes();
		ch = outer;

		// start_texpr prologue
		writeByte(0); // no local type parameters
		writeOption(fctx.thisType, t -> writeTypeInstance(t));
		writeUleb128(fctx.tPool.length);
		for (t in fctx.tPool)
			writeTypeInstance(t);
		writeUleb128(fctx.vars.length);
		for (v in fctx.vars)
			writeVar(fctx, v);
		writePos(fe.expr.pos);

		ch.writeBytes(bodyBytes);
	}

	// ========================================================================
	// Fields (forward + data)
	// ========================================================================

	function writeClassFieldForward(cf:HxbClassField):Void {
		writeString(cf.name);
		writePosPair(cf.pos, cf.namePos);
		writeMetadata(cf.meta);
		writeList(cf.overloads, writeClassFieldForward);
	}

	/**
		read_field_type_parameters inverse: the field's param count, then either
		byte 0 (inherit the enclosing scope's params) or byte 1 + the params'
		forward + data.

		When the field declares its own type parameters we must emit them (byte
		1): a field body may reference them via `TTypeParam(TPSField, i)`, and
		both our decoder and the Haxe compiler resolve that by index into the
		field-parameter pool populated here. Writing byte 0 with a non-zero count
		would leave that pool empty and make such references go out of bounds.
	**/
	function writeFieldTypeParameters(params:Array<HxbTypeParam>):Void {
		writeUleb128(params.length);
		if (params.length == 0) {
			writeByte(0);
		} else {
			writeByte(1);
			writeTypeParameters(params);
		}
	}

	function writeClassFieldData(cf:HxbClassField):Void {
		writeFieldTypeParameters(cf.params);
		writeTypeInstance(cf.type);
		writeUleb128(cf.flags);
		writeDoc(cf.doc);
		writeFieldKind(cf.kind);
		if (cf.expr == null) {
			writeByte(0);
		} else {
			writeByte(1);
			writeFieldExpr(cf.expr);
		}
	}

	function writeClassFieldAndOverloadsData(cf:HxbClassField):Void {
		final cfl = [cf].concat(cf.overloads);
		writeUleb128(cfl.length);
		for (f in cfl)
			writeClassFieldData(f);
	}

	// ========================================================================
	// MTF — module types forward
	// ========================================================================

	function buildMtf():Bytes {
		startChunk();
		writeList(module.types, writeTypeForward);
		return ch.getBytes();
	}

	function writeTypeForward(t:HxbModuleType):Void {
		switch (t) {
			case MClass(c):
				writeByte(0);
				writePath(c.path.pack, c.path.name);
				writePosPair(c.pos, c.namePos);
				writeTypeParametersForward(c.params);
				writeUleb128(c.flags);
				writeOption(c.constructor, writeClassFieldForward);
				writeOption(c.init, writeClassFieldForward);
				writeUleb128(c.fields.length);
				writeUleb128(c.statics.length);
				// Forwards are written in REVERSE so the decoder's `.reverse()`
				// restores declaration order.
				writeFieldsReversed(c.fields);
				writeFieldsReversed(c.statics);
			case MEnum(e):
				writeByte(1);
				writePath(e.path.pack, e.path.name);
				writePosPair(e.pos, e.namePos);
				writeTypeParametersForward(e.params);
				writeList(e.constructors, function(ef) {
					writeString(ef.name);
					writePosPair(ef.pos, ef.namePos);
					writeUleb128(ef.index);
				});
			case MTypedef(td):
				writeByte(2);
				writePath(td.path.pack, td.path.name);
				writePosPair(td.pos, td.namePos);
				writeTypeParametersForward(td.params);
			case MAbstract(a):
				writeByte(3);
				writePath(a.path.pack, a.path.name);
				writePosPair(a.pos, a.namePos);
				writeTypeParametersForward(a.params);
		}
	}

	function writeFieldsReversed(fields:Array<HxbClassField>):Void {
		var i = fields.length;
		while (--i >= 0)
			writeClassFieldForward(fields[i]);
	}

	// ========================================================================
	// CLD / CFD — class definitions and field data
	// ========================================================================

	function buildCld():Null<Bytes> {
		final classes = module.classes();
		if (classes.length == 0)
			return null;
		startChunk();
		writeUleb128(classes.length);
		for (c in classes)
			writeClass(c);
		return ch.getBytes();
	}

	function writeCommonModuleType(isPrivate:Bool, doc:Null<HxbDoc>, meta:Array<HxbMetaEntry>, params:Array<HxbTypeParam>, usings:Array<HxbUsing>):Void {
		writeBool(isPrivate);
		writeDoc(doc);
		writeMetadata(meta);
		writeTypeParametersData(params);
		writeList(usings, function(u) {
			writeClassRef(u.c);
			writePos(u.pos);
		});
	}

	function writeClassKind(k:HxbClassKind):Void {
		switch (k) {
			case KNormal:
				writeByte(0);
			case KExpr(e):
				writeByte(2);
				writeExpr(e);
			case KGeneric:
				writeByte(3);
			case KGenericInstance(c, tl):
				writeByte(4);
				writeClassRef(c);
				writeTypes(tl);
			case KMacroType:
				writeByte(5);
			case KGenericBuild(fields):
				writeByte(6);
				writeList(fields, writeCField);
			case KAbstractImpl(a):
				writeByte(7);
				writeAbstractRef(a);
			case KModuleFields:
				writeByte(8);
		}
	}

	function writeClass(c:HxbClass):Void {
		writeCommonModuleType(c.isPrivate, c.doc, c.meta, c.params, c.usings);
		writeClassKind(c.kind);
		writeOption(c.superClass, function(rel) {
			writeClassRef(rel.t);
			writeTypes(rel.params);
		});
		writeList(c.interfaces, function(rel) {
			writeClassRef(rel.t);
			writeTypes(rel.params);
		});
		writeOption(c.dynamicType, writeTypeInstance);
		writeOption(c.arrayAccess, writeTypeInstance);
	}

	function buildCfd():Null<Bytes> {
		final classes = module.classes();
		if (classes.length == 0)
			return null;
		startChunk();
		writeUleb128(classes.length);
		for (c in classes) {
			writeOption(c.constructor, cf -> writeClassFieldAndOverloadsData(cf));
			writeOption(c.init, cf -> writeClassFieldAndOverloadsData(cf));
			writeList(c.fields, cf -> writeClassFieldAndOverloadsData(cf));
			writeList(c.statics, cf -> writeClassFieldAndOverloadsData(cf));
		}
		return ch.getBytes();
	}

	// ========================================================================
	// END / EFD — enum definitions and field data
	// ========================================================================

	function buildEnd():Null<Bytes> {
		final enums = module.enums();
		if (enums.length == 0)
			return null;
		startChunk();
		writeUleb128(enums.length);
		for (e in enums)
			writeEnum(e);
		return ch.getBytes();
	}

	function writeEnum(e:HxbEnum):Void {
		writeCommonModuleType(e.isPrivate, e.doc, e.meta, e.params, e.usings);
		writeUleb128(e.flags);
		writeList(e.names, writeString);
	}

	function buildEfd():Null<Bytes> {
		final enums = module.enums();
		if (enums.length == 0)
			return null;
		startChunk();
		writeUleb128(enums.length);
		for (e in enums) {
			writeList(e.constructors, function(ef) {
				writeString(ef.name);
				writeFieldTypeParameters(ef.params);
				writeTypeInstance(ef.type);
				writeDoc(ef.doc);
				writeMetadata(ef.meta);
			});
		}
		return ch.getBytes();
	}

	// ========================================================================
	// ABD / AFD — abstract definitions and field data
	// ========================================================================

	function buildAbd():Null<Bytes> {
		final abstracts = module.abstracts();
		if (abstracts.length == 0)
			return null;
		startChunk();
		writeUleb128(abstracts.length);
		for (a in abstracts)
			writeAbstract(a);
		return ch.getBytes();
	}

	function writeAbstract(a:HxbAbstract):Void {
		writeCommonModuleType(a.isPrivate, a.doc, a.meta, a.params, a.usings);
		writeOption(a.impl, writeClassRef);
		// underlyingThis: byte 0 is the "self" (`@:coreType`) form the decoder
		// reconstructs as `TAbstract(self, [])`. Emit it when the underlying is
		// exactly that self-reference; otherwise write the explicit type. This
		// mirrors the compiler, which writes byte 0 for core types (and avoids
		// fabricating a self abstract reference for `Void`/`Int`/… in `ABR`).
		if (isSelfAbstract(a)) {
			writeByte(0);
		} else {
			writeByte(1);
			writeTypeInstance(a.underlyingThis);
		}
		writeList(a.from, writeTypeInstance);
		writeList(a.to, writeTypeInstance);
		writeBool(a.isExtern);
		writeBool(a.isEnum);
	}

	static function isSelfAbstract(a:HxbAbstract):Bool {
		return switch (a.underlyingThis) {
			case TAbstract(p, params):
				params.length == 0 && p.pack.join("/") == a.path.pack.join("/") && p.name == a.path.name;
			case _: false;
		}
	}

	function buildAfd():Null<Bytes> {
		final abstracts = module.abstracts();
		if (abstracts.length == 0)
			return null;
		startChunk();
		writeUleb128(abstracts.length);
		for (a in abstracts)
			writeAbstractFields(a);
		return ch.getBytes();
	}

	function writeAbstractFields(a:HxbAbstract):Void {
		writeList(a.arrayAccess, writeFieldRef);
		writeOption(a.read, writeFieldRef);
		writeOption(a.write, writeFieldRef);
		writeOption(a.call, writeFieldRef);
		writeOption(a.constructor, writeFieldRef);
		writeList(a.ops, function(o) {
			writeByte(binopIndex(o.op));
			writeFieldRef(o.field);
		});
		writeList(a.unops, function(u) {
			writeByte(unopIndex(u.op, u.postFix));
			writeFieldRef(u.field);
		});
		writeList(a.fromField, writeFieldRef);
		writeList(a.toField, writeFieldRef);
	}

	// ========================================================================
	// TDD — typedef definitions
	// ========================================================================

	function buildTdd():Null<Bytes> {
		final typedefs = module.typedefs();
		if (typedefs.length == 0)
			return null;
		startChunk();
		writeUleb128(typedefs.length);
		for (td in typedefs)
			writeTypedef(td);
		return ch.getBytes();
	}

	function writeTypedef(td:HxbTypedef):Void {
		writeCommonModuleType(td.isPrivate, td.doc, td.meta, td.params, td.usings);
		writeTypeInstance(td.type);
	}

	// ========================================================================
	// Anonymous structures (OFR / OFD / OBD)
	// ========================================================================

	function writeAnon(an:HxbAnon):Void {
		switch (an.status) {
			case AClosed:
				writeByte(0);
			case AConst:
				writeByte(1);
			case AExtend(types):
				writeByte(2);
				writeTypes(types);
		}
		writeList(an.fields, cf -> writeAnonFieldRef(cf));
	}

	function buildOfr():Null<Bytes> {
		// Walk every collected anon's definition, which appends its fields to
		// the anon-field pool (and may discover more anons). Iterate until the
		// pool stabilizes.
		// The actual definitions are produced in OBD/OFD; OFR just forward-
		// declares each anon field discovered.
		finalizeAnonPools();
		if (anonFieldList.length == 0)
			return null;
		startChunk();
		writeUleb128(anonFieldList.length);
		for (cf in anonFieldList)
			writeClassFieldForward(cf);
		return ch.getBytes();
	}

	function buildOfd():Null<Bytes> {
		if (anonFieldList.length == 0)
			return null;
		startChunk();
		writeUleb128(anonFieldList.length);
		for (i in 0...anonFieldList.length) {
			writeUleb128(i);
			writeClassFieldAndOverloadsData(anonFieldList[i]);
		}
		return ch.getBytes();
	}

	function buildObd():Null<Bytes> {
		if (anonList.length == 0)
			return null;
		startChunk();
		writeUleb128(anonList.length);
		for (i in 0...anonList.length) {
			writeUleb128(i);
			writeAnon(anonList[i]);
		}
		return ch.getBytes();
	}

	/**
		Ensure `anonList`/`anonFieldList` are fully populated. Writing an anon's
		definition references its fields (adding them to the anon-field pool),
		and writing an anon field's data may reference more anons/fields. We
		drive that to a fixed point here by serializing definitions into a scratch
		writer purely for the side effect of pool population.
	**/
	function finalizeAnonPools():Void {
		final outer = ch;
		final scratch = new ByteWriter();
		ch = scratch;
		var anonDone = 0;
		var fieldDone = 0;
		while (anonDone < anonList.length || fieldDone < anonFieldList.length) {
			while (anonDone < anonList.length) {
				writeAnon(anonList[anonDone]);
				anonDone++;
			}
			while (fieldDone < anonFieldList.length) {
				writeClassFieldAndOverloadsData(anonFieldList[fieldDone]);
				fieldDone++;
			}
		}
		ch = outer;
	}

	// ========================================================================
	// CFR / EFR — class-field and enum-field references
	// ========================================================================

	function buildCfr():Null<Bytes> {
		if (fieldRefPool.length == 0)
			return null;
		startChunk();
		writeUleb128(fieldRefPool.length);
		for (ref in fieldRefPool) {
			writeClassRef(ref.owner);
			switch (ref.kind) {
				case FRStatic:
					writeByte(0);
					writeString(ref.name);
				case FRMember:
					writeByte(1);
					writeString(ref.name);
				case FRConstructor:
					writeByte(2);
				case FRInit:
					writeByte(3);
			}
			writeUleb128(ref.depth);
		}
		return ch.getBytes();
	}

	function buildEfr():Null<Bytes> {
		if (enumFieldRefPool.length == 0)
			return null;
		startChunk();
		writeUleb128(enumFieldRefPool.length);
		for (ref in enumFieldRefPool) {
			writeEnumRef(ref.owner);
			writeString(ref.name);
		}
		return ch.getBytes();
	}

	// ========================================================================
	// Reference pools (CLR / ENR / ABR / TDR), IMP, MDF, string pools
	// ========================================================================

	function buildRefPool(pool:Array<TypePath>):Null<Bytes> {
		if (pool.length == 0)
			return null;
		startChunk();
		writeUleb128(pool.length);
		for (p in pool)
			writeFullPath(p);
		return ch.getBytes();
	}

	function buildImp():Null<Bytes> {
		if (module.imports.length == 0)
			return null;
		startChunk();
		writeUleb128(module.imports.length);
		for (imp in module.imports)
			writePath(imp.pack, imp.name);
		return ch.getBytes();
	}

	function buildMdf():Bytes {
		startChunk();
		writePath(module.pack, module.name);
		writeString(module.file);
		writeUleb128(anonList.length);
		writeUleb128(module.monoCount);
		return ch.getBytes();
	}

	function buildStringPool(pool:Array<String>):Bytes {
		startChunk();
		writeUleb128(pool.length);
		for (s in pool)
			ch.writeRawString(s);
		return ch.getBytes();
	}

	// ========================================================================
	// Misc
	// ========================================================================

	inline function startChunk():Void
		ch = new ByteWriter();
}

/**
	The per-field context used while writing a typed expression: the type pool
	(distinct types referenced by node `t`s), the variable table (assigned local
	indices in first-use order), and the discovered `this` type.
**/
private class FieldWriterContext {
	public final tPool:Array<HxbType> = [];
	final tPoolKeys = new Map<String, Int>();

	public final vars:Array<HxbVar> = [];
	final varIndex = new haxe.ds.ObjectMap<HxbVar, Int>();

	public var thisType:Null<HxbType> = null;

	public function new() {}

	/** The index of `v` in the field's var table, assigning one on first use. **/
	public function localIndex(v:HxbVar):Int {
		var i = varIndex.get(v);
		if (i == null) {
			i = vars.length;
			vars.push(v);
			varIndex.set(v, i);
		}
		return i;
	}

	/** The index of type `t` in the field's t_pool, by structural identity. **/
	public function tPoolIndex(t:HxbType):Int {
		final key = hx2go.hxb.tools.TypeTools.toString(t);
		final existing = tPoolKeys.get(key);
		if (existing != null)
			return existing;
		final idx = tPool.length;
		tPool.push(t);
		tPoolKeys.set(key, idx);
		return idx;
	}
}
