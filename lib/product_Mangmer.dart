import 'package:flutter/material.dart';
import './products.dart';
import './product_contro.dart';

class ProductManger extends StatelessWidget {
  final List<Map<String , String>> products;
  final Function addProduct;
  final Function deleteProduct;

  const ProductManger(this.products, this.addProduct, this.deleteProduct);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(10.0),
          // here we pass _addProduct to the ControlProduct to reference to the _addProduct function exsit in
          // the product Manger class
          child: ControlProduct(addProduct),
        ),
        Expanded(
          child: Products(
            products,deleteProduct:deleteProduct
          ),
        ),
      ],
    );
  }
}