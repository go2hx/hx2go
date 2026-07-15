package go.internal;

@:go.Type({ name: "synctest", instanceName: "synctest.synctest", imports: ["internal/synctest"] })
extern class Synctest {

    @:native("CurrentBubble") static var CurrentBubble: go.internal.synctest.Association;
    @:native("OtherBubble") static var OtherBubble: go.internal.synctest.Association;
    @:native("Unbubbled") static var Unbubbled: go.internal.synctest.Association;

    @:native("Acquire") static function acquire(): go.Pointer<go.internal.synctest.Bubble>;
    @:native("Associate") static function associate<T: Dynamic>(p: go.Pointer<T>): go.internal.synctest.Association;
    @:native("Disassociate") static function disassociate<T: Dynamic>(p: go.Pointer<T>): Void;
    @:native("IsAssociated") static function isAssociated<T: Dynamic>(p: go.Pointer<T>): Bool;
    @:native("IsInBubble") static function isInBubble(): Bool;
    @:native("Run") static function run(f: () -> Void): Void;
    @:native("Wait") static function wait(): Void;

}