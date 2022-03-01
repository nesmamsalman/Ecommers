import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:mns/models/address_model.dart';
import 'package:mns/models/cart_model.dart';
import 'package:mns/models/category_model.dart';
import 'package:mns/models/fav_model.dart';
import 'package:mns/models/gd_user.dart';
import 'package:mns/models/order_model.dart';
import 'package:mns/models/product_model.dart';

class FirestoreHelper {
  FirestoreHelper._();
  static FirestoreHelper firestoreHelper = FirestoreHelper._();
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  createUserInFs(GdUser gdUser) async {
    firebaseFirestore.collection('users').doc(gdUser.id).set(gdUser.toMap());
  }

  Future<GdUser> getUserFromFs(String id) async {
    DocumentSnapshot<Map<String, dynamic>> document =
        await firebaseFirestore.collection('users').doc(id).get();
    Map<String, dynamic> userData = document.data();

    userData['id'] = document.id;
    GdUser gdUser = GdUser.fromMap(userData);
    return gdUser;
  }

  Future<List<ProductModel>> getAllProducts() async {
    QuerySnapshot<Map<String, dynamic>> allProductsSnapshot =
        await firebaseFirestore.collection('products').get();
    List<ProductModel> allProducts = allProductsSnapshot.docs.map((e) {
      Map documentMap = e.data();
      documentMap['id'] = e.id;
      ProductModel product = ProductModel.fromMap(documentMap);
      return product;
    }).toList();
    return allProducts;
  }

  Future<List<CategModel>> getAllCategories() async {
    QuerySnapshot<Map<String, dynamic>> allProductsSnapshot =
        await firebaseFirestore.collection('categories').get();
    List<CategModel> allCategories = allProductsSnapshot.docs.map((e) {
      Map documentMap = e.data();
      documentMap['id'] = e.id;
      CategModel product = CategModel.fromMap(documentMap);
      return product;
    }).toList();
    return allCategories;
  }

  Future<ProductModel> getOneProduct(String productId) async {
    DocumentSnapshot<Map<String, dynamic>> productSnapshot =
        await firebaseFirestore.collection('products').doc(productId).get();
    Map<String, dynamic> productMap = productSnapshot.data();
    productMap['id'] = productSnapshot.id;
    ProductModel product = ProductModel.fromMap(productMap);
    return product;
  }

  addToCart(CartModel productToAdd, String id) async {
    await firebaseFirestore
        .collection('users')
        .doc(id)
        .collection('cart')
        .doc(productToAdd.productID)
        .set(productToAdd.toMap());
  }

  getUserCartList(String id) async {
    QuerySnapshot<Map<String, dynamic>> allCartProductsSnapshot =
        await firebaseFirestore
            .collection('users')
            .doc(id)
            .collection('cart')
            .get();
    List<CartModel> cartList = allCartProductsSnapshot.docs.map((e) {
      Map documentMap = e.data();
      // documentMap['id'] = e.id;
      CartModel cartItem = CartModel.fromMap(documentMap);
      return cartItem;
    }).toList();

    // return cartList;

    List<ProductModel> productList = [];
    // return cartList;
    if (cartList.length > 0) {
      for (int i = 0; i < cartList.length; i++) {
        ProductModel product = await getOneProduct(cartList[i].productID);
        productList.add(product);
        // productList = productList.add(getOneProduct(cartList[i].productID));
      }
    }
    return [productList, cartList];
  }

  removeFromCart(CartModel productToRemove, String id) async {
    await firebaseFirestore
        .collection('users')
        .doc(id)
        .collection('cart')
        .doc(productToRemove.productID)
        .delete();
  }

  editProductAmountInCart(CartModel productToUpdate, String id) async {
    await firebaseFirestore
        .collection('users')
        .doc(id)
        .collection('cart')
        .doc(productToUpdate.productID)
        .update(productToUpdate.toMap());
  }

  addToFav(FavModel productToAdd, String id) async {
    await firebaseFirestore
        .collection('users')
        .doc(id)
        .collection('favorite')
        .doc(productToAdd.productID)
        .set(productToAdd.toMap());
  }

  removeFromFav(FavModel productToAdd, String id) async {
    await firebaseFirestore
        .collection('users')
        .doc(id)
        .collection('favorite')
        .doc(productToAdd.productID)
        .delete();
  }

  getUserFavList(String id) async {
    QuerySnapshot<Map<String, dynamic>> allFavProductsSnapshot =
        await firebaseFirestore
            .collection('users')
            .doc(id)
            .collection('favorite')
            .get();
    List<FavModel> favList = allFavProductsSnapshot.docs.map((e) {
      Map documentMap = e.data();
      // documentMap['id'] = e.id;
      FavModel favItem = FavModel.fromMap(documentMap);
      return favItem;
    }).toList();
    List<ProductModel> productList = [];
    // return cartList;
    if (favList.length > 0) {
      for (int i = 0; i < favList.length; i++) {
        ProductModel product = await getOneProduct(favList[i].productID);
        productList.add(product);
        // productList = productList.add(getOneProduct(cartList[i].productID));
      }
    }
    return productList;
  }

