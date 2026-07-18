package unit;

function main() {
	var s = "dkdkdkkdol";
	var s2 = "dkdkdkkdlo";
	var s3 = "ol";
	assert(s.indexOf("o", 1) == 8);
	assert(s2.indexOf("o", 1) == 9);
	assert(s3.indexOf("o", 1) == -1);
}