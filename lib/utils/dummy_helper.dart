import '../data/models/product_model.dart';
import 'constants.dart';

class DummyHelper {
  static List<ProductModel> products = [
    ProductModel(
        id: 1,
        image: Constants.product1,
        name: 'The Basic Tee',
        stock: 100,
        quantity: 0,
        price: 11000,
        description: ""),
    ProductModel(
        id: 2,
        image: Constants.product2,
        name: 'The Statement Skirt',
        stock: 100,
        quantity: 0,
        price: 11000,
        description: ""),
    ProductModel(
        id: 3,
        image: Constants.product2,
        name: 'The Luxe Sweater',
        stock: 100,
        quantity: 0,
        price: 20000,
        description: ""),
    ProductModel(
        id: 4,
        image: Constants.product2,
        name: 'The Statement Top',
        stock: 100,
        quantity: 0,
        price: 35000,
        description: ""),
    ProductModel(
        id: 5,
        image: Constants.product1,
        name: 'The Casual Tank',
        stock: 100,
        quantity: 0,
        price: 42000,
        description: ""),
    ProductModel(
        id: 6,
        image: Constants.product1,
        name: 'The Denim Jean',
        stock: 100,
        quantity: 0,
        price: 50000,
        description: ""),
  ];
}

List<Map<String, dynamic>> users = [
  {
    "id": 1,
    "email": "george.bluth@reqres.in",
    "name": "George Bluth",
    "photo":
        "https://cdn.pixabay.com/photo/2017/06/13/12/54/profile-2398783_1280.png"
  },
  {
    "id": 2,
    "email": "janet.weaver@reqres.in",
    "name": "Janet Weaver",
    "photo":
        "https://cdn.pixabay.com/photo/2017/06/13/12/54/profile-2398783_1280.png"
  },
  {
    "id": 3,
    "email": "emma.wong@reqres.in",
    "name": "Emma Wong",
    "photo":
        "https://cdn.pixabay.com/photo/2017/06/13/12/54/profile-2398783_1280.png"
  },
  {
    "id": 4,
    "email": "eve.holt@reqres.in",
    "name": "Eve Holt",
    "photo":
        "https://cdn.pixabay.com/photo/2017/06/13/12/54/profile-2398783_1280.png"
  },
  {
    "id": 5,
    "email": "charles.morris@reqres.in",
    "name": "Charles Morris",
    "photo":
        "https://cdn.pixabay.com/photo/2017/06/13/12/54/profile-2398783_1280.png"
  },
  {
    "id": 6,
    "email": "tracey.ramos@reqres.in",
    "name": "Tracey Ramos",
    "photo":
        "https://cdn.pixabay.com/photo/2017/06/13/12/54/profile-2398783_1280.png"
  }
];