  addToAddressesList(AddressModel address, String id) async {
    await firebaseFirestore
        .collection('users')
        .doc(id)
        .collection('addresses')
        .add(address.toMap());
  }

  getUseraddressList(String id) async {
    QuerySnapshot<Map<String, dynamic>> allFavProductsSnapshot =
        await firebaseFirestore
            .collection('users')
            .doc(id)
            .collection('addresses')
            .get();
    List<AddressModel> addressesList = allFavProductsSnapshot.docs.map((e) {
      Map documentMap = e.data();
      documentMap['id'] = e.id;
      AddressModel addressItem = AddressModel.fromMap(documentMap);
      return addressItem;
    }).toList();
    return addressesList;
  }

  removeFromAddressesList(AddressModel address, String id) async {
    await firebaseFirestore
        .collection('users')
        .doc(id)
        .collection('addresses')
        .doc(address.id)
        .delete();
  }

  editAddress(AddressModel address, String id) async {
    // log(address.toMap().toString());
    await firebaseFirestore
        .collection('users')
        .doc(id)
        .collection('addresses')
        .doc(address.id)
        .update(address.toMap());
  }

  addToOrdersList(OrderModel order, String id) async {
    await firebaseFirestore
        .collection('users')
        .doc(id)
        .collection('orders')
        .add(order.toMap());

    QuerySnapshot<Map<String, dynamic>> allCartProductsSnapshot =
        await firebaseFirestore
            .collection('users')
            .doc(id)
            .collection('cart')
            .get();
    List<CartModel> cartList = allCartProductsSnapshot.docs.map((e) {
      Map documentMap = e.data();
      CartModel cartItem = CartModel.fromMap(documentMap);
      return cartItem;
    }).toList();

    for (int i = 0; i < cartList.length; i++) {
      await firebaseFirestore
          .collection('users')
          .doc(id)
          .collection('cart')
          .doc(cartList[i].productID)
          .delete();
    }
  }

  getUserOrdersList(String id) async {
    QuerySnapshot<Map<String, dynamic>> allFavProductsSnapshot =
        await firebaseFirestore
            .collection('users')
            .doc(id)
            .collection('orders')
            .get();
    List<OrderModel> ordersList = allFavProductsSnapshot.docs.map((e) {
      Map documentMap = e.data();
      documentMap['orderID'] = e.id;
      OrderModel orderItem = OrderModel.fromMap(documentMap);
      return orderItem;
    }).toList();
    return ordersList;
  }

  Future<String> uploadImage(File file) async {
    String filePath = file.path;
    String fileName = filePath.split('/').last;
    Reference reference = firebaseStorage.ref('users/$fileName');
    await reference.putFile(file);
    String imageUrl = await reference.getDownloadURL();
    return imageUrl;
  }

  editProfile(GdUser newProduct) async {
    // log(newProduct.toMap().toString());
    await firebaseFirestore
        .collection('users')
        .doc(newProduct.id)
        .update(newProduct.toMap());
  }

  // DocumentReference<Map<String, dynamic>> doc = await firebaseFirestore
  //     .collection('products')
  //     .add(bestSeller[0].toMap());
}


//// admin
  // addNewProduct(Product product) async {
  //   DocumentReference<Map<String, dynamic>> doc =
  //       await firebaseFirestore.collection('products').add(product.toMap());
  //   log(doc.id);
  // }

  // Future<String> uploadImage(File file) async {
  //   String filePath = file.path;
  //   String fileName = filePath.split('/').last;
  //   Reference reference = firebaseStorage.ref('products/$fileName');
  //   await reference.putFile(file);
  //   String imageUrl = await reference.getDownloadURL();
  //   return imageUrl;
  // }

  // editProduct(Product newProduct) async {
  //   await firebaseFirestore
  //       .collection('products')
  //       .doc(newProduct.id)
  //       .update(newProduct.toMap());
  // }

  // deleteProruct(String productId) async {
  //   await firebaseFirestore.collection('products').doc(productId).delete();
  // }

  // Future<Product> getOneProduct(String productId) async {
  //   DocumentSnapshot<Map<String, dynamic>> productSnapshot =
  //       await firebaseFirestore.collection('products').doc(productId).get();
  //   Map<String, dynamic> productMap = productSnapshot.data();
  //   productMap['id'] = productSnapshot.id;
  //   Product product = Product.fromMap(productMap);
  //   return product;
  // }

  // addProductToCart(Product product) async {
  //   String myid = FirebaseAuth.instance.currentUser.uid;
  //   firebaseFirestore
  //       .collection('users')
  //       .doc(myid)
  //       .collection('cart')
  //       .add(product.toMap());
  // }