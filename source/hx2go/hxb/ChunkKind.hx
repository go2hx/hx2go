package hx2go.hxb;

/**
	The kinds of chunk that make up a serialized HXB module.

	The integer value of each constructor is its *declaration ordinal* in the
	Haxe compiler's `hxbData.ml`. This matters: when a module is written to
	disk the chunks are emitted sorted by this ordinal, so on-disk order is
	exactly the order below. `hxb` preserves that ordering for byte-exact
	round-tripping.

	Mnemonics: `..F` = forward declaration, `..R` = reference, `..D` =
	definition; `EO.` = end-of marker.
**/
enum abstract ChunkKind(Int) from Int to Int {
	var STR = 0; // string pool
	var DOC = 1; // doc pool
	var MDF = 2; // module forward (path, file, anon/mono counts)
	var MTF = 3; // module types forward
	var IMP = 4; // imports
	var CLR = 5; // class references
	var ENR = 6; // enum references
	var ABR = 7; // abstract references
	var TDR = 8; // typedef references
	var OFR = 9; // anonymous-object field references
	var OFD = 10; // anonymous-object field definitions
	var OBD = 11; // anonymous-object definitions
	var CLD = 12; // class definitions
	var END = 13; // enum definitions
	var ABD = 14; // abstract definitions
	var TDD = 15; // typedef definitions
	var EOT = 16; // end of module types
	var EFR = 17; // enum field references
	var CFR = 18; // class field references
	var CFD = 19; // class field definitions
	var EFD = 20; // enum field definitions
	var AFD = 21; // abstract field definitions
	var EOF = 22; // end of fields
	var EXD = 23; // class field expressions (deferred)
	var EOM = 24; // end of module

	/** The 3-character on-disk name of this chunk (e.g. `STR`, `EOM`). **/
	public function toName():String {
		return switch (cast this : ChunkKind) {
			case STR: "STR";
			case DOC: "DOC";
			case MDF: "MDF";
			case MTF: "MTF";
			case IMP: "IMP";
			case CLR: "CLR";
			case ENR: "ENR";
			case ABR: "ABR";
			case TDR: "TDR";
			case OFR: "OFR";
			case OFD: "OFD";
			case OBD: "OBD";
			case CLD: "CLD";
			case END: "END";
			case ABD: "ABD";
			case TDD: "TDD";
			case EOT: "EOT";
			case EFR: "EFR";
			case CFR: "CFR";
			case CFD: "CFD";
			case EFD: "EFD";
			case AFD: "AFD";
			case EOF: "EOF";
			case EXD: "EXD";
			case EOM: "EOM";
		}
	}

	/** Parse a 3-character chunk name, throwing `HxbError` on an unknown name. **/
	public static function ofName(name:String):ChunkKind {
		return switch (name) {
			case "STR": STR;
			case "DOC": DOC;
			case "MDF": MDF;
			case "MTF": MTF;
			case "IMP": IMP;
			case "CLR": CLR;
			case "ENR": ENR;
			case "ABR": ABR;
			case "TDR": TDR;
			case "OFR": OFR;
			case "OFD": OFD;
			case "OBD": OBD;
			case "CLD": CLD;
			case "END": END;
			case "ABD": ABD;
			case "TDD": TDD;
			case "EOT": EOT;
			case "EFR": EFR;
			case "CFR": CFR;
			case "CFD": CFD;
			case "EFD": EFD;
			case "AFD": AFD;
			case "EOF": EOF;
			case "EXD": EXD;
			case "EOM": EOM;
			case _: throw new HxbError('Invalid chunk name: $name');
		}
	}

	/** The numeric declaration ordinal (also the sort key for on-disk order). **/
	public inline function ordinal():Int {
		return this;
	}
}
