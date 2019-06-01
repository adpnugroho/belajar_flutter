import 'package:flutter/material.dart';
import './products.dart';
import './product_control.dart';
class ProductManager extends StatefulWidget {
  final Map<String, dynamic> startingProduct; //Variabel untuk parameter constructor
  ProductManager({this.startingProduct}){ //Pengisian variabel constructor
  // ProductManager({this.startingProduct}){ //Pengisian variabel constructor Tanpa Default Value
  // ProductManager(this.startingProduct){ //Pengisian variabel constructor Alternatif
    print('[ProductManaget Widget] Constructor');
  }
  @override
  State<StatefulWidget> createState() {
    print('[ProductManaget Widget] createState()');
    return _ProductManagerState(); //Memanggil State Class
  }
}

class _ProductManagerState extends State<ProductManager> {
  List<Map<String, dynamic>> _products = []; //Variabel dengan nilai default awal
  // List<String> _products = const ['Deskripsi Produk']; //Const, tidak bisa menambahkan value
  // Final List<String> _products = ['Deskripsi Produk']; //Final, tidak bisa assign value baru tetapi masih bisa ditambah valuenya dengan _products.add()
  

  @override
  void initState() { //Method yang dijalankan pertama kali saat state dibuat
    print('[ProductManaget State] initState()');
    super.initState(); //Rekomendasi Code Style
    if(widget.startingProduct != null){ //Cek apakah Constructor Null atau Tidak
      _products.add(widget.startingProduct); //Menambah List p roduct dengan parameter constructor dengan bantuan state widget.*****
    }
  }

  @override
  void didUpdateWidget(ProductManager oldWidget) {
    print('[ProductManaget State] didUpdateWidget()');
    super.didUpdateWidget(oldWidget);
  }

  void _updateProduct(Map<String, dynamic> product){
    setState(() {
      //StatefulWidget wajib menggunakan setState untuk data yang berubah ubah
      _products.add(product);
    });
  }

  void _deleteProduct(int index){
    setState(() {
      _products.removeAt(index);
    });
  }
  //Lifecycle hook State
  //Stateful
  // - Input Data => Widget - Internal State => Render UI

  //Stateful Widget
  // -Constructor Function => initState() => build() => setState() => didUpdateWidget() => build()

  @override
  Widget build(BuildContext context) {
    print('[ProductManaget State] build()');
    return Column(
      children: <Widget>[
        Container(
          child: ProductControl(_updateProduct),
          margin: EdgeInsets.all(5), //Margin dari container untuk Button
        ),
        // Products() //Memanggil WidgetList Product Tanpa Value Constructor
        Expanded(
          child: Products(_products,deleteProduct:_deleteProduct)
        ) //Memanggil WidgetList Product
      ],
    );
  }
}
