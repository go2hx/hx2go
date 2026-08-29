package go;

/**
    Package bytes implements functions for the manipulation of byte slices.
    It is analogous to the facilities of the [strings] package.
**/
@:go.Type({ name: "bytes", instanceName: "bytes.bytes", imports: ["bytes"] })
extern class Bytes {

    /**
        MinRead is the minimum slice size passed to a [Buffer.Read] call by
        [Buffer.ReadFrom]. As long as the [Buffer] has at least MinRead bytes beyond
        what is required to hold the contents of r, [Buffer.ReadFrom] will not grow the
        underlying buffer.
    **/
    @:native("MinRead") static var minRead: go.GoInt;

    /**
        Clone returns a copy of b[:len(b)].
        The result may have additional unused capacity.
        Clone(nil) returns nil.
    **/
    @:native("Clone") static function clone(b: go.Slice<go.Byte>): (go.Slice<go.Byte>);
    /**
        Compare returns an integer comparing two byte slices lexicographically.
        The result will be 0 if a == b, -1 if a < b, and +1 if a > b.
        A nil argument is equivalent to an empty slice.
    **/
    @:native("Compare") static function compare(a: go.Slice<go.Byte>, b: go.Slice<go.Byte>): (go.GoInt);
    /**
        Contains reports whether subslice is within b.
    **/
    @:native("Contains") static function contains(b: go.Slice<go.Byte>, subslice: go.Slice<go.Byte>): (Bool);
    /**
        ContainsAny reports whether any of the UTF-8-encoded code points in chars are within b.
    **/
    @:native("ContainsAny") static function containsAny(b: go.Slice<go.Byte>, chars: String): (Bool);
    /**
        ContainsFunc reports whether any of the UTF-8-encoded code points r within b satisfy f(r).
    **/
    @:native("ContainsFunc") static function containsFunc(b: go.Slice<go.Byte>, f: (p0: go.Rune) -> (Bool)): (Bool);
    /**
        ContainsRune reports whether the rune is contained in the UTF-8-encoded byte slice b.
    **/
    @:native("ContainsRune") static function containsRune(b: go.Slice<go.Byte>, r: go.Rune): (Bool);
    /**
        Count counts the number of non-overlapping instances of sep in s.
        If sep is an empty slice, Count returns 1 + the number of UTF-8-encoded code points in s.
    **/
    @:native("Count") static function count(s: go.Slice<go.Byte>, sep: go.Slice<go.Byte>): (go.GoInt);
    /**
        Cut slices s around the first instance of sep,
        returning the text before and after sep.
        The found result reports whether sep appears in s.
        If sep does not appear in s, cut returns s, nil, false.
        
        Cut returns slices of the original slice s, not copies.
    **/
    @:go.Tuple("before", "after", "found") @:native("Cut") static function cut(s: go.Slice<go.Byte>, sep: go.Slice<go.Byte>): (go.Tuple<{ before: go.Slice<go.Byte>, after: go.Slice<go.Byte>, found: Bool }>);
    /**
        CutPrefix returns s without the provided leading prefix byte slice
        and reports whether it found the prefix.
        If s doesn't start with prefix, CutPrefix returns s, false.
        If prefix is the empty byte slice, CutPrefix returns s, true.
        
        CutPrefix returns slices of the original slice s, not copies.
    **/
    @:go.Tuple("after", "found") @:native("CutPrefix") static function cutPrefix(s: go.Slice<go.Byte>, prefix: go.Slice<go.Byte>): (go.Tuple<{ after: go.Slice<go.Byte>, found: Bool }>);
    /**
        CutSuffix returns s without the provided ending suffix byte slice
        and reports whether it found the suffix.
        If s doesn't end with suffix, CutSuffix returns s, false.
        If suffix is the empty byte slice, CutSuffix returns s, true.
        
        CutSuffix returns slices of the original slice s, not copies.
    **/
    @:go.Tuple("before", "found") @:native("CutSuffix") static function cutSuffix(s: go.Slice<go.Byte>, suffix: go.Slice<go.Byte>): (go.Tuple<{ before: go.Slice<go.Byte>, found: Bool }>);
    /**
        Equal reports whether a and b
        are the same length and contain the same bytes.
        A nil argument is equivalent to an empty slice.
    **/
    @:native("Equal") static function equal(a: go.Slice<go.Byte>, b: go.Slice<go.Byte>): (Bool);
    /**
        EqualFold reports whether s and t, interpreted as UTF-8 strings,
        are equal under simple Unicode case-folding, which is a more general
        form of case-insensitivity.
    **/
    @:native("EqualFold") static function equalFold(s: go.Slice<go.Byte>, t: go.Slice<go.Byte>): (Bool);
    /**
        Fields interprets s as a sequence of UTF-8-encoded code points.
        It splits the slice s around each instance of one or more consecutive white space
        characters, as defined by [unicode.IsSpace], returning a slice of subslices of s or an
        empty slice if s contains only white space. Every element of the returned slice is
        non-empty. Unlike [Split], leading and trailing runs of white space characters
        are discarded.
    **/
    @:native("Fields") static function fields(s: go.Slice<go.Byte>): (go.Slice<go.Slice<go.Byte>>);
    /**
        FieldsFunc interprets s as a sequence of UTF-8-encoded code points.
        It splits the slice s at each run of code points c satisfying f(c) and
        returns a slice of subslices of s. If all code points in s satisfy f(c), or
        len(s) == 0, an empty slice is returned. Every element of the returned slice is
        non-empty. Unlike [Split], leading and trailing runs of code points
        satisfying f(c) are discarded.
        
        FieldsFunc makes no guarantees about the order in which it calls f(c)
        and assumes that f always returns the same value for a given c.
    **/
    @:native("FieldsFunc") static function fieldsFunc(s: go.Slice<go.Byte>, f: (p0: go.Rune) -> (Bool)): (go.Slice<go.Slice<go.Byte>>);
    /**
        FieldsFuncSeq returns an iterator over subslices of s split around runs of
        Unicode code points satisfying f(c).
        The iterator yields the same subslices that would be returned by [FieldsFunc](s),
        but without constructing a new slice containing the subslices.
    **/
    @:native("FieldsFuncSeq") static function fieldsFuncSeq(s: go.Slice<go.Byte>, f: (p0: go.Rune) -> (Bool)): (go.iter.Seq<go.Slice<go.Byte>>);
    /**
        FieldsSeq returns an iterator over subslices of s split around runs of
        whitespace characters, as defined by [unicode.IsSpace].
        The iterator yields the same subslices that would be returned by [Fields](s),
        but without constructing a new slice containing the subslices.
    **/
    @:native("FieldsSeq") static function fieldsSeq(s: go.Slice<go.Byte>): (go.iter.Seq<go.Slice<go.Byte>>);
    /**
        HasPrefix reports whether the byte slice s begins with prefix.
    **/
    @:native("HasPrefix") static function hasPrefix(s: go.Slice<go.Byte>, prefix: go.Slice<go.Byte>): (Bool);
    /**
        HasSuffix reports whether the byte slice s ends with suffix.
    **/
    @:native("HasSuffix") static function hasSuffix(s: go.Slice<go.Byte>, suffix: go.Slice<go.Byte>): (Bool);
    /**
        Index returns the index of the first instance of sep in s, or -1 if sep is not present in s.
    **/
    @:native("Index") static function index(s: go.Slice<go.Byte>, sep: go.Slice<go.Byte>): (go.GoInt);
    /**
        IndexAny interprets s as a sequence of UTF-8-encoded Unicode code points.
        It returns the byte index of the first occurrence in s of any of the Unicode
        code points in chars. It returns -1 if chars is empty or if there is no code
        point in common.
    **/
    @:native("IndexAny") static function indexAny(s: go.Slice<go.Byte>, chars: String): (go.GoInt);
    /**
        IndexByte returns the index of the first instance of c in b, or -1 if c is not present in b.
    **/
    @:native("IndexByte") static function indexByte(b: go.Slice<go.Byte>, c: go.Byte): (go.GoInt);
    /**
        IndexFunc interprets s as a sequence of UTF-8-encoded code points.
        It returns the byte index in s of the first Unicode
        code point satisfying f(c), or -1 if none do.
    **/
    @:native("IndexFunc") static function indexFunc(s: go.Slice<go.Byte>, f: (r: go.Rune) -> (Bool)): (go.GoInt);
    /**
        IndexRune interprets s as a sequence of UTF-8-encoded code points.
        It returns the byte index of the first occurrence in s of the given rune.
        It returns -1 if rune is not present in s.
        If r is [utf8.RuneError], it returns the first instance of any
        invalid UTF-8 byte sequence.
    **/
    @:native("IndexRune") static function indexRune(s: go.Slice<go.Byte>, r: go.Rune): (go.GoInt);
    /**
        Join concatenates the elements of s to create a new byte slice. The separator
        sep is placed between elements in the resulting slice.
    **/
    @:native("Join") static function join(s: go.Slice<go.Slice<go.Byte>>, sep: go.Slice<go.Byte>): (go.Slice<go.Byte>);
    /**
        LastIndex returns the index of the last instance of sep in s, or -1 if sep is not present in s.
    **/
    @:native("LastIndex") static function lastIndex(s: go.Slice<go.Byte>, sep: go.Slice<go.Byte>): (go.GoInt);
    /**
        LastIndexAny interprets s as a sequence of UTF-8-encoded Unicode code
        points. It returns the byte index of the last occurrence in s of any of
        the Unicode code points in chars. It returns -1 if chars is empty or if
        there is no code point in common.
    **/
    @:native("LastIndexAny") static function lastIndexAny(s: go.Slice<go.Byte>, chars: String): (go.GoInt);
    /**
        LastIndexByte returns the index of the last instance of c in s, or -1 if c is not present in s.
    **/
    @:native("LastIndexByte") static function lastIndexByte(s: go.Slice<go.Byte>, c: go.Byte): (go.GoInt);
    /**
        LastIndexFunc interprets s as a sequence of UTF-8-encoded code points.
        It returns the byte index in s of the last Unicode
        code point satisfying f(c), or -1 if none do.
    **/
    @:native("LastIndexFunc") static function lastIndexFunc(s: go.Slice<go.Byte>, f: (r: go.Rune) -> (Bool)): (go.GoInt);
    /**
        Lines returns an iterator over the newline-terminated lines in the byte slice s.
        The lines yielded by the iterator include their terminating newlines.
        If s is empty, the iterator yields no lines at all.
        If s does not end in a newline, the final yielded line will not end in a newline.
        It returns a single-use iterator.
    **/
    @:native("Lines") static function lines(s: go.Slice<go.Byte>): (go.iter.Seq<go.Slice<go.Byte>>);
    /**
        Map returns a copy of the byte slice s with all its characters modified
        according to the mapping function. If mapping returns a negative value, the character is
        dropped from the byte slice with no replacement. The characters in s and the
        output are interpreted as UTF-8-encoded code points.
    **/
    @:native("Map") static function map(mapping: (r: go.Rune) -> (go.Rune), s: go.Slice<go.Byte>): (go.Slice<go.Byte>);
    /**
        NewBuffer creates and initializes a new [Buffer] using buf as its
        initial contents. The new [Buffer] takes ownership of buf, and the
        caller should not use buf after this call. NewBuffer is intended to
        prepare a [Buffer] to read existing data. It can also be used to set
        the initial size of the internal buffer for writing. To do that,
        buf should have the desired capacity but a length of zero.
        
        In most cases, new([Buffer]) (or just declaring a [Buffer] variable) is
        sufficient to initialize a [Buffer].
    **/
    @:native("NewBuffer") static function newBuffer(buf: go.Slice<go.Byte>): (go.Pointer<go.bytes.Buffer>);
    /**
        NewBufferString creates and initializes a new [Buffer] using string s as its
        initial contents. It is intended to prepare a buffer to read an existing
        string.
        
        In most cases, new([Buffer]) (or just declaring a [Buffer] variable) is
        sufficient to initialize a [Buffer].
    **/
    @:native("NewBufferString") static function newBufferString(s: String): (go.Pointer<go.bytes.Buffer>);
    /**
        NewReader returns a new [Reader] reading from b.
    **/
    @:native("NewReader") static function newReader(b: go.Slice<go.Byte>): (go.Pointer<go.bytes.Reader>);
    /**
        Repeat returns a new byte slice consisting of count copies of b.
        
        It panics if count is negative or if the result of (len(b) * count)
        overflows.
    **/
    @:native("Repeat") static function repeat(b: go.Slice<go.Byte>, count: go.GoInt): (go.Slice<go.Byte>);
    /**
        Replace returns a copy of the slice s with the first n
        non-overlapping instances of old replaced by new.
        If old is empty, it matches at the beginning of the slice
        and after each UTF-8 sequence, yielding up to k+1 replacements
        for a k-rune slice.
        If n < 0, there is no limit on the number of replacements.
    **/
    @:native("Replace") static function replace(s: go.Slice<go.Byte>, old: go.Slice<go.Byte>, _new: go.Slice<go.Byte>, n: go.GoInt): (go.Slice<go.Byte>);
    /**
        ReplaceAll returns a copy of the slice s with all
        non-overlapping instances of old replaced by new.
        If old is empty, it matches at the beginning of the slice
        and after each UTF-8 sequence, yielding up to k+1 replacements
        for a k-rune slice.
    **/
    @:native("ReplaceAll") static function replaceAll(s: go.Slice<go.Byte>, old: go.Slice<go.Byte>, _new: go.Slice<go.Byte>): (go.Slice<go.Byte>);
    /**
        Runes interprets s as a sequence of UTF-8-encoded code points.
        It returns a slice of runes (Unicode code points) equivalent to s.
    **/
    @:native("Runes") static function runes(s: go.Slice<go.Byte>): (go.Slice<go.Rune>);
    /**
        Split slices s into all subslices separated by sep and returns a slice of
        the subslices between those separators.
        If sep is empty, Split splits after each UTF-8 sequence.
        It is equivalent to SplitN with a count of -1.
        
        To split around the first instance of a separator, see [Cut].
    **/
    @:native("Split") static function split(s: go.Slice<go.Byte>, sep: go.Slice<go.Byte>): (go.Slice<go.Slice<go.Byte>>);
    /**
        SplitAfter slices s into all subslices after each instance of sep and
        returns a slice of those subslices.
        If sep is empty, SplitAfter splits after each UTF-8 sequence.
        It is equivalent to SplitAfterN with a count of -1.
    **/
    @:native("SplitAfter") static function splitAfter(s: go.Slice<go.Byte>, sep: go.Slice<go.Byte>): (go.Slice<go.Slice<go.Byte>>);
    /**
        SplitAfterN slices s into subslices after each instance of sep and
        returns a slice of those subslices.
        If sep is empty, SplitAfterN splits after each UTF-8 sequence.
        The count determines the number of subslices to return:
          - n > 0: at most n subslices; the last subslice will be the unsplit remainder;
          - n == 0: the result is nil (zero subslices);
          - n < 0: all subslices.
    **/
    @:native("SplitAfterN") static function splitAfterN(s: go.Slice<go.Byte>, sep: go.Slice<go.Byte>, n: go.GoInt): (go.Slice<go.Slice<go.Byte>>);
    /**
        SplitAfterSeq returns an iterator over subslices of s split after each instance of sep.
        The iterator yields the same subslices that would be returned by [SplitAfter](s, sep),
        but without constructing a new slice containing the subslices.
        It returns a single-use iterator.
    **/
    @:native("SplitAfterSeq") static function splitAfterSeq(s: go.Slice<go.Byte>, sep: go.Slice<go.Byte>): (go.iter.Seq<go.Slice<go.Byte>>);
    /**
        SplitN slices s into subslices separated by sep and returns a slice of
        the subslices between those separators.
        If sep is empty, SplitN splits after each UTF-8 sequence.
        The count determines the number of subslices to return:
          - n > 0: at most n subslices; the last subslice will be the unsplit remainder;
          - n == 0: the result is nil (zero subslices);
          - n < 0: all subslices.
        
        To split around the first instance of a separator, see [Cut].
    **/
    @:native("SplitN") static function splitN(s: go.Slice<go.Byte>, sep: go.Slice<go.Byte>, n: go.GoInt): (go.Slice<go.Slice<go.Byte>>);
    /**
        SplitSeq returns an iterator over all subslices of s separated by sep.
        The iterator yields the same subslices that would be returned by [Split](s, sep),
        but without constructing a new slice containing the subslices.
        It returns a single-use iterator.
    **/
    @:native("SplitSeq") static function splitSeq(s: go.Slice<go.Byte>, sep: go.Slice<go.Byte>): (go.iter.Seq<go.Slice<go.Byte>>);
    /**
        Title treats s as UTF-8-encoded bytes and returns a copy with all Unicode letters that begin
        words mapped to their title case.
        
        Deprecated: The rule Title uses for word boundaries does not handle Unicode
        punctuation properly. Use golang.org/x/text/cases instead.
    **/
    @:native("Title") static function title(s: go.Slice<go.Byte>): (go.Slice<go.Byte>);
    /**
        ToLower returns a copy of the byte slice s with all Unicode letters mapped to
        their lower case.
    **/
    @:native("ToLower") static function toLower(s: go.Slice<go.Byte>): (go.Slice<go.Byte>);
    /**
        ToLowerSpecial treats s as UTF-8-encoded bytes and returns a copy with all the Unicode letters mapped to their
        lower case, giving priority to the special casing rules.
    **/
    @:native("ToLowerSpecial") static function toLowerSpecial(c: go.unicode.SpecialCase, s: go.Slice<go.Byte>): (go.Slice<go.Byte>);
    /**
        ToTitle treats s as UTF-8-encoded bytes and returns a copy with all the Unicode letters mapped to their title case.
    **/
    @:native("ToTitle") static function toTitle(s: go.Slice<go.Byte>): (go.Slice<go.Byte>);
    /**
        ToTitleSpecial treats s as UTF-8-encoded bytes and returns a copy with all the Unicode letters mapped to their
        title case, giving priority to the special casing rules.
    **/
    @:native("ToTitleSpecial") static function toTitleSpecial(c: go.unicode.SpecialCase, s: go.Slice<go.Byte>): (go.Slice<go.Byte>);
    /**
        ToUpper returns a copy of the byte slice s with all Unicode letters mapped to
        their upper case.
    **/
    @:native("ToUpper") static function toUpper(s: go.Slice<go.Byte>): (go.Slice<go.Byte>);
    /**
        ToUpperSpecial treats s as UTF-8-encoded bytes and returns a copy with all the Unicode letters mapped to their
        upper case, giving priority to the special casing rules.
    **/
    @:native("ToUpperSpecial") static function toUpperSpecial(c: go.unicode.SpecialCase, s: go.Slice<go.Byte>): (go.Slice<go.Byte>);
    /**
        ToValidUTF8 treats s as UTF-8-encoded bytes and returns a copy with each run of bytes
        representing invalid UTF-8 replaced with the bytes in replacement, which may be empty.
    **/
    @:native("ToValidUTF8") static function toValidUTF8(s: go.Slice<go.Byte>, replacement: go.Slice<go.Byte>): (go.Slice<go.Byte>);
    /**
        Trim returns a subslice of s by slicing off all leading and
        trailing UTF-8-encoded code points contained in cutset.
    **/
    @:native("Trim") static function trim(s: go.Slice<go.Byte>, cutset: String): (go.Slice<go.Byte>);
    /**
        TrimFunc returns a subslice of s by slicing off all leading and trailing
        UTF-8-encoded code points c that satisfy f(c).
    **/
    @:native("TrimFunc") static function trimFunc(s: go.Slice<go.Byte>, f: (r: go.Rune) -> (Bool)): (go.Slice<go.Byte>);
    /**
        TrimLeft returns a subslice of s by slicing off all leading
        UTF-8-encoded code points contained in cutset.
    **/
    @:native("TrimLeft") static function trimLeft(s: go.Slice<go.Byte>, cutset: String): (go.Slice<go.Byte>);
    /**
        TrimLeftFunc treats s as UTF-8-encoded bytes and returns a subslice of s by slicing off
        all leading UTF-8-encoded code points c that satisfy f(c).
    **/
    @:native("TrimLeftFunc") static function trimLeftFunc(s: go.Slice<go.Byte>, f: (r: go.Rune) -> (Bool)): (go.Slice<go.Byte>);
    /**
        TrimPrefix returns s without the provided leading prefix string.
        If s doesn't start with prefix, s is returned unchanged.
    **/
    @:native("TrimPrefix") static function trimPrefix(s: go.Slice<go.Byte>, prefix: go.Slice<go.Byte>): (go.Slice<go.Byte>);
    /**
        TrimRight returns a subslice of s by slicing off all trailing
        UTF-8-encoded code points that are contained in cutset.
    **/
    @:native("TrimRight") static function trimRight(s: go.Slice<go.Byte>, cutset: String): (go.Slice<go.Byte>);
    /**
        TrimRightFunc returns a subslice of s by slicing off all trailing
        UTF-8-encoded code points c that satisfy f(c).
    **/
    @:native("TrimRightFunc") static function trimRightFunc(s: go.Slice<go.Byte>, f: (r: go.Rune) -> (Bool)): (go.Slice<go.Byte>);
    /**
        TrimSpace returns a subslice of s by slicing off all leading and
        trailing white space, as defined by Unicode.
    **/
    @:native("TrimSpace") static function trimSpace(s: go.Slice<go.Byte>): (go.Slice<go.Byte>);
    /**
        TrimSuffix returns s without the provided trailing suffix string.
        If s doesn't end with suffix, s is returned unchanged.
    **/
    @:native("TrimSuffix") static function trimSuffix(s: go.Slice<go.Byte>, suffix: go.Slice<go.Byte>): (go.Slice<go.Byte>);

}