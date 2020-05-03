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
                          onTap: () {},
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
    double totalprice = 0;
    currentUser.cart.forEach((Order order) =>
        totalprice = totalprice + order.food.price * order.quantity);

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart(${currentUser.cart.length})'),
        centerTitle: true,
      ),
      body: ListView.separated(
        itemCount: currentUser.cart.length + 1,
        itemBuilder: (context, index) {
          if (index < currentUser.cart.length) {
            Order orderfood = currentUser.cart[index];

            return _builditem(orderfood);
          }
          return Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Estimate Delivery time :',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      '25 min',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Total Cost :',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "₹" + totalprice.toStringAsFixed(2),
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.green.shade700),
                    ),
                  ],
                ),
                SizedBox(
                  height: 100,
                ),
              ],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => Divider(
          height: 2,
          color: Colors.grey,
        ),
      ),
      bottomSheet: Container(
        height: 80,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, -2),
              blurRadius: 7.0,
            ),
          ],
        ),
        child: FlatButton(
          onPressed: () {},
          child: Text(
            'CHECKOUT',
            style: TextStyle(
                letterSpacing: 1.5,
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.white),
          ),
        ),
      ),
    );
  }
}
