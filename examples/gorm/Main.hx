import go.Os;
import go.gorm_io.gorm.Model;
import go.gorm_io.Gorm;
import go.gorm_io.driver.Sqlite;
import sys.FileSystem;

function main() {
    if (FileSystem.exists("test.db")) {
        FileSystem.deleteFile("test.db");
    }

    var db = Gorm.open(Sqlite.open("test.db")).sure();
    db.autoMigrate(new Product());

    db.create(new Product("D42", 100));

    var product = new Product();
    db.first(product, 1); // find product with integer primary key
    db.first(product, "hx_field_code = ?", "D42");

    // update single field
    db.model(product).update("hx_field_price", 200);
    // update multiple fields
    db.model(product).updates(new Product("F42", 200));
    db.model(product).updates({hx_field_price: 200, hx_field_code: "F43"});
    // delete
    db.delete(product, 1);

}

@:structInit
class Product {
    @:go.Tag('gorm:"embedded"')
    public var model:Model;
    public var code:String;
    public var price:UInt;
    public function new(code="", price=0) {
        this.code = code;
        this.price = price;
    }
}