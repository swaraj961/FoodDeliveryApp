import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:foodie/models/restaurant.dart';

double rating = 3.0;

class RestaurantScreen extends StatefulWidget {
  final Restaurant restaurantinfo;

  RestaurantScreen({this.restaurantinfo});
  @override
  _RestaurantScreenState createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
