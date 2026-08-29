package go.container;

/**
    Package list implements a doubly linked list.
    
    To iterate over a list (where l is a *List):
    
    	for e := l.Front(); e != nil; e = e.Next() {
    		// do something with e.Value
    	}
**/
@:go.Type({ name: "list", instanceName: "list.list", imports: ["container/list"] })
extern class List {

    /**
        New returns an initialized list.
    **/
    @:native("New") static function _new(): (go.Pointer<go.container.list.List>);

}