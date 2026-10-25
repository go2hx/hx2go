package go.plugin;

/**
    A Symbol is a pointer to a variable or function.
    
    For example, a plugin defined as
    
    	package main
    
    	import "fmt"
    
    	var V int
    
    	func F() { fmt.Printf("Hello, number %d\n", V) }
    
    may be loaded with the [Open] function and then the exported package
    symbols V and F can be accessed
    
    	p, err := plugin.Open("plugin_name.so")
    	if err != nil {
    		panic(err)
    	}
    	v, err := p.Lookup("V")
    	if err != nil {
    		panic(err)
    	}
    	f, err := p.Lookup("F")
    	if err != nil {
    		panic(err)
    	}
    	*v.(*int) = 7
    	f.(func())() // prints "Hello, number 7"
**/
@:go.Type({ name: "Symbol", instanceName: "plugin.Symbol", imports: ["plugin"] })
extern typedef Symbol = {

}