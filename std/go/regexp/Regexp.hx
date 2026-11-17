package go.regexp;

/**
    Regexp is the representation of a compiled regular expression.
    A Regexp is safe for concurrent use by multiple goroutines,
    except for configuration methods, such as [Regexp.Longest].
**/
@:structInit
@:go.Type({ name: "Regexp", instanceName: "regexp.Regexp", imports: ["regexp"] })
extern class Regexp {

    /**
        AppendText implements [encoding.TextAppender]. The output
        matches that of calling the [Regexp.String] method.
        
        Note that the output is lossy in some cases: This method does not indicate
        POSIX regular expressions (i.e. those compiled by calling [CompilePOSIX]), or
        those for which the [Regexp.Longest] method has been called.
    **/
    @:native("AppendText") function appendText(b: go.Slice<go.Byte>): (go.Result<go.Slice<go.Byte>>);
    /**
        Copy returns a new [Regexp] object copied from re.
        Calling [Regexp.Longest] on one copy does not affect another.
        
        Deprecated: In earlier releases, when using a [Regexp] in multiple goroutines,
        giving each goroutine its own copy helped to avoid lock contention.
        As of Go 1.12, using Copy is no longer necessary to avoid lock contention.
        Copy may still be appropriate if the reason for its use is to make
        two copies with different [Regexp.Longest] settings.
    **/
    @:native("Copy") function copy(): (go.Pointer<go.regexp.Regexp>);
    /**
        Expand appends template to dst and returns the result; during the
        append, Expand replaces variables in the template with corresponding
        matches drawn from src. The match slice should have been returned by
        [Regexp.FindSubmatchIndex].
        
        In the template, a variable is denoted by a substring of the form
        $name or ${name}, where name is a non-empty sequence of letters,
        digits, and underscores. A purely numeric name like $1 refers to
        the submatch with the corresponding index; other names refer to
        capturing parentheses named with the (?P<name>...) syntax. A
        reference to an out of range or unmatched index or a name that is not
        present in the regular expression is replaced with an empty slice.
        
        In the $name form, name is taken to be as long as possible: $1x is
        equivalent to ${1x}, not ${1}x, and, $10 is equivalent to ${10}, not ${1}0.
        
        To insert a literal $ in the output, use $$ in the template.
    **/
    @:native("Expand") function expand(dst: go.Slice<go.Byte>, template: go.Slice<go.Byte>, src: go.Slice<go.Byte>, match: go.Slice<go.GoInt>): (go.Slice<go.Byte>);
    /**
        ExpandString is like [Regexp.Expand] but the template and source are strings.
        It appends to and returns a byte slice in order to give the calling
        code control over allocation.
    **/
    @:native("ExpandString") function expandString(dst: go.Slice<go.Byte>, template: String, src: String, match: go.Slice<go.GoInt>): (go.Slice<go.Byte>);
    /**
        Find returns a slice holding the text of the leftmost match in b of the regular expression.
        A return value of nil indicates no match.
    **/
    @:native("Find") function find(b: go.Slice<go.Byte>): (go.Slice<go.Byte>);
    /**
        FindAll is the 'All' version of [Regexp.Find]; it returns a slice of all successive
        matches of the expression, as defined by the 'All' description in the
        package comment.
        A return value of nil indicates no match.
    **/
    @:native("FindAll") function findAll(b: go.Slice<go.Byte>, n: go.GoInt): (go.Slice<go.Slice<go.Byte>>);
    /**
        FindAllIndex is the 'All' version of [Regexp.FindIndex]; it returns a slice of all
        successive matches of the expression, as defined by the 'All' description
        in the package comment.
        A return value of nil indicates no match.
    **/
    @:native("FindAllIndex") function findAllIndex(b: go.Slice<go.Byte>, n: go.GoInt): (go.Slice<go.Slice<go.GoInt>>);
    /**
        FindAllString is the 'All' version of [Regexp.FindString]; it returns a slice of all
        successive matches of the expression, as defined by the 'All' description
        in the package comment.
        A return value of nil indicates no match.
    **/
    @:native("FindAllString") function findAllString(s: String, n: go.GoInt): (go.Slice<String>);
    /**
        FindAllStringIndex is the 'All' version of [Regexp.FindStringIndex]; it returns a
        slice of all successive matches of the expression, as defined by the 'All'
        description in the package comment.
        A return value of nil indicates no match.
    **/
    @:native("FindAllStringIndex") function findAllStringIndex(s: String, n: go.GoInt): (go.Slice<go.Slice<go.GoInt>>);
    /**
        FindAllStringSubmatch is the 'All' version of [Regexp.FindStringSubmatch]; it
        returns a slice of all successive matches of the expression, as defined by
        the 'All' description in the package comment.
        A return value of nil indicates no match.
    **/
    @:native("FindAllStringSubmatch") function findAllStringSubmatch(s: String, n: go.GoInt): (go.Slice<go.Slice<String>>);
    /**
        FindAllStringSubmatchIndex is the 'All' version of
        [Regexp.FindStringSubmatchIndex]; it returns a slice of all successive matches of
        the expression, as defined by the 'All' description in the package
        comment.
        A return value of nil indicates no match.
    **/
    @:native("FindAllStringSubmatchIndex") function findAllStringSubmatchIndex(s: String, n: go.GoInt): (go.Slice<go.Slice<go.GoInt>>);
    /**
        FindAllSubmatch is the 'All' version of [Regexp.FindSubmatch]; it returns a slice
        of all successive matches of the expression, as defined by the 'All'
        description in the package comment.
        A return value of nil indicates no match.
    **/
    @:native("FindAllSubmatch") function findAllSubmatch(b: go.Slice<go.Byte>, n: go.GoInt): (go.Slice<go.Slice<go.Slice<go.Byte>>>);
    /**
        FindAllSubmatchIndex is the 'All' version of [Regexp.FindSubmatchIndex]; it returns
        a slice of all successive matches of the expression, as defined by the
        'All' description in the package comment.
        A return value of nil indicates no match.
    **/
    @:native("FindAllSubmatchIndex") function findAllSubmatchIndex(b: go.Slice<go.Byte>, n: go.GoInt): (go.Slice<go.Slice<go.GoInt>>);
    /**
        FindIndex returns a two-element slice of integers defining the location of
        the leftmost match in b of the regular expression. The match itself is at
        b[loc[0]:loc[1]].
        A return value of nil indicates no match.
    **/
    @:native("FindIndex") function findIndex(b: go.Slice<go.Byte>): (go.Slice<go.GoInt>);
    /**
        FindReaderIndex returns a two-element slice of integers defining the
        location of the leftmost match of the regular expression in text read from
        the [io.RuneReader]. The match text was found in the input stream at
        byte offset loc[0] through loc[1]-1.
        A return value of nil indicates no match.
    **/
    @:native("FindReaderIndex") function findReaderIndex(r: go.io.RuneReader): (go.Slice<go.GoInt>);
    /**
        FindReaderSubmatchIndex returns a slice holding the index pairs
        identifying the leftmost match of the regular expression of text read by
        the [io.RuneReader], and the matches, if any, of its subexpressions, as defined
        by the 'Submatch' and 'Index' descriptions in the package comment. A
        return value of nil indicates no match.
    **/
    @:native("FindReaderSubmatchIndex") function findReaderSubmatchIndex(r: go.io.RuneReader): (go.Slice<go.GoInt>);
    /**
        FindString returns a string holding the text of the leftmost match in s of the regular
        expression. If there is no match, the return value is an empty string,
        but it will also be empty if the regular expression successfully matches
        an empty string. Use [Regexp.FindStringIndex] or [Regexp.FindStringSubmatch] if it is
        necessary to distinguish these cases.
    **/
    @:native("FindString") function findString(s: String): (String);
    /**
        FindStringIndex returns a two-element slice of integers defining the
        location of the leftmost match in s of the regular expression. The match
        itself is at s[loc[0]:loc[1]].
        A return value of nil indicates no match.
    **/
    @:native("FindStringIndex") function findStringIndex(s: String): (go.Slice<go.GoInt>);
    /**
        FindStringSubmatch returns a slice of strings holding the text of the
        leftmost match of the regular expression in s and the matches, if any, of
        its subexpressions, as defined by the 'Submatch' description in the
        package comment.
        A return value of nil indicates no match.
    **/
    @:native("FindStringSubmatch") function findStringSubmatch(s: String): (go.Slice<String>);
    /**
        FindStringSubmatchIndex returns a slice holding the index pairs
        identifying the leftmost match of the regular expression in s and the
        matches, if any, of its subexpressions, as defined by the 'Submatch' and
        'Index' descriptions in the package comment.
        A return value of nil indicates no match.
    **/
    @:native("FindStringSubmatchIndex") function findStringSubmatchIndex(s: String): (go.Slice<go.GoInt>);
    /**
        FindSubmatch returns a slice of slices holding the text of the leftmost
        match of the regular expression in b and the matches, if any, of its
        subexpressions, as defined by the 'Submatch' descriptions in the package
        comment.
        A return value of nil indicates no match.
    **/
    @:native("FindSubmatch") function findSubmatch(b: go.Slice<go.Byte>): (go.Slice<go.Slice<go.Byte>>);
    /**
        FindSubmatchIndex returns a slice holding the index pairs identifying the
        leftmost match of the regular expression in b and the matches, if any, of
        its subexpressions, as defined by the 'Submatch' and 'Index' descriptions
        in the package comment.
        A return value of nil indicates no match.
    **/
    @:native("FindSubmatchIndex") function findSubmatchIndex(b: go.Slice<go.Byte>): (go.Slice<go.GoInt>);
    /**
        LiteralPrefix returns a literal string that must begin any match
        of the regular expression re. It returns the boolean true if the
        literal string comprises the entire regular expression.
    **/
    @:go.Tuple("prefix", "complete") @:native("LiteralPrefix") function literalPrefix(): (go.Tuple<{ prefix: String, complete: Bool }>);
    /**
        Longest makes future searches prefer the leftmost-longest match.
        That is, when matching against text, the regexp returns a match that
        begins as early as possible in the input (leftmost), and among those
        it chooses a match that is as long as possible.
        This method modifies the [Regexp] and may not be called concurrently
        with any other methods.
    **/
    @:native("Longest") function longest(): Void;
    /**
        MarshalText implements [encoding.TextMarshaler]. The output
        matches that of calling the [Regexp.AppendText] method.
        
        See [Regexp.AppendText] for more information.
    **/
    @:native("MarshalText") function marshalText(): (go.Result<go.Slice<go.Byte>>);
    /**
        Match reports whether the byte slice b
        contains any match of the regular expression re.
    **/
    @:native("Match") function match(b: go.Slice<go.Byte>): (Bool);
    /**
        MatchReader reports whether the text returned by the [io.RuneReader]
        contains any match of the regular expression re.
    **/
    @:native("MatchReader") function matchReader(r: go.io.RuneReader): (Bool);
    /**
        MatchString reports whether the string s
        contains any match of the regular expression re.
    **/
    @:native("MatchString") function matchString(s: String): (Bool);
    /**
        NumSubexp returns the number of parenthesized subexpressions in this [Regexp].
    **/
    @:native("NumSubexp") function numSubexp(): (go.GoInt);
    /**
        ReplaceAll returns a copy of src, replacing matches of the [Regexp]
        with the replacement text repl.
        Inside repl, $ signs are interpreted as in [Regexp.Expand].
    **/
    @:native("ReplaceAll") function replaceAll(src: go.Slice<go.Byte>, repl: go.Slice<go.Byte>): (go.Slice<go.Byte>);
    /**
        ReplaceAllFunc returns a copy of src in which all matches of the
        [Regexp] have been replaced by the return value of function repl applied
        to the matched byte slice. The replacement returned by repl is substituted
        directly, without using [Regexp.Expand].
    **/
    @:native("ReplaceAllFunc") function replaceAllFunc(src: go.Slice<go.Byte>, repl: (p0: go.Slice<go.Byte>) -> (go.Slice<go.Byte>)): (go.Slice<go.Byte>);
    /**
        ReplaceAllLiteral returns a copy of src, replacing matches of the [Regexp]
        with the replacement bytes repl. The replacement repl is substituted directly,
        without using [Regexp.Expand].
    **/
    @:native("ReplaceAllLiteral") function replaceAllLiteral(src: go.Slice<go.Byte>, repl: go.Slice<go.Byte>): (go.Slice<go.Byte>);
    /**
        ReplaceAllLiteralString returns a copy of src, replacing matches of the [Regexp]
        with the replacement string repl. The replacement repl is substituted directly,
        without using [Regexp.Expand].
    **/
    @:native("ReplaceAllLiteralString") function replaceAllLiteralString(src: String, repl: String): (String);
    /**
        ReplaceAllString returns a copy of src, replacing matches of the [Regexp]
        with the replacement string repl.
        Inside repl, $ signs are interpreted as in [Regexp.Expand].
    **/
    @:native("ReplaceAllString") function replaceAllString(src: String, repl: String): (String);
    /**
        ReplaceAllStringFunc returns a copy of src in which all matches of the
        [Regexp] have been replaced by the return value of function repl applied
        to the matched substring. The replacement returned by repl is substituted
        directly, without using [Regexp.Expand].
    **/
    @:native("ReplaceAllStringFunc") function replaceAllStringFunc(src: String, repl: (p0: String) -> (String)): (String);
    /**
        Split slices s into substrings separated by the expression and returns a slice of
        the substrings between those expression matches.
        
        The slice returned by this method consists of all the substrings of s
        not contained in the slice returned by [Regexp.FindAllString]. When called on an expression
        that contains no metacharacters, it is equivalent to [strings.SplitN].
        
        Example:
        
        	s := regexp.MustCompile("a*").Split("abaabaccadaaae", 5)
        	// s: ["", "b", "b", "c", "cadaaae"]
        
        The count determines the number of substrings to return:
          - n > 0: at most n substrings; the last substring will be the unsplit remainder;
          - n == 0: the result is nil (zero substrings);
          - n < 0: all substrings.
    **/
    @:native("Split") function split(s: String, n: go.GoInt): (go.Slice<String>);
    /**
        String returns the source text used to compile the regular expression.
    **/
    @:native("String") function string(): (String);
    /**
        SubexpIndex returns the index of the first subexpression with the given name,
        or -1 if there is no subexpression with that name.
        
        Note that multiple subexpressions can be written using the same name, as in
        (?P<bob>a+)(?P<bob>b+), which declares two subexpressions named "bob".
        In this case, SubexpIndex returns the index of the leftmost such subexpression
        in the regular expression.
    **/
    @:native("SubexpIndex") function subexpIndex(name: String): (go.GoInt);
    /**
        SubexpNames returns the names of the parenthesized subexpressions
        in this [Regexp]. The name for the first sub-expression is names[1],
        so that if m is a match slice, the name for m[i] is SubexpNames()[i].
        Since the Regexp as a whole cannot be named, names[0] is always
        the empty string. The slice should not be modified.
    **/
    @:native("SubexpNames") function subexpNames(): (go.Slice<String>);
    /**
        UnmarshalText implements [encoding.TextUnmarshaler] by calling
        [Compile] on the encoded value.
    **/
    @:native("UnmarshalText") function unmarshalText(text: go.Slice<go.Byte>): (go.Error);

}