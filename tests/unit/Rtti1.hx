package unit;
@:rtti
class Main {
  var x:String;
  static function main() {
    var rtti = haxe.rtti.Rtti.getRtti(Main);
    assert(rtti.path == "Main");
    assert(rtti.fields.length == 1);
  }
}