import '../../../data/models/product_model.dart';
import 'constants.dart';

class DummyHelper {
  const DummyHelper._();

  static List<ProductModel> products = [
    ProductModel(
      id: 1,
      image: Constants.product1,
      name: 'The Basic Tee',
      stock: 100,
      quantity: 0,
      price: 11000,
      rating: 4.5,
      reviews: '1.2k reviews',
      size: 'M',
      isFavorite: false,
    ),
    ProductModel(
        id: 2,
        image: Constants.product2,
        name: 'The Statement Skirt',
        stock: 100,
        quantity: 0,
        price: 11000,
        rating: 4.4,
        reviews: '10k reviews',
        size: 'M',
        isFavorite: false),
    ProductModel(
        id: 3,
        image: Constants.product3,
        name: 'The Luxe Sweater',
        stock: 100,
        quantity: 0,
        price: 20000,
        rating: 4.3,
        reviews: '22k reviews',
        size: 'M',
        isFavorite: false),
    ProductModel(
        id: 4,
        image: Constants.product4,
        name: 'The Statement Top',
        stock: 100,
        quantity: 0,
        price: 35000,
        rating: 4.2,
        reviews: '3.4k reviews',
        size: 'M',
        isFavorite: false),
    ProductModel(
        id: 5,
        image: Constants.product5,
        name: 'The Casual Tank',
        stock: 100,
        quantity: 0,
        price: 42000,
        rating: 4.1,
        reviews: '2.6k reviews',
        size: 'M',
        isFavorite: false),
    ProductModel(
        id: 6,
        image: Constants.product1,
        name: 'The Denim Jean',
        stock: 100,
        quantity: 0,
        price: 50000,
        rating: 4.0,
        reviews: '5.8k reviews',
        size: 'M',
        isFavorite: false),
  ];
}

List<Map<String, dynamic>> users = [
  {
    "id": 1,
    "email": "george.bluth@reqres.in",
    "name": "George Bluth",
    "photo": "https://reqres.in/img/faces/1-image.jpg"
  },
  {
    "id": 2,
    "email": "janet.weaver@reqres.in",
    "name": "Janet Weaver",
    "photo": "https://reqres.in/img/faces/2-image.jpg"
  },
  {
    "id": 3,
    "email": "emma.wong@reqres.in",
    "name": "Emma Wong",
    "photo": "https://reqres.in/img/faces/3-image.jpg"
  },
  {
    "id": 4,
    "email": "eve.holt@reqres.in",
    "name": "Eve Holt",
    "photo": "https://reqres.in/img/faces/4-image.jpg"
  },
  {
    "id": 5,
    "email": "charles.morris@reqres.in",
    "name": "Charles Morris",
    "photo": "https://reqres.in/img/faces/5-image.jpg"
  },
  {
    "id": 6,
    "email": "tracey.ramos@reqres.in",
    "name": "Tracey Ramos",
    "photo": "https://reqres.in/img/faces/6-image.jpg"
  }
];
