package go;

/**
    Package sort provides primitives for sorting slices and user-defined collections.
**/
@:go.Type({ name: "sort", instanceName: "sort.sort", imports: ["sort"] })
extern class Sort {

    /**
        Find uses binary search to find and return the smallest index i in [0, n)
        at which cmp(i) <= 0. If there is no such index i, Find returns i = n.
        The found result is true if i < n and cmp(i) == 0.
        Find calls cmp(i) only for i in the range [0, n).
        
        To permit binary search, Find requires that cmp(i) > 0 for a leading
        prefix of the range, cmp(i) == 0 in the middle, and cmp(i) < 0 for
        the final suffix of the range. (Each subrange could be empty.)
        The usual way to establish this condition is to interpret cmp(i)
        as a comparison of a desired target value t against entry i in an
        underlying indexed data structure x, returning <0, 0, and >0
        when t < x[i], t == x[i], and t > x[i], respectively.
        
        For example, to look for a particular string in a sorted, random-access
        list of strings:
        
        	i, found := sort.Find(x.Len(), func(i int) int {
        	    return strings.Compare(target, x.At(i))
        	})
        	if found {
        	    fmt.Printf("found %s at entry %d\n", target, i)
        	} else {
        	    fmt.Printf("%s not found, would insert at %d", target, i)
        	}
    **/
    @:go.Tuple("i", "found") @:native("Find") static function find(n: go.GoInt, cmp: (p0: go.GoInt) -> (go.GoInt)): (go.Tuple<{ i: go.GoInt, found: Bool }>);
    /**
        Float64s sorts a slice of float64s in increasing order.
        Not-a-number (NaN) values are ordered before other values.
        
        Note: as of Go 1.22, this function simply calls [slices.Sort].
    **/
    @:native("Float64s") static function float64s(x: go.Slice<Float>): Void;
    /**
        Float64sAreSorted reports whether the slice x is sorted in increasing order,
        with not-a-number (NaN) values before any other values.
        
        Note: as of Go 1.22, this function simply calls [slices.IsSorted].
    **/
    @:native("Float64sAreSorted") static function float64sAreSorted(x: go.Slice<Float>): (Bool);
    /**
        Ints sorts a slice of ints in increasing order.
        
        Note: as of Go 1.22, this function simply calls [slices.Sort].
    **/
    @:native("Ints") static function ints(x: go.Slice<go.GoInt>): Void;
    /**
        IntsAreSorted reports whether the slice x is sorted in increasing order.
        
        Note: as of Go 1.22, this function simply calls [slices.IsSorted].
    **/
    @:native("IntsAreSorted") static function intsAreSorted(x: go.Slice<go.GoInt>): (Bool);
    /**
        IsSorted reports whether data is sorted.
        
        Note: in many situations, the newer [slices.IsSortedFunc] function is more
        ergonomic and runs faster.
    **/
    @:native("IsSorted") static function isSorted(data: go.sort.Interface): (Bool);
    /**
        Reverse returns the reverse order for data.
    **/
    @:native("Reverse") static function reverse(data: go.sort.Interface): (go.sort.Interface);
    /**
        Search uses binary search to find and return the smallest index i
        in [0, n) at which f(i) is true, assuming that on the range [0, n),
        f(i) == true implies f(i+1) == true. That is, Search requires that
        f is false for some (possibly empty) prefix of the input range [0, n)
        and then true for the (possibly empty) remainder; Search returns
        the first true index. If there is no such index, Search returns n.
        (Note that the "not found" return value is not -1 as in, for instance,
        strings.Index.)
        Search calls f(i) only for i in the range [0, n).
        
        A common use of Search is to find the index i for a value x in
        a sorted, indexable data structure such as an array or slice.
        In this case, the argument f, typically a closure, captures the value
        to be searched for, and how the data structure is indexed and
        ordered.
        
        For instance, given a slice data sorted in ascending order,
        the call Search(len(data), func(i int) bool { return data[i] >= 23 })
        returns the smallest index i such that data[i] >= 23. If the caller
        wants to find whether 23 is in the slice, it must test data[i] == 23
        separately.
        
        Searching data sorted in descending order would use the <=
        operator instead of the >= operator.
        
        To complete the example above, the following code tries to find the value
        x in an integer slice data sorted in ascending order:
        
        	x := 23
        	i := sort.Search(len(data), func(i int) bool { return data[i] >= x })
        	if i < len(data) && data[i] == x {
        		// x is present at data[i]
        	} else {
        		// x is not present in data,
        		// but i is the index where it would be inserted.
        	}
        
        As a more whimsical example, this program guesses your number:
        
        	func GuessingGame() {
        		var s string
        		fmt.Printf("Pick an integer from 0 to 100.\n")
        		answer := sort.Search(100, func(i int) bool {
        			fmt.Printf("Is your number <= %d? ", i)
        			fmt.Scanf("%s", &s)
        			return s != "" && s[0] == 'y'
        		})
        		fmt.Printf("Your number is %d.\n", answer)
        	}
    **/
    @:native("Search") static function search(n: go.GoInt, f: (p0: go.GoInt) -> (Bool)): (go.GoInt);
    /**
        SearchFloat64s searches for x in a sorted slice of float64s and returns the index
        as specified by [Search]. The return value is the index to insert x if x is not
        present (it could be len(a)).
        The slice must be sorted in ascending order.
    **/
    @:native("SearchFloat64s") static function searchFloat64s(a: go.Slice<Float>, x: Float): (go.GoInt);
    /**
        SearchInts searches for x in a sorted slice of ints and returns the index
        as specified by [Search]. The return value is the index to insert x if x is
        not present (it could be len(a)).
        The slice must be sorted in ascending order.
    **/
    @:native("SearchInts") static function searchInts(a: go.Slice<go.GoInt>, x: go.GoInt): (go.GoInt);
    /**
        SearchStrings searches for x in a sorted slice of strings and returns the index
        as specified by Search. The return value is the index to insert x if x is not
        present (it could be len(a)).
        The slice must be sorted in ascending order.
    **/
    @:native("SearchStrings") static function searchStrings(a: go.Slice<String>, x: String): (go.GoInt);
    /**
        Slice sorts the slice x given the provided less function.
        It panics if x is not a slice.
        
        The sort is not guaranteed to be stable: equal elements
        may be reversed from their original order.
        For a stable sort, use [SliceStable].
        
        The less function must satisfy the same requirements as
        the Interface type's Less method.
        
        Note: in many situations, the newer [slices.SortFunc] function is more
        ergonomic and runs faster.
    **/
    @:native("Slice") static function slice(x: Dynamic, less: (i: go.GoInt, j: go.GoInt) -> (Bool)): Void;
    /**
        SliceIsSorted reports whether the slice x is sorted according to the provided less function.
        It panics if x is not a slice.
        
        Note: in many situations, the newer [slices.IsSortedFunc] function is more
        ergonomic and runs faster.
    **/
    @:native("SliceIsSorted") static function sliceIsSorted(x: Dynamic, less: (i: go.GoInt, j: go.GoInt) -> (Bool)): (Bool);
    /**
        SliceStable sorts the slice x using the provided less
        function, keeping equal elements in their original order.
        It panics if x is not a slice.
        
        The less function must satisfy the same requirements as
        the Interface type's Less method.
        
        Note: in many situations, the newer [slices.SortStableFunc] function is more
        ergonomic and runs faster.
    **/
    @:native("SliceStable") static function sliceStable(x: Dynamic, less: (i: go.GoInt, j: go.GoInt) -> (Bool)): Void;
    /**
        Sort sorts data in ascending order as determined by the Less method.
        It makes one call to data.Len to determine n and O(n*log(n)) calls to
        data.Less and data.Swap. The sort is not guaranteed to be stable.
        
        Note: in many situations, the newer [slices.SortFunc] function is more
        ergonomic and runs faster.
    **/
    @:native("Sort") static function sort(data: go.sort.Interface): Void;
    /**
        Stable sorts data in ascending order as determined by the Less method,
        while keeping the original order of equal elements.
        
        It makes one call to data.Len to determine n, O(n*log(n)) calls to
        data.Less and O(n*log(n)*log(n)) calls to data.Swap.
        
        Note: in many situations, the newer slices.SortStableFunc function is more
        ergonomic and runs faster.
    **/
    @:native("Stable") static function stable(data: go.sort.Interface): Void;
    /**
        Strings sorts a slice of strings in increasing order.
        
        Note: as of Go 1.22, this function simply calls [slices.Sort].
    **/
    @:native("Strings") static function strings(x: go.Slice<String>): Void;
    /**
        StringsAreSorted reports whether the slice x is sorted in increasing order.
        
        Note: as of Go 1.22, this function simply calls [slices.IsSorted].
    **/
    @:native("StringsAreSorted") static function stringsAreSorted(x: go.Slice<String>): (Bool);

}