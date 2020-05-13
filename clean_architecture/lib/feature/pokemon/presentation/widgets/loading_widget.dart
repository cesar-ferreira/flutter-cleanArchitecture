import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {

  LoadingWidget();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
            child: CircularProgressIndicator()
        ),
      ],
    );
  }
}