import 'package:foodie/data/data.dart';
import 'package:foodie/models/order.dart';
import 'package:flutter/material.dart';

class RecentOrders extends StatelessWidget {
  buildRecentOrder(BuildContext context, Order order) => Container(
        margin: EdgeInsets.all(10), //main container
        height: 50,
        width: 320,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.grey.shade300,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ClipRRect(
              //rounded image corners
              borderRadius: BorderRadius.circular(15),
              child: Image(
                height: 100,
                width: 100,
                image: AssetImage(order.food.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
            Container(
              //wrapped with it not padding due to button and lot letting it to touch the button
              margin: EdgeInsets.all(10),
              child: Column(
                //for texts
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    order.food.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    overflow: TextOverflow.ellipsis, //long nameinto dot dot
                  ),
                  Text(
                    order.restaurant.name,
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    order.date,
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            CircleAvatar(
              child: IconButton(
                  icon: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  onPressed: null),
              backgroundColor: Colors.deepOrangeAccent,
            ), // to take entire 100*100
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            'Recent Orders',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 24, letterSpacing: 1.2),
          ),
        ),
        Container(
          //bg container
          height: 120,
          width: double.infinity,
          // color: Colors.blueAccent,
          child: ListView.builder(
            // for iteam returns
            scrollDirection: Axis.horizontal,
            itemCount: currentUser.orders.length,
            itemBuilder: (BuildContext context, int index) {
              Order orders = currentUser.orders[index];

              return buildRecentOrder(context,
                  orders); //custom funcation  as build again returns a container
            },
          ),
        ),
      ],
    );
  }
}