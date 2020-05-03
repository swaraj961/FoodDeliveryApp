import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:foodie/models/restaurant.dart';
import 'package:foodie/models/food.dart';

double rating = 3.0;

class RestaurantScreen extends StatefulWidget {
  final Restaurant restaurantinfo;

  RestaurantScreen({this.restaurantinfo});
  @override
  _RestaurantScreenState createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  buildMenuItem(Food menuitem) {
    return Center(
      child: Stack(
        children: <Widget>[
          Container(
            height: 175,
            width: 175,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.topLeft,
                  colors: [
                    Colors.black.withOpacity(0.3),
                    Colors.black87.withOpacity(0.3),
                    Colors.black54.withOpacity(0.3),
                    Colors.black38.withOpacity(0.3),
                  ]),
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                  image: AssetImage(menuitem.imageUrl), fit: BoxFit.cover),
            ),
          ),
          Container(
            //top of previous container

            height: 175,
            width: 175,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.topLeft,
                colors: [
                  Colors.black.withOpacity(0.3),
                  Colors.black87.withOpacity(0.3),
                  Colors.black54.withOpacity(0.3),
                  Colors.black38.withOpacity(0.3),
                ],
                stops: [
                  //posn of each gradient colors
                  0.1, 0.4, 0.6, 0.9
                ],
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  menuitem.name,
                  style: TextStyle(
                      letterSpacing: 1.2,
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                Text(menuitem.price.toString() + "\$",
                    style: TextStyle(
                        letterSpacing: 1.2,
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w500)),
              ],
            ),
          ),
          Positioned(
            bottom: 10,
            right: 10,
            child: Container(
              width: 48,
              // margin: EdgeInsets.only(right: 20),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(30),
              ),

              child: IconButton(
                icon: Icon(Icons.add),
                color: Colors.white,
                onPressed: () {},
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            //t to put any widget at the top
            children: <Widget>[
              Hero(
                tag: widget.restaurantinfo.imageUrl,
                child: Image(
                  height: 220,
                  width: MediaQuery.of(context).size.width,
                  image: AssetImage(widget.restaurantinfo.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 45),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                        size: 30,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                    IconButton(
                        icon: Icon(
                          Icons.favorite,
                          color: Theme.of(context).primaryColor,
                          size: 30,
                        ),
                        onPressed: null)
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      widget.restaurantinfo.name,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text('1.0 km away',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w400),
                        overflow: TextOverflow.ellipsis),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                SmoothStarRating(
                  starCount: 5,
                  rating: rating,
                  onRatingChanged: (newrating) {
                    setState(
                      () {
                        rating = newrating;
                      },
                    );
                  },
                ),
                SizedBox(
                  height: 5,
                ),
                Text(widget.restaurantinfo.address,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    overflow: TextOverflow.ellipsis),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SizedBox(
                      height: 50,
                      width: 150,
                      child: FlatButton(
                        onPressed: () {},
                        child: Text('Reviews',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis),
                        splashColor: Colors.orangeAccent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      width: 150,
                      child: FlatButton(
                        onPressed: () {},
                        child: Text('Contact',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis),
                        splashColor: Colors.orangeAccent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(
                    'Menu',
                    style: TextStyle(
                        letterSpacing: 1.2,
                        fontWeight: FontWeight.w600,
                        fontSize: 22,
                        color: Colors.grey.shade700,
                        decoration: TextDecoration.underline),
                  ),
                ),
                SizedBox(height: 5),
              ],
            ),
          ),
          Expanded(
            child: GridView.count(
              padding: EdgeInsets.all(10),
              crossAxisCount: 2,
              children: List.generate(
                widget.restaurantinfo.menu.length,
                (index) {
                  Food food = widget.restaurantinfo.menu[index];
                  return buildMenuItem(food);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
