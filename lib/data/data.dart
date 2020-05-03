import '../models/food.dart';
import '../models/order.dart';
import '../models/restaurant.dart';
import '../models/user.dart';

// Food
final _burrito =
    Food(imageUrl: 'assets/images/burrito.jpg', name: 'Burrito', price: 100.0);
final _steak =
    Food(imageUrl: 'assets/images/steak.jpg', name: 'Steak', price: 130.0);
final _pasta =
    Food(imageUrl: 'assets/images/pasta.jpg', name: 'Pasta', price: 170.0);
final _ramen =
    Food(imageUrl: 'assets/images/ramen.jpg', name: 'Ramen', price: 80.0);
final _pancakes =
    Food(imageUrl: 'assets/images/pancakes.jpg', name: 'Pancakes', price: 120.0);
final _burger =
    Food(imageUrl: 'assets/images/burger.jpg', name: 'Burger', price: 150.0);
final _pizza =
    Food(imageUrl: 'assets/images/pizza.jpg', name: 'Pizza', price: 400.0);
final _salmon = Food(
    imageUrl: 'assets/images/salmon.jpg', name: 'Salmon Salad', price: 50.0);

// Restaurants
final _restaurant0 = Restaurant(
  imageUrl: 'assets/images/restaurant0.jpg',
  name: 'Restaurant 0',
  address: 'Sector-2,Rk Puram, New Delhi',
  rating: 5,
  menu: [_burrito, _steak, _pasta, _ramen, _pancakes, _burger, _pizza, _salmon],
);
final _restaurant1 = Restaurant(
  imageUrl: 'assets/images/restaurant1.jpg',
  name: 'Restaurant 1',
  address: 'Sector-2,Rk Puram, New Delhi',
  rating: 4,
  menu: [_steak, _pasta, _ramen, _pancakes, _burger, _pizza],
);
final _restaurant2 = Restaurant(
  imageUrl: 'assets/images/restaurant2.jpg',
  name: 'Restaurant 2',
  address: 'Sector-2,Rk Puram, New Delhi',
  rating: 4,
  menu: [_steak, _pasta, _pancakes, _burger, _pizza, _salmon],
);
final _restaurant3 = Restaurant(
  imageUrl: 'assets/images/restaurant3.jpg',
  name: 'Restaurant 3',
  address: 'Sector-2,Rk Puram, New Delhi',
  rating: 2,
  menu: [_burrito, _steak, _burger, _pizza, _salmon],
);
final _restaurant4 = Restaurant(
  imageUrl: 'assets/images/restaurant4.jpg',
  name: 'Restaurant 4',
  address: 'Sector-2,Rk Puram, New Delhi',
  rating: 3,
  menu: [_burrito, _ramen, _pancakes, _salmon],
);

final List<Restaurant> restaurants = [
  _restaurant0,
  _restaurant1,
  _restaurant2,
  _restaurant3,
  _restaurant4,
];

// User
final currentUser = User(
  name: 'Rebecca',
  orders: [
    Order(
      date: 'Nov 10, 2019',
      food: _steak,
      restaurant: _restaurant2,
      quantity: 1,
    ),
    Order(
      date: 'Nov 8, 2019',
      food: _ramen,
      restaurant: _restaurant0,
      quantity: 3,
    ),
    Order(
      date: 'Nov 5, 2019',
      food: _burrito,
      restaurant: _restaurant1,
      quantity: 2,
    ),
    Order(
      date: 'Nov 2, 2019',
      food: _salmon,
      restaurant: _restaurant3,
      quantity: 1,
    ),
    Order(
      date: 'Nov 1, 2019',
      food: _pancakes,
      restaurant: _restaurant4,
      quantity: 1,
    ),
  ],
  cart: [
    Order(
      date: 'Nov 11, 2019',
      food: _burger,
      restaurant: _restaurant2,
      quantity: 2,
    ),
    Order(
      date: 'Nov 11, 2019',
      food: _pasta,
      restaurant: _restaurant2,
      quantity: 1,
    ),
    Order(
      date: 'Nov 11, 2019',
      food: _salmon,
      restaurant: _restaurant3,
      quantity: 1,
    ),
    Order(
      date: 'Nov 11, 2019',
      food: _pancakes,
      restaurant: _restaurant4,
      quantity: 3,
    ),
    Order(
      date: 'Nov 11, 2019',
      food: _burrito,
      restaurant: _restaurant1,
      quantity: 2,
    ),
  ],
);
