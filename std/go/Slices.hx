package go;

/**
    Package slices defines various functions useful with slices of any type.
**/
@:go.Type({ name: "slices", instanceName: "slices.slices", imports: ["slices"] })
extern class Slices {

    /**
        All returns an iterator over index-value pairs in the slice
        in the usual order.
    **/
    @:native("All") static function all<Slice: Dynamic, E: Dynamic>(s: Slice): (go.iter.Seq2<go.GoInt, E>);
    /**
        AppendSeq appends the values from seq to the slice and
        returns the extended slice.
        If seq is empty, the result preserves the nilness of s.
    **/
    @:native("AppendSeq") static function appendSeq<Slice: Dynamic, E: Dynamic>(s: Slice, seq: go.iter.Seq<E>): (Slice);
    /**
        Backward returns an iterator over index-value pairs in the slice,
        traversing it backward with descending indices.
    **/
    @:native("Backward") static function backward<Slice: Dynamic, E: Dynamic>(s: Slice): (go.iter.Seq2<go.GoInt, E>);
    /**
        BinarySearch searches for target in a sorted slice and returns the earliest
        position where target is found, or the position where target would appear
        in the sort order; it also returns a bool saying whether the target is
        really found in the slice. The slice must be sorted in increasing order.
    **/
    @:go.Tuple("p0", "p1") @:native("BinarySearch") static function binarySearch<S: Dynamic, E: go.cmp.Ordered>(x: S, target: E): (go.Tuple<{ p0: go.GoInt, p1: Bool }>);
    /**
        BinarySearchFunc works like [BinarySearch], but uses a custom comparison
        function. The slice must be sorted in increasing order, where "increasing"
        is defined by cmp. cmp should return 0 if the slice element matches
        the target, a negative number if the slice element precedes the target,
        or a positive number if the slice element follows the target.
        cmp must implement the same ordering as the slice, such that if
        cmp(a, t) < 0 and cmp(b, t) >= 0, then a must precede b in the slice.
    **/
    @:go.Tuple("p0", "p1") @:native("BinarySearchFunc") static function binarySearchFunc<S: Dynamic, E: Dynamic, T: Dynamic>(x: S, target: T, cmp: (p0: E, p1: T) -> (go.GoInt)): (go.Tuple<{ p0: go.GoInt, p1: Bool }>);
    /**
        Chunk returns an iterator over consecutive sub-slices of up to n elements of s.
        All but the last sub-slice will have size n.
        All sub-slices are clipped to have no capacity beyond the length.
        If s is empty, the sequence is empty: there is no empty slice in the sequence.
        Chunk panics if n is less than 1.
    **/
    @:native("Chunk") static function chunk<Slice: Dynamic, E: Dynamic>(s: Slice, n: go.GoInt): (go.iter.Seq<Slice>);
    /**
        Clip removes unused capacity from the slice, returning s[:len(s):len(s)].
        The result preserves the nilness of s.
    **/
    @:native("Clip") static function clip<S: Dynamic, E: Dynamic>(s: S): (S);
    /**
        Clone returns a copy of the slice.
        The elements are copied using assignment, so this is a shallow clone.
        The result may have additional unused capacity.
        The result preserves the nilness of s.
    **/
    @:native("Clone") static function clone<S: Dynamic, E: Dynamic>(s: S): (S);
    /**
        Collect collects values from seq into a new slice and returns it.
        If seq is empty, the result is nil.
    **/
    @:native("Collect") static function collect<E: Dynamic>(seq: go.iter.Seq<E>): (go.Slice<E>);
    /**
        Compact replaces consecutive runs of equal elements with a single copy.
        This is like the uniq command found on Unix.
        Compact modifies the contents of the slice s and returns the modified slice,
        which may have a smaller length.
        Compact zeroes the elements between the new length and the original length.
        The result preserves the nilness of s.
    **/
    @:native("Compact") static function compact<S: Dynamic, E: go.Comparable>(s: S): (S);
    /**
        CompactFunc is like [Compact] but uses an equality function to compare elements.
        For runs of elements that compare equal, CompactFunc keeps the first one.
        CompactFunc zeroes the elements between the new length and the original length.
        The result preserves the nilness of s.
    **/
    @:native("CompactFunc") static function compactFunc<S: Dynamic, E: Dynamic>(s: S, eq: (p0: E, p1: E) -> (Bool)): (S);
    /**
        Compare compares the elements of s1 and s2, using [cmp.Compare] on each pair
        of elements. The elements are compared sequentially, starting at index 0,
        until one element is not equal to the other.
        The result of comparing the first non-matching elements is returned.
        If both slices are equal until one of them ends, the shorter slice is
        considered less than the longer one.
        The result is 0 if s1 == s2, -1 if s1 < s2, and +1 if s1 > s2.
    **/
    @:native("Compare") static function compare<S: Dynamic, E: go.cmp.Ordered>(s1: S, s2: S): (go.GoInt);
    /**
        CompareFunc is like [Compare] but uses a custom comparison function on each
        pair of elements.
        The result is the first non-zero result of cmp; if cmp always
        returns 0 the result is 0 if len(s1) == len(s2), -1 if len(s1) < len(s2),
        and +1 if len(s1) > len(s2).
    **/
    @:native("CompareFunc") static function compareFunc<S1: Dynamic, S2: Dynamic, E1: Dynamic, E2: Dynamic>(s1: S1, s2: S2, cmp: (p0: E1, p1: E2) -> (go.GoInt)): (go.GoInt);
    /**
        Concat returns a new slice concatenating the passed in slices.
        If the concatenation is empty, the result is nil.
    **/
    @:native("Concat") static function concat<S: Dynamic, E: Dynamic>(slices: haxe.Rest<S>): (S);
    /**
        Contains reports whether v is present in s.
    **/
    @:native("Contains") static function contains<S: Dynamic, E: go.Comparable>(s: S, v: E): (Bool);
    /**
        ContainsFunc reports whether at least one
        element e of s satisfies f(e).
    **/
    @:native("ContainsFunc") static function containsFunc<S: Dynamic, E: Dynamic>(s: S, f: (p0: E) -> (Bool)): (Bool);
    /**
        Delete removes the elements s[i:j] from s, returning the modified slice.
        Delete panics if j > len(s) or s[i:j] is not a valid slice of s.
        Delete is O(len(s)-i), so if many items must be deleted, it is better to
        make a single call deleting them all together than to delete one at a time.
        Delete zeroes the elements s[len(s)-(j-i):len(s)].
        If the result is empty, it has the same nilness as s.
    **/
    @:native("Delete") static function delete<S: Dynamic, E: Dynamic>(s: S, i: go.GoInt, j: go.GoInt): (S);
    /**
        DeleteFunc removes any elements from s for which del returns true,
        returning the modified slice.
        DeleteFunc zeroes the elements between the new length and the original length.
        If the result is empty, it has the same nilness as s.
    **/
    @:native("DeleteFunc") static function deleteFunc<S: Dynamic, E: Dynamic>(s: S, del: (p0: E) -> (Bool)): (S);
    /**
        Equal reports whether two slices are equal: the same length and all
        elements equal. If the lengths are different, Equal returns false.
        Otherwise, the elements are compared in increasing index order, and the
        comparison stops at the first unequal pair.
        Empty and nil slices are considered equal.
        Floating point NaNs are not considered equal.
    **/
    @:native("Equal") static function equal<S: Dynamic, E: go.Comparable>(s1: S, s2: S): (Bool);
    /**
        EqualFunc reports whether two slices are equal using an equality
        function on each pair of elements. If the lengths are different,
        EqualFunc returns false. Otherwise, the elements are compared in
        increasing index order, and the comparison stops at the first index
        for which eq returns false.
    **/
    @:native("EqualFunc") static function equalFunc<S1: Dynamic, S2: Dynamic, E1: Dynamic, E2: Dynamic>(s1: S1, s2: S2, eq: (p0: E1, p1: E2) -> (Bool)): (Bool);
    /**
        Grow increases the slice's capacity, if necessary, to guarantee space for
        another n elements. After Grow(n), at least n elements can be appended
        to the slice without another allocation. If n is negative or too large to
        allocate the memory, Grow panics.
        The result preserves the nilness of s.
    **/
    @:native("Grow") static function grow<S: Dynamic, E: Dynamic>(s: S, n: go.GoInt): (S);
    /**
        Index returns the index of the first occurrence of v in s,
        or -1 if not present.
    **/
    @:native("Index") static function index<S: Dynamic, E: go.Comparable>(s: S, v: E): (go.GoInt);
    /**
        IndexFunc returns the first index i satisfying f(s[i]),
        or -1 if none do.
    **/
    @:native("IndexFunc") static function indexFunc<S: Dynamic, E: Dynamic>(s: S, f: (p0: E) -> (Bool)): (go.GoInt);
    /**
        Insert inserts the values v... into s at index i,
        returning the modified slice.
        The elements at s[i:] are shifted up to make room.
        In the returned slice r, r[i] == v[0],
        and, if i < len(s), r[i+len(v)] == value originally at s[i].
        Insert panics if i > len(s).
        This function is O(len(s) + len(v)).
        If the result is empty, it has the same nilness as s.
    **/
    @:native("Insert") static function insert<S: Dynamic, E: Dynamic>(s: S, i: go.GoInt, v: haxe.Rest<E>): (S);
    /**
        IsSorted reports whether x is sorted in ascending order.
    **/
    @:native("IsSorted") static function isSorted<S: Dynamic, E: go.cmp.Ordered>(x: S): (Bool);
    /**
        IsSortedFunc reports whether x is sorted in ascending order, with cmp as the
        comparison function as defined by [SortFunc].
    **/
    @:native("IsSortedFunc") static function isSortedFunc<S: Dynamic, E: Dynamic>(x: S, cmp: (a: E, b: E) -> (go.GoInt)): (Bool);
    /**
        Max returns the maximal value in x. It panics if x is empty.
        For floating-point E, Max propagates NaNs (any NaN value in x
        forces the output to be NaN).
    **/
    @:native("Max") static function max<S: Dynamic, E: go.cmp.Ordered>(x: S): (E);
    /**
        MaxFunc returns the maximal value in x, using cmp to compare elements.
        It panics if x is empty. If there is more than one maximal element
        according to the cmp function, MaxFunc returns the first one.
    **/
    @:native("MaxFunc") static function maxFunc<S: Dynamic, E: Dynamic>(x: S, cmp: (a: E, b: E) -> (go.GoInt)): (E);
    /**
        Min returns the minimal value in x. It panics if x is empty.
        For floating-point numbers, Min propagates NaNs (any NaN value in x
        forces the output to be NaN).
    **/
    @:native("Min") static function min<S: Dynamic, E: go.cmp.Ordered>(x: S): (E);
    /**
        MinFunc returns the minimal value in x, using cmp to compare elements.
        It panics if x is empty. If there is more than one minimal element
        according to the cmp function, MinFunc returns the first one.
    **/
    @:native("MinFunc") static function minFunc<S: Dynamic, E: Dynamic>(x: S, cmp: (a: E, b: E) -> (go.GoInt)): (E);
    /**
        Repeat returns a new slice that repeats the provided slice the given number of times.
        The result has length and capacity (len(x) * count).
        The result is never nil.
        Repeat panics if count is negative or if the result of (len(x) * count)
        overflows.
    **/
    @:native("Repeat") static function repeat<S: Dynamic, E: Dynamic>(x: S, count: go.GoInt): (S);
    /**
        Replace replaces the elements s[i:j] by the given v, and returns the
        modified slice.
        Replace panics if j > len(s) or s[i:j] is not a valid slice of s.
        When len(v) < (j-i), Replace zeroes the elements between the new length and the original length.
        If the result is empty, it has the same nilness as s.
    **/
    @:native("Replace") static function replace<S: Dynamic, E: Dynamic>(s: S, i: go.GoInt, j: go.GoInt, v: haxe.Rest<E>): (S);
    /**
        Reverse reverses the elements of the slice in place.
    **/
    @:native("Reverse") static function reverse<S: Dynamic, E: Dynamic>(s: S): Void;
    /**
        Sort sorts a slice of any ordered type in ascending order.
        When sorting floating-point numbers, NaNs are ordered before other values.
    **/
    @:native("Sort") static function sort<S: Dynamic, E: go.cmp.Ordered>(x: S): Void;
    /**
        SortFunc sorts the slice x in ascending order as determined by the cmp
        function. This sort is not guaranteed to be stable.
        cmp(a, b) should return a negative number when a < b, a positive number when
        a > b and zero when a == b or a and b are incomparable in the sense of
        a strict weak ordering.
        
        SortFunc requires that cmp is a strict weak ordering.
        See https://en.wikipedia.org/wiki/Weak_ordering#Strict_weak_orderings.
        The function should return 0 for incomparable items.
    **/
    @:native("SortFunc") static function sortFunc<S: Dynamic, E: Dynamic>(x: S, cmp: (a: E, b: E) -> (go.GoInt)): Void;
    /**
        SortStableFunc sorts the slice x while keeping the original order of equal
        elements, using cmp to compare elements in the same way as [SortFunc].
    **/
    @:native("SortStableFunc") static function sortStableFunc<S: Dynamic, E: Dynamic>(x: S, cmp: (a: E, b: E) -> (go.GoInt)): Void;
    /**
        Sorted collects values from seq into a new slice, sorts the slice,
        and returns it.
        If seq is empty, the result is nil.
    **/
    @:native("Sorted") static function sorted<E: go.cmp.Ordered>(seq: go.iter.Seq<E>): (go.Slice<E>);
    /**
        SortedFunc collects values from seq into a new slice, sorts the slice
        using the comparison function, and returns it.
        If seq is empty, the result is nil.
    **/
    @:native("SortedFunc") static function sortedFunc<E: Dynamic>(seq: go.iter.Seq<E>, cmp: (p0: E, p1: E) -> (go.GoInt)): (go.Slice<E>);
    /**
        SortedStableFunc collects values from seq into a new slice.
        It then sorts the slice while keeping the original order of equal elements,
        using the comparison function to compare elements.
        It returns the new slice.
        If seq is empty, the result is nil.
    **/
    @:native("SortedStableFunc") static function sortedStableFunc<E: Dynamic>(seq: go.iter.Seq<E>, cmp: (p0: E, p1: E) -> (go.GoInt)): (go.Slice<E>);
    /**
        Values returns an iterator that yields the slice elements in order.
    **/
    @:native("Values") static function values<Slice: Dynamic, E: Dynamic>(s: Slice): (go.iter.Seq<E>);

}