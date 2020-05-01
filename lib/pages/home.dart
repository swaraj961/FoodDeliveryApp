import 'package:flutter/material.dart';
import 'package:foodie/widgets/recent_orders.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(25),
          child: TextField(
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              contentPadding:
                  EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              hintText: '\t\tSearch Food or Restaudrants',
              hintStyle: TextStyle(
                fontSize: 18,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(width: 0.8), //thickness of border
              ),
              prefix: Padding(
                child: Icon(Icons.search),
                padding: EdgeInsets.symmetric(horizontal: 7),
              ),
              suffixIcon: Icon(Icons.clear),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                    width: 0.8, color: Theme.of(context).primaryColor),
                //thickness of border
              ),
            ),
          ),
        ),
        RecentOrders(),
      ],
    );
  }
}
