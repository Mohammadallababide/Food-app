import 'package:flutter/material.dart';
class Products extends StatelessWidget {
  final List<Map<String, String>> products;
  final Function deleteProduct;
  Products(this.products, {this.deleteProduct});
  Widget _buildProductItem(BuildContext context, int index) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(products[index]['image']),
          Text(products[index]['title']),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                child: Center(
                  child: Text('Detiales'),
                ),
                onPressed: () => Navigator.pushNamed<bool>(
                        context, '/product/' + index.toString())
                    .then((bool value) {
                  if (value) {
                    deleteProduct(index);
                  }
                }),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildProductList() {
    Widget productCard;
    if (products.length > 0) {
      productCard = ListView.builder(
        itemBuilder: _buildProductItem,
        itemCount: products.length,
      );
    } else {
      productCard = Center(
        child: Text('No Product Found Please add some'),
      );
    }
    return productCard;
  }

  @override
  Widget build(BuildContext context) {
    // استخدنا هذا النوع من listViwe
    // وذلك للحفاظ على الذاكرة ولتقديم أدء افضل
    //  حيث أن هذا الطريقة تحذف العناصر التي لا ترى
    //  وبتالي لإانها تحجز في الذكرة فقط ما يظهر على الشاشة
    //  وهذا ما يجعلها افضل من ListViwe العادية
    return _buildProductList();
  }
}
