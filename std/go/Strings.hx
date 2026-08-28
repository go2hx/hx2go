package go;

/**
    Package strings implements simple functions to manipulate UTF-8 encoded strings.
    
    For information about UTF-8 strings in Go, see https://blog.golang.org/strings.
**/
@:go.Type({ name: "strings", instanceName: "strings.strings", imports: ["strings"] })
extern class Strings {

    /**
        Clone returns a fresh copy of s.
        It guarantees to make a copy of s into a new allocation,
        which can be important when retaining only a small substring
        of a much larger string. Using Clone can help such programs
        use less memory. Of course, since using Clone makes a copy,
        overuse of Clone can make programs use more memory.
        Clone should typically be used only rarely, and only when
        profiling indicates that it is needed.
        For strings of length zero the string "" will be returned
        and no allocation is made.
    **/
    @:native("Clone") static function clone(s: String): (String);
    /**
        Compare returns an integer comparing two strings lexicographically.
        The result will be 0 if a == b, -1 if a < b, and +1 if a > b.
        
        Use Compare when you need to perform a three-way comparison (with
        [slices.SortFunc], for example). It is usually clearer and always faster
        to use the built-in string comparison operators ==, <, >, and so on.
    **/
    @:native("Compare") static function compare(a: String, b: String): (go.GoInt);
    /**
        Contains reports whether substr is within s.
    **/
    @:native("Contains") static function contains(s: String, substr: String): (Bool);
    /**
        ContainsAny reports whether any Unicode code points in chars are within s.
    **/
    @:native("ContainsAny") static function containsAny(s: String, chars: String): (Bool);
    /**
        ContainsFunc reports whether any Unicode code points r within s satisfy f(r).
    **/
    @:native("ContainsFunc") static function containsFunc(s: String, f: (p0: go.Rune) -> (Bool)): (Bool);
    /**
        ContainsRune reports whether the Unicode code point r is within s.
    **/
    @:native("ContainsRune") static function containsRune(s: String, r: go.Rune): (Bool);
    /**
        Count counts the number of non-overlapping instances of substr in s.
        If substr is an empty string, Count returns 1 + the number of Unicode code points in s.
    **/
    @:native("Count") static function count(s: String, substr: String): (go.GoInt);
    /**
        Cut slices s around the first instance of sep,
        returning the text before and after sep.
        The found result reports whether sep appears in s.
        If sep does not appear in s, cut returns s, "", false.
    **/
    @:go.Tuple("before", "after", "found") @:native("Cut") static function cut(s: String, sep: String): (go.Tuple<{ before: String, after: String, found: Bool }>);
    /**
        CutPrefix returns s without the provided leading prefix string
        and reports whether it found the prefix.
        If s doesn't start with prefix, CutPrefix returns s, false.
        If prefix is the empty string, CutPrefix returns s, true.
    **/
    @:go.Tuple("after", "found") @:native("CutPrefix") static function cutPrefix(s: String, prefix: String): (go.Tuple<{ after: String, found: Bool }>);
    /**
        CutSuffix returns s without the provided ending suffix string
        and reports whether it found the suffix.
        If s doesn't end with suffix, CutSuffix returns s, false.
        If suffix is the empty string, CutSuffix returns s, true.
    **/
    @:go.Tuple("before", "found") @:native("CutSuffix") static function cutSuffix(s: String, suffix: String): (go.Tuple<{ before: String, found: Bool }>);
    /**
        EqualFold reports whether s and t, interpreted as UTF-8 strings,
        are equal under simple Unicode case-folding, which is a more general
        form of case-insensitivity.
    **/
    @:native("EqualFold") static function equalFold(s: String, t: String): (Bool);
    /**
        Fields splits the string s around each instance of one or more consecutive white space
        characters, as defined by [unicode.IsSpace], returning a slice of substrings of s or an
        empty slice if s contains only white space. Every element of the returned slice is
        non-empty. Unlike [Split], leading and trailing runs of white space characters
        are discarded.
    **/
    @:native("Fields") static function fields(s: String): (go.Slice<String>);
    /**
        FieldsFunc splits the string s at each run of Unicode code points c satisfying f(c)
        and returns an array of slices of s. If all code points in s satisfy f(c) or the
        string is empty, an empty slice is returned. Every element of the returned slice is
        non-empty. Unlike [Split], leading and trailing runs of code points satisfying f(c)
        are discarded.
        
        FieldsFunc makes no guarantees about the order in which it calls f(c)
        and assumes that f always returns the same value for a given c.
    **/
    @:native("FieldsFunc") static function fieldsFunc(s: String, f: (p0: go.Rune) -> (Bool)): (go.Slice<String>);
    /**
        FieldsFuncSeq returns an iterator over substrings of s split around runs of
        Unicode code points satisfying f(c).
        The iterator yields the same strings that would be returned by [FieldsFunc](s),
        but without constructing the slice.
    **/
    @:native("FieldsFuncSeq") static function fieldsFuncSeq(s: String, f: (p0: go.Rune) -> (Bool)): (go.iter.Seq<String>);
    /**
        FieldsSeq returns an iterator over substrings of s split around runs of
        whitespace characters, as defined by [unicode.IsSpace].
        The iterator yields the same strings that would be returned by [Fields](s),
        but without constructing the slice.
    **/
    @:native("FieldsSeq") static function fieldsSeq(s: String): (go.iter.Seq<String>);
    /**
        HasPrefix reports whether the string s begins with prefix.
    **/
    @:native("HasPrefix") static function hasPrefix(s: String, prefix: String): (Bool);
    /**
        HasSuffix reports whether the string s ends with suffix.
    **/
    @:native("HasSuffix") static function hasSuffix(s: String, suffix: String): (Bool);
    /**
        Index returns the index of the first instance of substr in s, or -1 if substr is not present in s.
    **/
    @:native("Index") static function index(s: String, substr: String): (go.GoInt);
    /**
        IndexAny returns the index of the first instance of any Unicode code point
        from chars in s, or -1 if no Unicode code point from chars is present in s.
    **/
    @:native("IndexAny") static function indexAny(s: String, chars: String): (go.GoInt);
    /**
        IndexByte returns the index of the first instance of c in s, or -1 if c is not present in s.
    **/
    @:native("IndexByte") static function indexByte(s: String, c: go.Byte): (go.GoInt);
    /**
        IndexFunc returns the index into s of the first Unicode
        code point satisfying f(c), or -1 if none do.
    **/
    @:native("IndexFunc") static function indexFunc(s: String, f: (p0: go.Rune) -> (Bool)): (go.GoInt);
    /**
        IndexRune returns the index of the first instance of the Unicode code point
        r, or -1 if rune is not present in s.
        If r is [utf8.RuneError], it returns the first instance of any
        invalid UTF-8 byte sequence.
    **/
    @:native("IndexRune") static function indexRune(s: String, r: go.Rune): (go.GoInt);
    /**
        Join concatenates the elements of its first argument to create a single string. The separator
        string sep is placed between elements in the resulting string.
    **/
    @:native("Join") static function join(elems: go.Slice<String>, sep: String): (String);
    /**
        LastIndex returns the index of the last instance of substr in s, or -1 if substr is not present in s.
    **/
    @:native("LastIndex") static function lastIndex(s: String, substr: String): (go.GoInt);
    /**
        LastIndexAny returns the index of the last instance of any Unicode code
        point from chars in s, or -1 if no Unicode code point from chars is
        present in s.
    **/
    @:native("LastIndexAny") static function lastIndexAny(s: String, chars: String): (go.GoInt);
    /**
        LastIndexByte returns the index of the last instance of c in s, or -1 if c is not present in s.
    **/
    @:native("LastIndexByte") static function lastIndexByte(s: String, c: go.Byte): (go.GoInt);
    /**
        LastIndexFunc returns the index into s of the last
        Unicode code point satisfying f(c), or -1 if none do.
    **/
    @:native("LastIndexFunc") static function lastIndexFunc(s: String, f: (p0: go.Rune) -> (Bool)): (go.GoInt);
    /**
        Lines returns an iterator over the newline-terminated lines in the string s.
        The lines yielded by the iterator include their terminating newlines.
        If s is empty, the iterator yields no lines at all.
        If s does not end in a newline, the final yielded line will not end in a newline.
        It returns a single-use iterator.
    **/
    @:native("Lines") static function lines(s: String): (go.iter.Seq<String>);
    /**
        Map returns a copy of the string s with all its characters modified
        according to the mapping function. If mapping returns a negative value, the character is
        dropped from the string with no replacement.
    **/
    @:native("Map") static function map(mapping: (p0: go.Rune) -> (go.Rune), s: String): (String);
    /**
        NewReader returns a new [Reader] reading from s.
        It is similar to [bytes.NewBufferString] but more efficient and non-writable.
    **/
    @:native("NewReader") static function newReader(s: String): (go.Pointer<go.strings.Reader>);
    /**
        NewReplacer returns a new [Replacer] from a list of old, new string
        pairs. Replacements are performed in the order they appear in the
        target string, without overlapping matches. The old string
        comparisons are done in argument order.
        
        NewReplacer panics if given an odd number of arguments.
    **/
    @:native("NewReplacer") static function newReplacer(oldnew: haxe.Rest<String>): (go.Pointer<go.strings.Replacer>);
    /**
        Repeat returns a new string consisting of count copies of the string s.
        
        It panics if count is negative or if the result of (len(s) * count)
        overflows.
    **/
    @:native("Repeat") static function repeat(s: String, count: go.GoInt): (String);
    /**
        Replace returns a copy of the string s with the first n
        non-overlapping instances of old replaced by new.
        If old is empty, it matches at the beginning of the string
        and after each UTF-8 sequence, yielding up to k+1 replacements
        for a k-rune string.
        If n < 0, there is no limit on the number of replacements.
    **/
    @:native("Replace") static function replace(s: String, old: String, _new: String, n: go.GoInt): (String);
    /**
        ReplaceAll returns a copy of the string s with all
        non-overlapping instances of old replaced by new.
        If old is empty, it matches at the beginning of the string
        and after each UTF-8 sequence, yielding up to k+1 replacements
        for a k-rune string.
    **/
    @:native("ReplaceAll") static function replaceAll(s: String, old: String, _new: String): (String);
    /**
        Split slices s into all substrings separated by sep and returns a slice of
        the substrings between those separators.
        
        If s does not contain sep and sep is not empty, Split returns a
        slice of length 1 whose only element is s.
        
        If sep is empty, Split splits after each UTF-8 sequence. If both s
        and sep are empty, Split returns an empty slice.
        
        It is equivalent to [SplitN] with a count of -1.
        
        To split around the first instance of a separator, see [Cut].
    **/
    @:native("Split") static function split(s: String, sep: String): (go.Slice<String>);
    /**
        SplitAfter slices s into all substrings after each instance of sep and
        returns a slice of those substrings.
        
        If s does not contain sep and sep is not empty, SplitAfter returns
        a slice of length 1 whose only element is s.
        
        If sep is empty, SplitAfter splits after each UTF-8 sequence. If
        both s and sep are empty, SplitAfter returns an empty slice.
        
        It is equivalent to [SplitAfterN] with a count of -1.
    **/
    @:native("SplitAfter") static function splitAfter(s: String, sep: String): (go.Slice<String>);
    /**
        SplitAfterN slices s into substrings after each instance of sep and
        returns a slice of those substrings.
        
        The count determines the number of substrings to return:
          - n > 0: at most n substrings; the last substring will be the unsplit remainder;
          - n == 0: the result is nil (zero substrings);
          - n < 0: all substrings.
        
        Edge cases for s and sep (for example, empty strings) are handled
        as described in the documentation for [SplitAfter].
    **/
    @:native("SplitAfterN") static function splitAfterN(s: String, sep: String, n: go.GoInt): (go.Slice<String>);
    /**
        SplitAfterSeq returns an iterator over substrings of s split after each instance of sep.
        The iterator yields the same strings that would be returned by [SplitAfter](s, sep),
        but without constructing the slice.
        It returns a single-use iterator.
    **/
    @:native("SplitAfterSeq") static function splitAfterSeq(s: String, sep: String): (go.iter.Seq<String>);
    /**
        SplitN slices s into substrings separated by sep and returns a slice of
        the substrings between those separators.
        
        The count determines the number of substrings to return:
          - n > 0: at most n substrings; the last substring will be the unsplit remainder;
          - n == 0: the result is nil (zero substrings);
          - n < 0: all substrings.
        
        Edge cases for s and sep (for example, empty strings) are handled
        as described in the documentation for [Split].
        
        To split around the first instance of a separator, see [Cut].
    **/
    @:native("SplitN") static function splitN(s: String, sep: String, n: go.GoInt): (go.Slice<String>);
    /**
        SplitSeq returns an iterator over all substrings of s separated by sep.
        The iterator yields the same strings that would be returned by [Split](s, sep),
        but without constructing the slice.
        It returns a single-use iterator.
    **/
    @:native("SplitSeq") static function splitSeq(s: String, sep: String): (go.iter.Seq<String>);
    /**
        Title returns a copy of the string s with all Unicode letters that begin words
        mapped to their Unicode title case.
        
        Deprecated: The rule Title uses for word boundaries does not handle Unicode
        punctuation properly. Use golang.org/x/text/cases instead.
    **/
    @:native("Title") static function title(s: String): (String);
    /**
        ToLower returns s with all Unicode letters mapped to their lower case.
    **/
    @:native("ToLower") static function toLower(s: String): (String);
    /**
        ToLowerSpecial returns a copy of the string s with all Unicode letters mapped to their
        lower case using the case mapping specified by c.
    **/
    @:native("ToLowerSpecial") static function toLowerSpecial(c: go.unicode.SpecialCase, s: String): (String);
    /**
        ToTitle returns a copy of the string s with all Unicode letters mapped to
        their Unicode title case.
    **/
    @:native("ToTitle") static function toTitle(s: String): (String);
    /**
        ToTitleSpecial returns a copy of the string s with all Unicode letters mapped to their
        Unicode title case, giving priority to the special casing rules.
    **/
    @:native("ToTitleSpecial") static function toTitleSpecial(c: go.unicode.SpecialCase, s: String): (String);
    /**
        ToUpper returns s with all Unicode letters mapped to their upper case.
    **/
    @:native("ToUpper") static function toUpper(s: String): (String);
    /**
        ToUpperSpecial returns a copy of the string s with all Unicode letters mapped to their
        upper case using the case mapping specified by c.
    **/
    @:native("ToUpperSpecial") static function toUpperSpecial(c: go.unicode.SpecialCase, s: String): (String);
    /**
        ToValidUTF8 returns a copy of the string s with each run of invalid UTF-8 byte sequences
        replaced by the replacement string, which may be empty.
    **/
    @:native("ToValidUTF8") static function toValidUTF8(s: String, replacement: String): (String);
    /**
        Trim returns a slice of the string s with all leading and
        trailing Unicode code points contained in cutset removed.
    **/
    @:native("Trim") static function trim(s: String, cutset: String): (String);
    /**
        TrimFunc returns a slice of the string s with all leading
        and trailing Unicode code points c satisfying f(c) removed.
    **/
    @:native("TrimFunc") static function trimFunc(s: String, f: (p0: go.Rune) -> (Bool)): (String);
    /**
        TrimLeft returns a slice of the string s with all leading
        Unicode code points contained in cutset removed.
        
        To remove a prefix, use [TrimPrefix] instead.
    **/
    @:native("TrimLeft") static function trimLeft(s: String, cutset: String): (String);
    /**
        TrimLeftFunc returns a slice of the string s with all leading
        Unicode code points c satisfying f(c) removed.
    **/
    @:native("TrimLeftFunc") static function trimLeftFunc(s: String, f: (p0: go.Rune) -> (Bool)): (String);
    /**
        TrimPrefix returns s without the provided leading prefix string.
        If s doesn't start with prefix, s is returned unchanged.
    **/
    @:native("TrimPrefix") static function trimPrefix(s: String, prefix: String): (String);
    /**
        TrimRight returns a slice of the string s, with all trailing
        Unicode code points contained in cutset removed.
        
        To remove a suffix, use [TrimSuffix] instead.
    **/
    @:native("TrimRight") static function trimRight(s: String, cutset: String): (String);
    /**
        TrimRightFunc returns a slice of the string s with all trailing
        Unicode code points c satisfying f(c) removed.
    **/
    @:native("TrimRightFunc") static function trimRightFunc(s: String, f: (p0: go.Rune) -> (Bool)): (String);
    /**
        TrimSpace returns a slice (substring) of the string s,
        with all leading and trailing white space removed,
        as defined by Unicode.
    **/
    @:native("TrimSpace") static function trimSpace(s: String): (String);
    /**
        TrimSuffix returns s without the provided trailing suffix string.
        If s doesn't end with suffix, s is returned unchanged.
    **/
    @:native("TrimSuffix") static function trimSuffix(s: String, suffix: String): (String);

}