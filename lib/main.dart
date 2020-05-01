import 'package:flutter/material.dart';
import 'package:foodie/pages/home.dart';
import 'package:foodie/data/data.dart';

void main() => runApp(Myapp());

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey.shade50,
        primaryColor: Colors.deepOrange,
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.account_circle,
              size: 30,
              color: Colors.white,
            ),
            onPressed: null,
          ),
          title: Text(
            'Food Delivery',
          ),
          actions: <Widget>[
            FlatButton(
              child: Text(
                'Cart (${currentUser.cart.length})',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
              onPressed: null,
            ),
          ],
          centerTitle: true,
        ),
        body: HomePage(),
      ),
    );
  }
}
