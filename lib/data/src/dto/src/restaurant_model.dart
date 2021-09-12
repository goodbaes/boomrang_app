import 'dart:convert';

class RestaurantModel {
  final int id;
  final String name;
  final String address;
  final String phoneNumber;
  final String email;
  final bool isOpen;
  int? averageCheck;
  final String logo;
  final String preview;
  final double rating;
  final List<ResCatsModel> restaurantCategories;
  final List<FoodModel> foods;

  RestaurantModel({
    required this.id,
    required this.name,
    required this.address,
    required this.phoneNumber,
    required this.email,
    required this.isOpen,
    this.averageCheck,
    required this.logo,
    required this.rating,
    required this.preview,
    required this.restaurantCategories,
    required this.foods,
  });

  RestaurantModel.fromResponse(Map<String, dynamic> json): 
    id = json['id'],
    name = json['name'],
    address = json['address'],
    phoneNumber = json['phone_number'],
    email = json['email'],
    isOpen = json['is_open'],
    averageCheck = json['average_check'],
    logo = json['logo'],
    rating = (json['rating'] as num).toDouble(),
    preview = json['preview'],
    // restaurantCategories = [],
    // foods = [];
    restaurantCategories = json['restaurant_categories'].map((e) => ResCatsModel.fromResponse(e)).toList().cast<ResCatsModel>(),
    foods = json['foods']
      .map((e) => FoodModel.fromResponse(e)).toList().cast<FoodModel>();

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'address': address,
    'phone_number': phoneNumber,
    'email': email,
    'is_open': isOpen,
    'average_check': averageCheck,
    'logo': logo,
    'rating': rating,
    'preview': preview,
    'restaurant_categories': jsonEncode(restaurantCategories),
    'foods': jsonEncode(foods),
  };

  RestaurantModel.fromJson(Map<String, dynamic> json):
    id = json['id'],
    name = json['name'],
    address = json['address'],
    phoneNumber = json['phone_number'],
    email = json['email'],
    isOpen = json['is_open'],
    averageCheck = json['average_check'],
    logo = json['logo'],
    rating = json['rating'],
    preview = json['preview'],
    restaurantCategories = (json['restaurant_categories'] as List<Map<String, dynamic>>)
      .map((e) => ResCatsModel.fromJson(e)).toList(),
    foods = (json['foods'] as List<Map<String, dynamic>>)
      .map((e) => FoodModel.fromJson(e)).toList();
}

class ResCatsModel{
  final int id;
  final String name;

  ResCatsModel({
    required this.id,
    required this.name,
  });

  ResCatsModel.fromResponse(Map<String, dynamic> json):
    id = json['id'],
    name = json['name'];

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
  };

  ResCatsModel.fromJson(Map<String, dynamic> json):
    id = json['id'],
    name = json['name'];

}

class FoodModel{
  final int id;
  final String title;
  final String description;
  final String ingredients;
  final String portion;
  final double price;
  final int restaurant;
  final int foodCategory;
  final List<FoodImage> image;

  FoodModel({
    required this.id,
    required this.title,
    required this.description,
    required this.ingredients,
    required this.portion,
    required this.price,
    required this.restaurant,
    required this.foodCategory,
    required this.image,
  });


  FoodModel.fromResponse(Map<String, dynamic> json) :
    id = json['id'],
    title = json['title'],
    description = json['description'],
    ingredients = json['ingredients'],
    portion = json['portion'],
    price = double.parse(json['price']),
    restaurant = json['restaurant'],
    foodCategory = json['food_category'],
    image = json['image'].map((e) => FoodImage.fromResponse(e)).toList().cast<FoodImage>();

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'description': description,
    'ingredients': ingredients,
    'portion': portion,
    'price': price,
    'restaurant': restaurant,
    'food_category': foodCategory,
    'image': jsonEncode(image),
  };

  FoodModel.fromJson(Map<String, dynamic> json):
    id = json['id'],
    title = json['title'],
    description = json['description'],
    ingredients = json['ingredients'],
    portion = json['portion'],
    price = json['price'] ? num.parse(json['price']).toDouble() : 0,
    restaurant = json['restaurant'],
    foodCategory = json['food_category'],
    image = json['image'].map((e) => FoodImage.fromJson(e)).toList().cast<FoodImage>();
}

class FoodImage{
  final int id;
  final String image;
  final int food;

  FoodImage({
    required this.id,
    required this.image,
    required this.food,
  });

  FoodImage.fromResponse(Map<String, dynamic> json) :
    id = json['id'],
    image = json['image'],
    food = json['food'];

  Map<String, dynamic> toJson() => {
    'id': id,
    'image': image,
    'food': food,
  };

  FoodImage.fromJson(Map<String, dynamic> json):
    id = json['id'],
    image = json['image'],
    food = json['food'];
}