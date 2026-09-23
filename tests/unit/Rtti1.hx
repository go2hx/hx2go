package unit;
@:rtti
class Rtti1 {
  var x:String;
  public static function main() {
    var rtti = haxe.rtti.Rtti.getRtti(Rtti1);
    assert(rtti.path.indexOf("Rtti1") != -1);
    assert(rtti.fields.length == 1);
  }
}