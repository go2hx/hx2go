package go.container.list;

/**
    List represents a doubly linked list.
    The zero value for List is an empty list ready to use.
**/
@:structInit
@:go.Type({ name: "List", instanceName: "list.List", imports: ["container/list"] })
extern class List {

    /**
        Back returns the last element of list l or nil if the list is empty.
    **/
    @:native("Back") function back(): (go.Pointer<go.container.list.Element>);
    /**
        Front returns the first element of list l or nil if the list is empty.
    **/
    @:native("Front") function front(): (go.Pointer<go.container.list.Element>);
    /**
        Init initializes or clears list l.
    **/
    @:native("Init") function init(): (go.Pointer<go.container.list.List>);
    /**
        InsertAfter inserts a new element e with value v immediately after mark and returns e.
        If mark is not an element of l, the list is not modified.
        The mark must not be nil.
    **/
    @:native("InsertAfter") function insertAfter(v: Dynamic, mark: go.Pointer<go.container.list.Element>): (go.Pointer<go.container.list.Element>);
    /**
        InsertBefore inserts a new element e with value v immediately before mark and returns e.
        If mark is not an element of l, the list is not modified.
        The mark must not be nil.
    **/
    @:native("InsertBefore") function insertBefore(v: Dynamic, mark: go.Pointer<go.container.list.Element>): (go.Pointer<go.container.list.Element>);
    /**
        Len returns the number of elements of list l.
        The complexity is O(1).
    **/
    @:native("Len") function len(): (go.GoInt);
    /**
        MoveAfter moves element e to its new position after mark.
        If e or mark is not an element of l, or e == mark, the list is not modified.
        The element and mark must not be nil.
    **/
    @:native("MoveAfter") function moveAfter(e: go.Pointer<go.container.list.Element>, mark: go.Pointer<go.container.list.Element>): Void;
    /**
        MoveBefore moves element e to its new position before mark.
        If e or mark is not an element of l, or e == mark, the list is not modified.
        The element and mark must not be nil.
    **/
    @:native("MoveBefore") function moveBefore(e: go.Pointer<go.container.list.Element>, mark: go.Pointer<go.container.list.Element>): Void;
    /**
        MoveToBack moves element e to the back of list l.
        If e is not an element of l, the list is not modified.
        The element must not be nil.
    **/
    @:native("MoveToBack") function moveToBack(e: go.Pointer<go.container.list.Element>): Void;
    /**
        MoveToFront moves element e to the front of list l.
        If e is not an element of l, the list is not modified.
        The element must not be nil.
    **/
    @:native("MoveToFront") function moveToFront(e: go.Pointer<go.container.list.Element>): Void;
    /**
        PushBack inserts a new element e with value v at the back of list l and returns e.
    **/
    @:native("PushBack") function pushBack(v: Dynamic): (go.Pointer<go.container.list.Element>);
    /**
        PushBackList inserts a copy of another list at the back of list l.
        The lists l and other may be the same. They must not be nil.
    **/
    @:native("PushBackList") function pushBackList(other: go.Pointer<go.container.list.List>): Void;
    /**
        PushFront inserts a new element e with value v at the front of list l and returns e.
    **/
    @:native("PushFront") function pushFront(v: Dynamic): (go.Pointer<go.container.list.Element>);
    /**
        PushFrontList inserts a copy of another list at the front of list l.
        The lists l and other may be the same. They must not be nil.
    **/
    @:native("PushFrontList") function pushFrontList(other: go.Pointer<go.container.list.List>): Void;
    /**
        Remove removes e from l if e is an element of list l.
        It returns the element value e.Value.
        The element must not be nil.
    **/
    @:native("Remove") function remove(e: go.Pointer<go.container.list.Element>): (Dynamic);

}