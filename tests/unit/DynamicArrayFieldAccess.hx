package unit;

typedef CF = {
	var name:String;
};

function main() {
    var acf:Dynamic = new Array<CF>();
    acf.push({name: "example"});
    acf.shift();
}