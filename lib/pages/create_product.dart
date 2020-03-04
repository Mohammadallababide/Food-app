import 'package:flutter/material.dart';

class ProductCreatePage extends StatelessWidget {
  _showSaveModel(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) => Center(
        child: Text('This is the Model'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        color: Theme.of(context).accentColor,
        child: Text('Save'),
        onPressed: () => _showSaveModel(context),
      ),
    );
  }
}
