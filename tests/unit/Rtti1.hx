package unit;
@:rtti
class Rtti1 {
  var x:String;
  static function main() {
    var rtti = haxe.rtti.Rtti.getRtti(Rtti1);
    assert(rtti.path == "Rtti1");
    assert(rtti.fields.length == 1);
  }
}