import go.github_com.guptarohit.Asciigraph;

function main() {
	var data:Array<Float> = [3, 4, 9, 6, 2, 4, 5, 8, 5, 10, 2, 7, 2, 5, 6];
	var graph:String = Asciigraph.plot(data);
	trace("\n" + graph);
}