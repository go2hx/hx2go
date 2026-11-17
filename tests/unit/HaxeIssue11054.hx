package unit;
private class MathRobot extends Robot<Int> {
	override function performTask(listener:Int) {
		super.performTask(listener);
	}
}

class Robot<T> {
	public function new() {}

	public function performTask(listener:T) {}
}



function main() {}
