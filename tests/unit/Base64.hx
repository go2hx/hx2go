package unit;
import haxe.crypto.Base64;

function main() {
   assert(Base64.decode("aGVsbG8=").toString() == "hello");
}