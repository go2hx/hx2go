package main

//file:///Users/mikaib/Downloads/hx2go-old/testbed/Test.hx#L9
func (this *Hx_greeter_Obj) Greet()  {
	Hx_haxe_log_Trace_Field("Hello, " + this.Name, map[string]any{"fileName":any("testbed/Test.hx"), "lineNumber":any(10), "className":any("Greeter"), "methodName":any("greet")})
}

var Hx_greeter_Obj_ClassType *Hx_runtime_hxclass_Obj = Hx_runtime_hxclass_Obj_CreateInstance("Greeter", struct{ Value *Hx_runtime_hxclass_Obj; HasValue bool }{})
type Hx_greeter_Obj_VTable interface {
	Greet()
	__HxClass() *Hx_runtime_hxclass_Obj
}

type Hx_greeter_Obj struct {
	VTable Hx_greeter_Obj_VTable
	Name string
}

func Hx_greeter_Obj_CreateEmptyInstance() *Hx_greeter_Obj {
	obj := &Hx_greeter_Obj{}
	obj.VTable = obj
	return obj
}

func Hx_greeter_Obj_CreateInstance(name string) *Hx_greeter_Obj {
	obj := Hx_greeter_Obj_CreateEmptyInstance()
	obj.New(name)
	return obj
}

func (this *Hx_greeter_Obj) __HxClass() *Hx_runtime_hxclass_Obj {
	return Hx_greeter_Obj_ClassType
}

func (this *Hx_greeter_Obj) New(name string)  {
	this.Name = name
}

//file:///Users/mikaib/Downloads/hx2go-old/testbed/Test.hx#L17
func Hx_test_Main_Field()  {
	Hx_greeter_Obj_CreateInstance("John").VTable.Greet()
}
var Hx_test_Obj_ClassType *Hx_runtime_hxclass_Obj = Hx_runtime_hxclass_Obj_CreateInstance("Test", struct{ Value *Hx_runtime_hxclass_Obj; HasValue bool }{})
type Hx_test_Obj_VTable interface {
	__HxClass() *Hx_runtime_hxclass_Obj
}

type Hx_test_Obj struct {
	VTable Hx_test_Obj_VTable
}

func Hx_test_Obj_CreateEmptyInstance() *Hx_test_Obj {
	obj := &Hx_test_Obj{}
	obj.VTable = obj
	return obj
}

func Hx_test_Obj_CreateInstance() *Hx_test_Obj {
	obj := Hx_test_Obj_CreateEmptyInstance()
	return obj
}

func (this *Hx_test_Obj) __HxClass() *Hx_runtime_hxclass_Obj {
	return Hx_test_Obj_ClassType
}

