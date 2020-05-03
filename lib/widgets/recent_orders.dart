import 'package:foodie/data/data.dart';
import 'package:foodie/models/order.dart';
import 'package:flutter/material.dart';
import 'package:foodie/splash.dart';

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
        child: Row( // last wapper to spaceb/w
          //main
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                ClipRRect(
                  //rounded image corners
                  borderRadius: BorderRadius.circular(12),
                  child: Image(
                    height: 100,
                    width: 100,
                    image: AssetImage(order.food.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            Expanded(
                          child: Container(
                //wrapped with it not padding due to button and lot letting  text to touch the button
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
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      order.restaurant.name,
                      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      order.date,
                      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: 48,
              margin: EdgeInsets.only(right: 20),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(30),
                
              ),
              child: IconButton(
                  icon: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  onPressed: (){
// Navigator.push(context, MaterialPageRoute(builder: (context)=>Splashscreen(),),);
                  }),
            ),
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
         physics: BouncingScrollPhysics(), //bouncing effect
            
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
