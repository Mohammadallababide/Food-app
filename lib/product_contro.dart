import 'package:flutter/material.dart';
class ControlProduct extends StatelessWidget {
  final Function addProduct;
  ControlProduct(this.addProduct);
  @override
  Widget build(BuildContext context) {
    return  RaisedButton(
            color: Theme.of(context).primaryColor,
            onPressed: () {
             addProduct({'title':'Chocleat','image':'assets/food.jpg'});
            },
            child: Text("Add Product"),
          );
  }
}