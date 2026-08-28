package go;

/**
    Package unicode provides data and functions to test some properties of
    Unicode code points.
**/
@:go.Type({ name: "unicode", instanceName: "unicode.unicode", imports: ["unicode"] })
extern class Unicode {

    /**
        Indices into the Delta arrays inside CaseRanges for case mapping.
    **/
    @:native("LowerCase") static var lowerCase: go.GoInt;
    @:native("MaxASCII") static var maxASCII: go.Rune;
    /**
        Indices into the Delta arrays inside CaseRanges for case mapping.
    **/
    @:native("MaxCase") static var maxCase: go.GoInt;
    @:native("MaxLatin1") static var maxLatin1: go.Rune;
    @:native("MaxRune") static var maxRune: go.Rune;
    @:native("ReplacementChar") static var replacementChar: go.Rune;
    /**
        Indices into the Delta arrays inside CaseRanges for case mapping.
    **/
    @:native("TitleCase") static var titleCase: go.GoInt;
    /**
        Indices into the Delta arrays inside CaseRanges for case mapping.
    **/
    @:native("UpperCase") static var upperCase: go.GoInt;
    /**
        If the Delta field of a [CaseRange] is UpperLower, it means
        this CaseRange represents a sequence of the form (say)
        [Upper] [Lower] [Upper] [Lower].
    **/
    @:native("UpperLower") static var upperLower: go.Rune;
    /**
        Version is the Unicode edition from which the tables are derived.
    **/
    @:native("Version") static var version: String;

    /**
        These variables have type *RangeTable.
    **/
    @:native("ASCII_Hex_Digit") static var aSCII_Hex_Digit: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Adlam") static var adlam: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Ahom") static var ahom: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Anatolian_Hieroglyphs") static var anatolian_Hieroglyphs: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Arabic") static var arabic: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Armenian") static var armenian: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Avestan") static var avestan: go.Pointer<go.unicode.RangeTable>;
    @:native("AzeriCase") static var azeriCase: go.unicode.SpecialCase;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Balinese") static var balinese: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Bamum") static var bamum: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Bassa_Vah") static var bassa_Vah: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Batak") static var batak: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Bengali") static var bengali: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Bhaiksuki") static var bhaiksuki: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Bidi_Control") static var bidi_Control: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Bopomofo") static var bopomofo: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Brahmi") static var brahmi: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Braille") static var braille: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Buginese") static var buginese: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Buhid") static var buhid: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("C") static var C: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Canadian_Aboriginal") static var canadian_Aboriginal: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Carian") static var carian: go.Pointer<go.unicode.RangeTable>;
    /**
        CaseRanges is the table describing case mappings for all letters with
        non-self mappings.
    **/
    @:native("CaseRanges") static var caseRanges: go.Slice<go.unicode.CaseRange>;
    /**
        Categories is the set of Unicode category tables.
    **/
    @:native("Categories") static var categories: go.Map<String, go.Pointer<go.unicode.RangeTable>>;
    /**
        CategoryAliases maps category aliases to standard category names.
    **/
    @:native("CategoryAliases") static var categoryAliases: go.Map<String, String>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Caucasian_Albanian") static var caucasian_Albanian: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Cc") static var cc: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Cf") static var cf: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Chakma") static var chakma: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Cham") static var cham: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Cherokee") static var cherokee: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Chorasmian") static var chorasmian: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Cn") static var cn: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Co") static var co: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Common") static var common: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Coptic") static var coptic: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Cs") static var cs: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Cuneiform") static var cuneiform: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Cypriot") static var cypriot: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Cypro_Minoan") static var cypro_Minoan: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Cyrillic") static var cyrillic: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Dash") static var dash: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Deprecated") static var deprecated: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Deseret") static var deseret: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Devanagari") static var devanagari: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Diacritic") static var diacritic: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Digit") static var digit: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Dives_Akuru") static var dives_Akuru: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Dogra") static var dogra: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Duployan") static var duployan: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Egyptian_Hieroglyphs") static var egyptian_Hieroglyphs: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Elbasan") static var elbasan: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Elymaic") static var elymaic: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Ethiopic") static var ethiopic: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Extender") static var extender: go.Pointer<go.unicode.RangeTable>;
    /**
        FoldCategory maps a category name to a table of
        code points outside the category that are equivalent under
        simple case folding to code points inside the category.
        If there is no entry for a category name, there are no such points.
    **/
    @:native("FoldCategory") static var foldCategory: go.Map<String, go.Pointer<go.unicode.RangeTable>>;
    /**
        FoldScript maps a script name to a table of
        code points outside the script that are equivalent under
        simple case folding to code points inside the script.
        If there is no entry for a script name, there are no such points.
    **/
    @:native("FoldScript") static var foldScript: go.Map<String, go.Pointer<go.unicode.RangeTable>>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Georgian") static var georgian: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Glagolitic") static var glagolitic: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Gothic") static var gothic: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Grantha") static var grantha: go.Pointer<go.unicode.RangeTable>;
    /**
        GraphicRanges defines the set of graphic characters according to Unicode.
    **/
    @:native("GraphicRanges") static var graphicRanges: go.Slice<go.Pointer<go.unicode.RangeTable>>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Greek") static var greek: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Gujarati") static var gujarati: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Gunjala_Gondi") static var gunjala_Gondi: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Gurmukhi") static var gurmukhi: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Han") static var han: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Hangul") static var hangul: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Hanifi_Rohingya") static var hanifi_Rohingya: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Hanunoo") static var hanunoo: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Hatran") static var hatran: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Hebrew") static var hebrew: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Hex_Digit") static var hex_Digit: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Hiragana") static var hiragana: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Hyphen") static var hyphen: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("IDS_Binary_Operator") static var iDS_Binary_Operator: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("IDS_Trinary_Operator") static var iDS_Trinary_Operator: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Ideographic") static var ideographic: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Imperial_Aramaic") static var imperial_Aramaic: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Inherited") static var inherited: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Inscriptional_Pahlavi") static var inscriptional_Pahlavi: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Inscriptional_Parthian") static var inscriptional_Parthian: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Javanese") static var javanese: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Join_Control") static var join_Control: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Kaithi") static var kaithi: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Kannada") static var kannada: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Katakana") static var katakana: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Kawi") static var kawi: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Kayah_Li") static var kayah_Li: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Kharoshthi") static var kharoshthi: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Khitan_Small_Script") static var khitan_Small_Script: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Khmer") static var khmer: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Khojki") static var khojki: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Khudawadi") static var khudawadi: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("L") static var L: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("LC") static var LC: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Lao") static var lao: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Latin") static var latin: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Lepcha") static var lepcha: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Letter") static var letter: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Limbu") static var limbu: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Linear_A") static var linear_A: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Linear_B") static var linear_B: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Lisu") static var lisu: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Ll") static var ll: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Lm") static var lm: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Lo") static var lo: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Logical_Order_Exception") static var logical_Order_Exception: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Lower") static var lower: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Lt") static var lt: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Lu") static var lu: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Lycian") static var lycian: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Lydian") static var lydian: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("M") static var M: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Mahajani") static var mahajani: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Makasar") static var makasar: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Malayalam") static var malayalam: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Mandaic") static var mandaic: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Manichaean") static var manichaean: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Marchen") static var marchen: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Mark") static var mark: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Masaram_Gondi") static var masaram_Gondi: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Mc") static var mc: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Me") static var me: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Medefaidrin") static var medefaidrin: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Meetei_Mayek") static var meetei_Mayek: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Mende_Kikakui") static var mende_Kikakui: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Meroitic_Cursive") static var meroitic_Cursive: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Meroitic_Hieroglyphs") static var meroitic_Hieroglyphs: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Miao") static var miao: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Mn") static var mn: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Modi") static var modi: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Mongolian") static var mongolian: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Mro") static var mro: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Multani") static var multani: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Myanmar") static var myanmar: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("N") static var N: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Nabataean") static var nabataean: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Nag_Mundari") static var nag_Mundari: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Nandinagari") static var nandinagari: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Nd") static var nd: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("New_Tai_Lue") static var new_Tai_Lue: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Newa") static var newa: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Nko") static var nko: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Nl") static var nl: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("No") static var no: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Noncharacter_Code_Point") static var noncharacter_Code_Point: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Number") static var number: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Nushu") static var nushu: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Nyiakeng_Puachue_Hmong") static var nyiakeng_Puachue_Hmong: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Ogham") static var ogham: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Ol_Chiki") static var ol_Chiki: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Old_Hungarian") static var old_Hungarian: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Old_Italic") static var old_Italic: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Old_North_Arabian") static var old_North_Arabian: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Old_Permic") static var old_Permic: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Old_Persian") static var old_Persian: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Old_Sogdian") static var old_Sogdian: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Old_South_Arabian") static var old_South_Arabian: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Old_Turkic") static var old_Turkic: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Old_Uyghur") static var old_Uyghur: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Oriya") static var oriya: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Osage") static var osage: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Osmanya") static var osmanya: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Other") static var other: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Other_Alphabetic") static var other_Alphabetic: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Other_Default_Ignorable_Code_Point") static var other_Default_Ignorable_Code_Point: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Other_Grapheme_Extend") static var other_Grapheme_Extend: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Other_ID_Continue") static var other_ID_Continue: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Other_ID_Start") static var other_ID_Start: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Other_Lowercase") static var other_Lowercase: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Other_Math") static var other_Math: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Other_Uppercase") static var other_Uppercase: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("P") static var P: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Pahawh_Hmong") static var pahawh_Hmong: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Palmyrene") static var palmyrene: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Pattern_Syntax") static var pattern_Syntax: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Pattern_White_Space") static var pattern_White_Space: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Pau_Cin_Hau") static var pau_Cin_Hau: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Pc") static var pc: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Pd") static var pd: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Pe") static var pe: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Pf") static var pf: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Phags_Pa") static var phags_Pa: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Phoenician") static var phoenician: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Pi") static var pi: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Po") static var po: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Prepended_Concatenation_Mark") static var prepended_Concatenation_Mark: go.Pointer<go.unicode.RangeTable>;
    /**
        PrintRanges defines the set of printable characters according to Go.
        ASCII space, U+0020, is handled separately.
    **/
    @:native("PrintRanges") static var printRanges: go.Slice<go.Pointer<go.unicode.RangeTable>>;
    /**
        Properties is the set of Unicode property tables.
    **/
    @:native("Properties") static var properties: go.Map<String, go.Pointer<go.unicode.RangeTable>>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Ps") static var ps: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Psalter_Pahlavi") static var psalter_Pahlavi: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Punct") static var punct: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Quotation_Mark") static var quotation_Mark: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Radical") static var radical: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Regional_Indicator") static var regional_Indicator: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Rejang") static var rejang: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Runic") static var runic: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("S") static var S: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("STerm") static var sTerm: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Samaritan") static var samaritan: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Saurashtra") static var saurashtra: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Sc") static var sc: go.Pointer<go.unicode.RangeTable>;
    /**
        Scripts is the set of Unicode script tables.
    **/
    @:native("Scripts") static var scripts: go.Map<String, go.Pointer<go.unicode.RangeTable>>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Sentence_Terminal") static var sentence_Terminal: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Sharada") static var sharada: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Shavian") static var shavian: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Siddham") static var siddham: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("SignWriting") static var signWriting: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Sinhala") static var sinhala: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Sk") static var sk: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Sm") static var sm: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("So") static var so: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Soft_Dotted") static var soft_Dotted: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Sogdian") static var sogdian: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Sora_Sompeng") static var sora_Sompeng: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Soyombo") static var soyombo: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Space") static var space: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Sundanese") static var sundanese: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Syloti_Nagri") static var syloti_Nagri: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Symbol") static var symbol: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Syriac") static var syriac: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Tagalog") static var tagalog: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Tagbanwa") static var tagbanwa: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Tai_Le") static var tai_Le: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Tai_Tham") static var tai_Tham: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Tai_Viet") static var tai_Viet: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Takri") static var takri: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Tamil") static var tamil: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Tangsa") static var tangsa: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Tangut") static var tangut: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Telugu") static var telugu: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Terminal_Punctuation") static var terminal_Punctuation: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Thaana") static var thaana: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Thai") static var thai: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Tibetan") static var tibetan: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Tifinagh") static var tifinagh: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Tirhuta") static var tirhuta: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Title") static var title: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Toto") static var toto: go.Pointer<go.unicode.RangeTable>;
    @:native("TurkishCase") static var turkishCase: go.unicode.SpecialCase;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Ugaritic") static var ugaritic: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Unified_Ideograph") static var unified_Ideograph: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Upper") static var upper: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Vai") static var vai: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Variation_Selector") static var variation_Selector: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Vithkuqi") static var vithkuqi: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Wancho") static var wancho: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Warang_Citi") static var warang_Citi: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("White_Space") static var white_Space: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Yezidi") static var yezidi: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Yi") static var yi: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Z") static var Z: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Zanabazar_Square") static var zanabazar_Square: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Zl") static var zl: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Zp") static var zp: go.Pointer<go.unicode.RangeTable>;
    /**
        These variables have type *RangeTable.
    **/
    @:native("Zs") static var zs: go.Pointer<go.unicode.RangeTable>;

    /**
        In reports whether the rune is a member of one of the ranges.
    **/
    @:native("In") static function _in(r: go.Rune, ranges: haxe.Rest<go.Pointer<go.unicode.RangeTable>>): (Bool);
    /**
        Is reports whether the rune is in the specified table of ranges.
    **/
    @:native("Is") static function _is(rangeTab: go.Pointer<go.unicode.RangeTable>, r: go.Rune): (Bool);
    /**
        IsControl reports whether the rune is a control character.
        The [C] ([Other]) Unicode category includes more code points
        such as surrogates; use [Is](C, r) to test for them.
    **/
    @:native("IsControl") static function isControl(r: go.Rune): (Bool);
    /**
        IsDigit reports whether the rune is a decimal digit.
    **/
    @:native("IsDigit") static function isDigit(r: go.Rune): (Bool);
    /**
        IsGraphic reports whether the rune is defined as a Graphic by Unicode.
        Such characters include letters, marks, numbers, punctuation, symbols, and
        spaces, from categories [L], [M], [N], [P], [S], [Zs].
    **/
    @:native("IsGraphic") static function isGraphic(r: go.Rune): (Bool);
    /**
        IsLetter reports whether the rune is a letter (category [L]).
    **/
    @:native("IsLetter") static function isLetter(r: go.Rune): (Bool);
    /**
        IsLower reports whether the rune is a lower case letter.
    **/
    @:native("IsLower") static function isLower(r: go.Rune): (Bool);
    /**
        IsMark reports whether the rune is a mark character (category [M]).
    **/
    @:native("IsMark") static function isMark(r: go.Rune): (Bool);
    /**
        IsNumber reports whether the rune is a number (category [N]).
    **/
    @:native("IsNumber") static function isNumber(r: go.Rune): (Bool);
    /**
        IsOneOf reports whether the rune is a member of one of the ranges.
        The function "In" provides a nicer signature and should be used in preference to IsOneOf.
    **/
    @:native("IsOneOf") static function isOneOf(ranges: go.Slice<go.Pointer<go.unicode.RangeTable>>, r: go.Rune): (Bool);
    /**
        IsPrint reports whether the rune is defined as printable by Go. Such
        characters include letters, marks, numbers, punctuation, symbols, and the
        ASCII space character, from categories [L], [M], [N], [P], [S] and the ASCII space
        character. This categorization is the same as [IsGraphic] except that the
        only spacing character is ASCII space, U+0020.
    **/
    @:native("IsPrint") static function isPrint(r: go.Rune): (Bool);
    /**
        IsPunct reports whether the rune is a Unicode punctuation character
        (category [P]).
    **/
    @:native("IsPunct") static function isPunct(r: go.Rune): (Bool);
    /**
        IsSpace reports whether the rune is a space character as defined
        by Unicode's White Space property; in the Latin-1 space
        this is
        
        	'\t', '\n', '\v', '\f', '\r', ' ', U+0085 (NEL), U+00A0 (NBSP).
        
        Other definitions of spacing characters are set by category
        Z and property [Pattern_White_Space].
    **/
    @:native("IsSpace") static function isSpace(r: go.Rune): (Bool);
    /**
        IsSymbol reports whether the rune is a symbolic character.
    **/
    @:native("IsSymbol") static function isSymbol(r: go.Rune): (Bool);
    /**
        IsTitle reports whether the rune is a title case letter.
    **/
    @:native("IsTitle") static function isTitle(r: go.Rune): (Bool);
    /**
        IsUpper reports whether the rune is an upper case letter.
    **/
    @:native("IsUpper") static function isUpper(r: go.Rune): (Bool);
    /**
        SimpleFold iterates over Unicode code points equivalent under
        the Unicode-defined simple case folding. Among the code points
        equivalent to rune (including rune itself), SimpleFold returns the
        smallest rune > r if one exists, or else the smallest rune >= 0.
        If r is not a valid Unicode code point, SimpleFold(r) returns r.
        
        For example:
        
        	SimpleFold('A') = 'a'
        	SimpleFold('a') = 'A'
        
        	SimpleFold('K') = 'k'
        	SimpleFold('k') = '\u212A' (Kelvin symbol, K)
        	SimpleFold('\u212A') = 'K'
        
        	SimpleFold('1') = '1'
        
        	SimpleFold(-2) = -2
    **/
    @:native("SimpleFold") static function simpleFold(r: go.Rune): (go.Rune);
    /**
        To maps the rune to the specified case: [UpperCase], [LowerCase], or [TitleCase].
    **/
    @:native("To") static function _to(_case: go.GoInt, r: go.Rune): (go.Rune);
    /**
        ToLower maps the rune to lower case.
    **/
    @:native("ToLower") static function toLower(r: go.Rune): (go.Rune);
    /**
        ToTitle maps the rune to title case.
    **/
    @:native("ToTitle") static function toTitle(r: go.Rune): (go.Rune);
    /**
        ToUpper maps the rune to upper case.
    **/
    @:native("ToUpper") static function toUpper(r: go.Rune): (go.Rune);

}