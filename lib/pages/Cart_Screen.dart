import 'package:flutter/material.dart';
import 'package:foodie/data/data.dart';
import 'package:foodie/models/order.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  _builditem(Order orderitem) {
    return Container(
      margin: EdgeInsets.all(20),
      height: 160,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: <Widget>[
          Container(
            width: 150,
            decoration: BoxDecoration(
                color: Colors.redAccent,
                image: DecorationImage(
                  image: AssetImage(orderitem.food.imageUrl),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(20)),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
// color: Colors.white,
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    orderitem.food.name,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 10),
                  Text(orderitem.restaurant.name,
                      style: TextStyle(
                        fontSize: 15,
                      ),
                      overflow: TextOverflow.ellipsis),
                  SizedBox(height: 10),
                  Text(orderitem.quantity.toString(),
                      overflow: TextOverflow.ellipsis),
                  SizedBox(height: 10),
                  Container(
                    //  padding: EdgeInsets.all(5),
                    width: 100,
                    height: 30,

                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        GestureDetector(
                          onTap: null,
                          child: Text('+',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Theme.of(context).primaryColor),
                              overflow: TextOverflow.ellipsis),
                        ),
                        GestureDetector(
                          onTap: null,
                          child: Text(orderitem.quantity.toString(),
                              style: TextStyle(
                                fontSize: 20,
                              ),
                              overflow: TextOverflow.ellipsis),
                        ),
                        GestureDetector(
                          onTap: null,
                          child: Text('-',
                              style: TextStyle(
                                  fontSize: 25,
                                  color: Theme.of(context).primaryColor),
                              overflow: TextOverflow.ellipsis),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: Text(
              ("₹" +
                  '${orderitem.quantity * orderitem.food.price}'), //beacuse of int add''
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart(${currentUser.cart.length})'),
        centerTitle: true,
      ),
      body: ListView.separated(
        itemCount: currentUser.cart.length,

        itemBuilder: (context, index) {
          Order orderfood = currentUser.cart[index];

          return _builditem(orderfood);
        },
        //Container(
        //   margin: EdgeInsets.all(10),
        //   height: 100,
        //   width: MediaQuery.of(context).size.width,
        //   color: Colors.redAccent,
        // ),
        separatorBuilder: (BuildContext context, int index) => Divider(
          height: 2,
          color: Colors.grey,
        ),
      ),
    );
  }
}
