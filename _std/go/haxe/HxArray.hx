package go.haxe;

import haxe.Rest;
import go.Syntax;
import go.Slice;
import go.GoInt;
import go.Go;

// TODO: remove extern from class and functions when module resolution works correctly.
class HxArray {

    public inline extern static function fastGet<T>(arr: Array<T>, index: Int): T {
        return null;
    }

    public inline extern static function fastSet<T>(arr: Array<T>, index: Int, value: T) {
        return;
    }

    public inline extern static function push<T>(arr: Array<T>, value: T): GoInt {
        return 0;
    }

    @:pure public inline extern static function concat<T>(on: Array<T>, arr: Array<T>): Array<T> {
        return [];
    }

    @:pure public inline extern static function copy<T>(arr: Array<T>): Array<T> {
        return [];
    }

    public inline extern static function pop<T>(arr: Array<T>): Null<T> {
        return null;
    }

    public inline extern static function reverse<T>(arr: Array<T>): Void {
        return;
    }

    public inline extern static function shift<T>(arr: Array<T>): Null<T> {
        return null;
    }

    public inline extern static function unshift<T>(arr: Array<T>, value: T): Void {
        return;
    }

    public inline extern static function insert<T>(arr: Array<T>, pos: Int, value: T): Void {
        return;
    }

    public inline extern static function splice<T>(arr: Array<T>, pos: Int, length: Int): Array<T> {
        return [];
    }

    public inline extern static function slice<T>(arr: Array<T>, pos: Int, ?end: Int): Array<T> {
        return [];
    }

    public inline extern static function remove<T>(arr: Array<T>, x: T): Bool {
        return false;
    }

    public inline extern static function indexOf<T>(arr: Array<T>, x: T, ?fromIndex: Int): GoInt {
        return 0;
    }

    public inline extern static function lastIndexOf<T>(arr: Array<T>, x: T, ?fromIndex: Int): GoInt {
        return 0;
    }

    @:pure public inline extern static function contains<T>(arr: Array<T>, x: T): Bool {
        return false;
    }

    public inline extern static function join<T>(arr: Array<T>, separator: String): String {
        return "";
    }

    public inline extern static function map<X, Y>(arr: Array<X>, f: X->Y): Array<Y> {
        return [];
    }

    public inline extern static function filter<T>(arr: Array<T>, f: T->Bool): Array<T> {
        return [];
    }

    public inline extern static function sort<T>(arr: Array<T>, f: T->T->Int): Void {
        return;
    }

    public inline extern static function resize<T>(arr: Array<T>, length: Int): Void {
        return;
    }

    public inline extern static function toString<T>(arr: Array<T>): String {
        return Std.string(arr);
    }

}