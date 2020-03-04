import 'package:flutter/material.dart';
import '../product_Mangmer.dart';

class Products extends StatelessWidget {
  final List<Map<String , String>> products;
  final Function addProduct;
  final Function deleteProduct;
  Products(this.products, this.addProduct, this.deleteProduct);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            AppBar(
              automaticallyImplyLeading: false,
              title: Text('chosse'),
            ),
            ListTile(
              title: Text('Product Manger'),
              onTap: () {
                Navigator.pushReplacementNamed(
                  context,
                 '/admin'
                );
              },
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('food testy'),
      ),
      body: ProductManger(products,addProduct,deleteProduct),
    );
  }
}
