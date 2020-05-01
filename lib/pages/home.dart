import 'package:flutter/material.dart';
import 'package:foodie/data/data.dart';
import 'package:foodie/models/restaurant.dart';
import 'package:foodie/widgets/recent_orders.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double rating = 3.0;
  buildRestaudrants() {
    List<Widget> restaurantslist = [];

    restaurants.forEach(
      (Restaurant restE) {
        //instance 0f restaurant model
        restaurantslist.add(
          Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 2),
            decoration: BoxDecoration(
              // boxShadow: [BoxShadow(color:Colors.grey,offset: Offset(10, 10),blurRadius: 10)],
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(width: 1, color: Colors.grey.shade200),
            ),
            child: Row(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image(
                    fit: BoxFit.cover,
                    height: 150,
                    width: 150,
                    image: AssetImage(restE.imageUrl),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(15),
                    child: Column(
                      children: <Widget>[
                        Text(
                          restE.name,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        SmoothStarRating(
                          starCount: 5,
                          rating: rating,
                          onRatingChanged: (newrating) {
                            setState(() {
                              rating = newrating;
                            });
                          },
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(restE.address,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                            overflow: TextOverflow.ellipsis),
                        SizedBox(
                          height: 4,
                        ),
                        Text('1.0 km away',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500),
                            overflow: TextOverflow.ellipsis),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );

    return Column(
      children: restaurantslist,
    );
  }

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
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(Icons.near_me),
                  SizedBox(width: 5),
                  Text(
                    'Near by Restaurants',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        letterSpacing: 1.2),
                  ),
                ],
              ),
              buildRestaudrants(),
            ],
          ),
        )
      ],
    );
  }
}
