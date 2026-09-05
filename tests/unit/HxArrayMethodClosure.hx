package unit;
function main() {
  var x = [1, 2, 3];
  var y = x.push;
  y(4);
  assert(y != null);

  var z = x.keyValueIterator();
  assert(z.hasNext() == true);

  var x:Dynamic = [1, 2, 3];
  var y = x.push;
  y(4);
  assert(x.length == 4);

  var a : Array<Int> = [1,2,3,5,8];
  var itf : () -> KeyValueIterator<Int, Int> = a.keyValueIterator;
  var it = itf();
  assert(it.next().value == 1);
}