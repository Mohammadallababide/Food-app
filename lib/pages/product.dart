import 'package:flutter/material.dart';
import 'dart:async';

class ProductPage extends StatelessWidget {
  final String title;
  final String imageUrl;
  ProductPage(this.title, this.imageUrl);
  _showWarningDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Are you sure?'),
            content: Text('This action can not be undone'),
            actions: <Widget>[
              FlatButton(
                child: Text('Discard'),
                onPressed: () {
                  // for close Dialog ...
                  Navigator.pop(context);
                },
              ),
              FlatButton(
                child: Text('Continue'),
                onPressed: () {
                  // for close Dialog ...
                  Navigator.pop(context);
                  // for Delete and pass value to the futear method (to tell them to delete)
                  Navigator.pop(context, true);
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context, false);
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(imageUrl),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Text(title),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: RaisedButton(
                color: Theme.of(context).accentColor,
                child: Text('Delete'),
                onPressed: () => _showWarningDialog(context),
              ),
            )
          ],
        ),
      ),
    );
  }
}
