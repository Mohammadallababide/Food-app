import 'package:flutter/material.dart';
import 'package:test_example/pages/product.dart';
import './pages/products.dart';
import './pages/product_admin.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Map<String, String>> _products = [];

  _addProduct(Map<String, String> element) {
    setState(() {
      _products.add(element);
    });
  }

  _deleteProduct(int index) {
    setState(() {
      _products.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        accentColor: Colors.deepPurple,
        primarySwatch: Colors.deepOrange,
      ),
      // normal route page
      routes: {
        '/': (BuildContext context) =>
            Products(_products, _addProduct, _deleteProduct),
        '/admin': (BuildContext context) => ProductAdminPage(),
      },
      // route page fo the page can not regester in the routes 
      onGenerateRoute: (RouteSettings settings) {
        final List<String> pathElements = settings.name.split('/');
        if (pathElements[0] == ' ') {
          return null;
        }
        if (pathElements[1] == 'product') {
          final int index = int.parse(pathElements[2]);
          return MaterialPageRoute<bool>(
            builder: (BuildContext context) => ProductPage(
                _products[index]['title'], _products[index]['image']),
          );
        }
        return null;
      },
      // for unknow rout like null or not found page => go to the start page 
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          builder: (context) =>
              Products(_products, _addProduct, _deleteProduct),
        );
      },
    );
  }
}
