package go.index.suffixarray;

/**
    Index implements a suffix array for fast substring search.
**/
@:structInit
@:go.Type({ name: "Index", instanceName: "suffixarray.Index", imports: ["index/suffixarray"] })
extern class Index {

    /**
        Bytes returns the data over which the index was created.
        It must not be modified.
    **/
    @:native("Bytes") function bytes(): (go.Slice<go.Byte>);
    /**
        FindAllIndex returns a sorted list of non-overlapping matches of the
        regular expression r, where a match is a pair of indices specifying
        the matched slice of x.Bytes(). If n < 0, all matches are returned
        in successive order. Otherwise, at most n matches are returned and
        they may not be successive. The result is nil if there are no matches,
        or if n == 0.
    **/
    @:native("FindAllIndex") function findAllIndex(r: go.Pointer<go.regexp.Regexp>, n: go.GoInt): (go.Slice<go.Slice<go.GoInt>>);
    /**
        Lookup returns an unsorted list of at most n indices where the byte string s
        occurs in the indexed data. If n < 0, all occurrences are returned.
        The result is nil if s is empty, s is not found, or n == 0.
        Lookup time is O(log(N)*len(s) + len(result)) where N is the
        size of the indexed data.
    **/
    @:native("Lookup") function lookup(s: go.Slice<go.Byte>, n: go.GoInt): (go.Slice<go.GoInt>);
    /**
        Read reads the index from r into x; x must not be nil.
    **/
    @:native("Read") function read(r: go.io.Reader): (go.Error);
    /**
        Write writes the index x to w.
    **/
    @:native("Write") function write(w: go.io.Writer): (go.Error);

}