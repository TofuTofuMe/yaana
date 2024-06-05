import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 500,
              child: ListView(
                padding: EdgeInsets.fromLTRB(0.0, 32.0, 0.0, 16.0),
                children: [],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
