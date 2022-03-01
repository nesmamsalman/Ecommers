// import 'dart:developer';
// import 'package:flutter/material.dart';
// import 'package:grocery_app/data/database_helper.dart';
// import 'package:grocery_app/data/dummy_data.dart';
// import 'package:grocery_app/models/prev/generalProductModel.dart';
// // import 'package:grocery_app/data/database_helper.dart';

// class DatabaseProvider extends ChangeNotifier {
//   TextEditingController searchTitleController = TextEditingController();

//   List<GeneralProductModel> allProducts = [];
//   List<GeneralProductModel> favProducts = [];
//   List<GeneralProductModel> cartProducts = [];
//   List<GeneralProductModel> offerProducts = [];
//   List<GeneralProductModel> mostPopularProducts = [];
//   List<GeneralProductModel> searchList = [];

//   double totalCartPrice = 0;
//   double totalCartWithShipping = 0;
//   int amount = 1;

//   incProductAmountInDetail() {
//     amount++;
//     notifyListeners();
//   }

//   decProductAmountInDetail() {
//     if (amount != 1) {
//       amount--;
//     }
//     notifyListeners();
//   }

//   DatabaseProvider() {
//     // fillProductsLists();
//     getAllTasks();
//   }

//   getAllTasks() async {
//     List<GeneralProductModel> allTasks =
//         await DatabaseHelper.databaseHelper.getAllproducts();
//     fillTasksLists(allTasks);
//   }

//   fillTasksLists(List<GeneralProductModel> tasks) {
//     allProducts = tasks;
//     favProducts = tasks.where((element) => element.isFav).toList();
//     cartProducts = tasks.where((element) => element.isInCart).toList();
//     offerProducts = tasks.where((element) => element.showInOffer).toList();
//     mostPopularProducts =
//         tasks.where((element) => element.showInMostPopular).toList();
//     cartTotalPrice();
//     notifyListeners();
//   }

//   cartTotalPrice() {
//     totalCartPrice = 0;
//     totalCartWithShipping = 0;
//     for (int i = 0; i < cartProducts.length; i++) {
//       cartProducts[i].offerPrice == 0
//           ? totalCartPrice +=
//               cartProducts[i].amountInCart * cartProducts[i].mainPrice
//           : totalCartPrice +=
//               cartProducts[i].amountInCart * cartProducts[i].offerPrice;
//     }
//     totalCartWithShipping = totalCartPrice + 20;
//   }

//   searchAboutProduct() {
//     // searchTitleController
//     searchList = [];
//     if (searchTitleController.text != '') {
//       for (int i = 0; i < allProducts.length; i++) {
//         if (allProducts[i]
//             .name
//             .toLowerCase()
//             .contains(searchTitleController.text.toLowerCase())) {
//           searchList.add(allProducts[i]);
//         }
//       }
//     } else {
//       searchList = [];
//     }
//     notifyListeners();
//   }

//   updateProductFav(GeneralProductModel product) async {
//     // int index = AllProductsInDummy.indexOf(product);
//     // AllProductsInDummy[index].isFav = !AllProductsInDummy[index].isFav;
//     product.isFav = !product.isFav;
//     await DatabaseHelper.databaseHelper.updateOneProduct(product);
//     // fillProductsLists();
//     getAllTasks();
//   }

//   deleteProductInCartScreen(GeneralProductModel product) async {
//     product.isInCart = !product.isInCart;
//     product.amountInCart = 0;
//     await DatabaseHelper.databaseHelper.deleteProductfromCart(product);
//     // fillProductsLists();
//     getAllTasks();
//   }

//   updateProductCart(GeneralProductModel product) async {
//     int index = cartProducts.indexOf(product);
//     // int index2 = allProducts.indexOf(product);
//     if (index >= 0) {
//       // product.amountInCart++;
//       cartProducts[index].amountInCart++;
//     } else {
//       // product.isInCart = !product.isInCart;
//       // product.amountInCart++;
//       product.isInCart = !product.isInCart;
//       product.amountInCart++;
//     }
//     await DatabaseHelper.databaseHelper.updateProductCartAmount(product);
//     // fillProductsLists();
//     getAllTasks();
//   }

//   incProductAmountInCart(GeneralProductModel product) async {
//     int index = allProducts.indexOf(product);
//     allProducts[index].amountInCart++;
//     await DatabaseHelper.databaseHelper.updateProductCartAmount(product);
//     // fillProductsLists();
//     getAllTasks();
//   }

//   decProductAmountInCart(GeneralProductModel product) async {
//     int index = allProducts.indexOf(product);
//     if (allProducts[index].amountInCart > 1) {
//       allProducts[index].amountInCart--;
//     } else {
//       allProducts[index].isInCart = !allProducts[index].isInCart;
//       allProducts[index].amountInCart = 0;
//     }
//     await DatabaseHelper.databaseHelper.updateProductCartAmount(product);
//     // fillProductsLists();
//     getAllTasks();
//   }
// }
