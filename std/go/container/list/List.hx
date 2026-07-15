package go.container.list;

@:structInit
@:go.Type({ name: "List", instanceName: "list.List", imports: ["container/list"] })
extern class List {

    @:native("Back") function back(): go.Pointer<go.container.list.Element>;
    @:native("Front") function front(): go.Pointer<go.container.list.Element>;
    @:native("Init") function init(): go.Pointer<go.container.list.List>;
    @:native("InsertAfter") function insertAfter(v: Dynamic, mark: go.Pointer<go.container.list.Element>): go.Pointer<go.container.list.Element>;
    @:native("InsertBefore") function insertBefore(v: Dynamic, mark: go.Pointer<go.container.list.Element>): go.Pointer<go.container.list.Element>;
    @:native("Len") function len(): go.GoInt;
    @:native("MoveAfter") function moveAfter(e: go.Pointer<go.container.list.Element>, mark: go.Pointer<go.container.list.Element>): Void;
    @:native("MoveBefore") function moveBefore(e: go.Pointer<go.container.list.Element>, mark: go.Pointer<go.container.list.Element>): Void;
    @:native("MoveToBack") function moveToBack(e: go.Pointer<go.container.list.Element>): Void;
    @:native("MoveToFront") function moveToFront(e: go.Pointer<go.container.list.Element>): Void;
    @:native("PushBack") function pushBack(v: Dynamic): go.Pointer<go.container.list.Element>;
    @:native("PushBackList") function pushBackList(other: go.Pointer<go.container.list.List>): Void;
    @:native("PushFront") function pushFront(v: Dynamic): go.Pointer<go.container.list.Element>;
    @:native("PushFrontList") function pushFrontList(other: go.Pointer<go.container.list.List>): Void;
    @:native("Remove") function remove(e: go.Pointer<go.container.list.Element>): Dynamic;

}