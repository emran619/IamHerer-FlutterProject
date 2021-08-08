// import 'dart:convert';
// import 'package:PROJECT/models/http_exception.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class Product {
//   final String id;
//   final String title;
//   final String description;
//   final double price;
//   final String imageUrl;
//   bool isFavorite = false;
//   Product({
//     @required this.id,
//     @required this.title,
//     @required this.description,
//     @required this.price,
//     @required this.imageUrl,
//     this.isFavorite = false,
//   });
//   bool getfav() {
//     return isFavorite;
//   }
// }

// class Products extends Product with ChangeNotifier {
//   List<Product> _items = [
//     // Product(
//     //   id: '1',
//     //   title: 'Red Shirt',
//     //   description: 'A red shirt - it is pretty red!',
//     //   price: 29.99,
//     //   imageUrl: 'img/t-shirt.jpg',
//     // ),
//     // Product(
//     //   id: '2',
//     //   title: 'Trousers',
//     //   description: 'A nice pair of trousers.',
//     //   price: 59.99,
//     //   imageUrl: 'img/bntlon.jpg',
//     // ),
//     // Product(
//     //   id: '3',
//     //   title: 'Yellow Scarf',
//     //   description: 'Warm and cozy - exactly what you need for the winter.',
//     //   price: 19.99,
//     //   imageUrl: 'img/lhshe.jpg',
//     // ),
//     // Product(
//     //   id: '4',
//     //   title: 'A Pan',
//     //   description: 'Prepare any meal you want.',
//     //   price: 49.99,
//     //   imageUrl: 'img/mklaee.jpg',
//     // ),
//   ];
//   void _setFavValue(bool newValue){
//     isFavorite = newValue;
//     notifyListeners();
//   }
//   Future<void> toggleFavoritesStatus() async{
//     final oldStatus = isFavorite;
//     isFavorite = !isFavorite;
//     notifyListeners();
//     final url = 'https://shop-project-c1023.firebaseio.com/products/$id.json';
//     try{
//       final response = await http.patch(url,
//       body: json.encode({
//         'isFavorite':isFavorite
//       })
//       );
//       if(response.statusCode >=400){
//         _setFavValue(oldStatus);
//       }
//     }catch(error){
//       _setFavValue(oldStatus);
//     }
//     //هاد التابع مالح يشتغل لاني حاطت الشبنج نوتيفاير لل برودكتس مو لل برودكت
//   }

//   List<Product> get items {
//     return [..._items];
//   }

//   List<Product> get favoritesItems {
//     return _items.where((element) => element.isFavorite).toList();
//   }

//   Future<void> fetchAndSetProducts() async {
//     const url = 'https://shop-project-c1023.firebaseio.com/products.json';
//     try {
//       final response = await http.get(url);
//       print(json.decode(response.body));
//       final extractedData = json.decode(response.body) as Map<String, dynamic>;
//       final List<Product> loadedProducts = [];
//       extractedData.forEach((prodId, prodData) {
//         loadedProducts.add(Product(
//           id: prodId,
//           title: prodData['title'],
//           description: prodData['description'],
//           price: prodData['price'],
//           isFavorite: prodData['isFavorite'],
//           imageUrl: prodData['imageUrl'],
//         ));
//       });
//       _items = loadedProducts;
//       notifyListeners();
//     } catch (error) {
//       throw (error);
//     }
//   }

//   Future<void> addProduct(Product product) async {
//     const url = 'https://shop-project-c1023.firebaseio.com/products.json';
//     try {
//       final response = await http.post(url,
//           body: json.encode({
//             'title': product.title,
//             'description': product.description,
//             'imageUrl': product.imageUrl,
//             'price': product.price,
//             'isFavorite': product.isFavorite
//           }));

//       final newproduct = Product(
//           id: json.decode(response.body)['name'],
//           title: product.title,
//           description: product.description,
//           price: product.price,
//           imageUrl: product.imageUrl);
//       _items.add(newproduct);
//       notifyListeners();
//     } catch (error) {
//       print(error);
//       throw error;
//     }
//   }

//   Product findById(String id) {
//     return _items.firstWhere((element) => element.id == id);
//   }

//   Future<void> updateProduct(String id, Product newProduct) async {
//     final prodIndex = _items.indexWhere((prod) => prod.id == id);
//     // print('in method $prodIndex');
//     // print('the mother fucking id is $id');
//     // print(prodIndex);
//     if (prodIndex != null) {
//       final url = 'https://shop-project-c1023.firebaseio.com/products/$id.json';
//       await http.patch(url,
//           body: json.encode({
//             'title': newProduct.title,
//             'description': newProduct.description,
//             'imageUrl': newProduct.imageUrl,
//             'price': newProduct.price,
//           }));
//       _items[prodIndex] = newProduct;
//       notifyListeners();
//     } else {
//       print('Error in update method in file products');
//     }
//   }

//   Future<void> deleteproduct(String id) async{
//     final url = 'https://shop-project-c1023.firebaseio.com/products/$id.json';
//     final existingProductId= _items.indexWhere((prod) => prod.id == id);
//     var existingProduct = _items[existingProductId];

//     _items.removeAt(existingProductId);
//     notifyListeners();

//     final response = await http.delete(url);
//     if(response.statusCode >= 400){
//       _items.insert(existingProductId,existingProduct);
//       notifyListeners();
//       throw HttpException('Could not delete product');
//     }
//     existingProduct = null;
//   }
// }
