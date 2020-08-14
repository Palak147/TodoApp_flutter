import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  final Function _reloadData;

  ErrorScreen(this._reloadData);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text('Something went wrong'),
          Text('Give it another try'),
          FlatButton(
            child: Text(
              'RELOAD',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            onPressed: _reloadData,
          ),
        ],
      ),
    );
  }
}
