package language;

import runtime.HxClass;

function run() {
    trace("HxClass Reflection\n");

    var truckCls = HxClass.findClass("Truck");
    assert(truckCls.name, "Truck");

    var carCls = HxClass.findClass("Car");
    assert(carCls.name, "Car");

    var vehicleCls = HxClass.findClass("Vehicle");
    assert(vehicleCls.name, "Vehicle");

    assert(truckCls.superClass.name, "Car");
    assert(truckCls.superClass.superClass.name, "Vehicle");
    assert(truckCls.superClass.superClass.superClass, null);

    assert(carCls.superClass.name, "Vehicle");
    assert(carCls.superClass.superClass, null);

    assert(vehicleCls.superClass, null);

    assert(HxClass.findClass("NonExistentClass"), null);

    var allClasses = HxClass.getAllClasses();
    assert(allClasses.length > 0, true);

    var names = [for (c in allClasses) c.name];
    assert(names.contains("Truck"), true);
    assert(names.contains("Car"), true);
    assert(names.contains("Vehicle"), true);

    var cls1 = HxClass.findClass("Truck");
    var cls2 = HxClass.findClass("Truck");
    assert(cls1 == cls2, true);

    assert(truckCls.superClass == HxClass.findClass("Car"), true);
    assert(truckCls.superClass.superClass == HxClass.findClass("Vehicle"), true);

    var lastNameGreeterCls = HxClass.findClass("LastNameGreeter");
    assert(lastNameGreeterCls.name, "LastNameGreeter");
    assert(lastNameGreeterCls.superClass.name, "Greeter");
    assert(lastNameGreeterCls.superClass.superClass, null);
}