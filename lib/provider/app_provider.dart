import 'dart:developer';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mns/data/auth_helper.dart';
import 'package:mns/data/firestore_helper.dart';
import 'package:mns/mainAllScreens.dart';
import 'package:mns/models/address_model.dart';
import 'package:mns/models/cart_model.dart';
import 'package:mns/models/category_model.dart';
import 'package:mns/models/fav_model.dart';
import 'package:mns/models/gd_user.dart';
import 'package:mns/models/order_model.dart';
import 'package:mns/models/product_model.dart';
import 'package:mns/router_helper.dart';
import 'package:mns/ui/screens/DeliveryAddressEditScreen.dart';
import 'package:mns/ui/screens/DeliveryAddressScreen.dart';
import 'package:mns/ui/screens/EditProfieScreen.dart';
import 'package:mns/ui/screens/LoginScreen.dart';
import 'package:mns/ui/screens/loginRegister.dart';
import 'package:image_picker/image_picker.dart';

class AppProvider extends ChangeNotifier {
  AppProvider() {
    getData();
    clearDefaultAmount();
  }

  GdUser loggedUser;
  List<ProductModel> allProducts;
  List<CategModel> allCategories;
  List<ProductModel> CategoryProduct;
  List<ProductModel> searchList = [];
  List<CartModel> cartModelList;
  List<ProductModel> cartList = [];
  List<ProductModel> favList = [];
  List<AddressModel> addressList = [];
  List<OrderModel> ordersList = [];
  TextEditingController searchTitleController = TextEditingController();
  num defaultAmount = 1;
  bool isDarkMode = false;
  bool isLoading = false;
  num totalPriceInCart = 0;
  num shippingPrice = 20;
  num generalTotal = 0;
  String deliveryAddressId;
  AddressModel deliveryAddress;

  File file;
  String imageUrl;
  TextEditingController nameControllerEdit = TextEditingController();
  TextEditingController emailControllerEdit = TextEditingController();
  TextEditingController phoneControllerEdit = TextEditingController();

  TextEditingController titleAddressControllerEdit = TextEditingController();
  TextEditingController streetAddressControllerEdit = TextEditingController();
  TextEditingController countryAddressControllerEdit = TextEditingController();
  TextEditingController cityAddressControllerEdit = TextEditingController();
  TextEditingController descriptionAddressControllerEdit =
      TextEditingController();
  String addressIDtoChange;

  pickNewImage() async {
    XFile file = await ImagePicker().pickImage(source: ImageSource.gallery);
    this.file = File(file.path);
    notifyListeners();
  }

  editProfile() async {
    isLoading = true;
    notifyListeners();

    String productiD = await FirebaseAuth.instance.currentUser.uid;
    log(productiD ?? 'null');
    if (file != null) {
      this.imageUrl =
          await FirestoreHelper.firestoreHelper.uploadImage(this.file);
    }
    GdUser product = GdUser(
      id: productiD,
      name: nameControllerEdit.text,
      email: emailControllerEdit.text,
      phone: phoneControllerEdit.text,
    );
    product.imgURL = imageUrl;
    await FirestoreHelper.firestoreHelper.editProfile(product);
    await getUserFromFirebase();
    isLoading = false;
    notifyListeners();
  }

  goToEditProfile() {
    this.file = null;
    this.nameControllerEdit.text = this.loggedUser.name;
    this.emailControllerEdit.text = this.loggedUser.email;
    this.phoneControllerEdit.text = this.loggedUser.phone;
    this.imageUrl = this.loggedUser.imgURL;
    notifyListeners();
    RouterHelper.routerHelper
        .routingToSpecificWidgetWithoutPop(EditProfieScreen());
  }

// change delivery address id
  changeDeliveryId(AddressModel address) {
    deliveryAddressId = address.id;
    deliveryAddress = address;
    isLoading = false;
    notifyListeners();
  }

// convet dark mode
  changeToDarkMode() {
    isDarkMode = !isDarkMode;
    isLoading = false;
    notifyListeners();
  }

// stop loading
  changeisLoadingPayment() {
    // isLoading = !isLoading;
    isLoading = false;
    notifyListeners();
  }

// get all data
  getData() async {
    this.allProducts = await FirestoreHelper.firestoreHelper.getAllProducts();
    this.allCategories =
        await FirestoreHelper.firestoreHelper.getAllCategories();
    await getCartList();
    await getFavList();
    await getAddressList();
    isLoading = false;
    notifyListeners();
  }

// register new user
  register(GdUser gdUser) async {
    isLoading = true;
    notifyListeners();
    try {
      String userId = await AuthHelper.authHelper
          .createNewAccount(gdUser.email, gdUser.password);
      // log(userId);
      gdUser.id = userId;
      await FirestoreHelper.firestoreHelper.createUserInFs(gdUser);
      loggedUser = gdUser;
      isLoading = false;
      notifyListeners();
      RouterHelper.routerHelper.routingToSpecificWidget(MainAllScreens());
    } on Exception catch (e) {
      // TODO
      isLoading = false;
      notifyListeners();
    }
  }

// login
  login(String email, String password) async {
    isLoading = true;
    notifyListeners();
    try {
      UserCredential userCredential =
          await AuthHelper.authHelper.signIn(email, password);
      await getUserFromFirebase();
      await getData();
      RouterHelper.routerHelper.routingToSpecificWidget(MainAllScreens());
    } on Exception catch (e) {
      // TODO
      isLoading = false;
      notifyListeners();
    }
  }

// get user info from db
  getUserFromFirebase() async {
    String userId = FirebaseAuth.instance.currentUser.uid;
    // log(FirebaseAuth.instance.currentUser.toString());
    loggedUser = await FirestoreHelper.firestoreHelper.getUserFromFs(userId);
    // isLoading = false;
    notifyListeners();
  }

// log out
  logOut() async {
    this.loggedUser = null;
    await AuthHelper.authHelper.logout();
    RouterHelper.routerHelper.routingToSpecificWidget(LoginPage());
  }


// get Categories product
  getCategProduct(String categName) async {
    CategoryProduct = [];
    // this.CategoryProduct = await FirestoreHelper.firestoreHelper.getCategoryProducts(categName);
    for (int i = 0; i < allProducts.toList().length; i++) {
      if (allProducts[i].categName == categName) {
        CategoryProduct.add(allProducts[i]);
      }
    }
    notifyListeners();
  }

// search about a product
  searchAboutProduct() {
    searchList = [];
    if (searchTitleController.text != '') {
      for (int i = 0; i < allProducts.length; i++) {
        if (allProducts[i]
                .name
                .toLowerCase()
                .contains(searchTitleController.text.toLowerCase()) ||
            allProducts[i]
                .name_ar
                .toLowerCase()
                .contains(searchTitleController.text.toLowerCase())) {
          searchList.add(allProducts[i]);
        }
      }
    } else {
      searchList = [];
    }
    notifyListeners();
  }

// get product detail
  getOneProductDetail(String productID) async {
    ProductModel product =
        await FirestoreHelper.firestoreHelper.getOneProduct(productID);
    return product;
  }

// inc amount in product detail screen
  incProductAmountInCart() async {
    defaultAmount = defaultAmount + 1;
    notifyListeners();
  }

// dec amount in product detail screen
  decProductAmountInCart() {
    if (defaultAmount > 1) {
      defaultAmount--;
    } else {
      defaultAmount = 1;
      notifyListeners();
    }
  }

// clear the amount in the detail screen
  clearDefaultAmount() {
    defaultAmount = 1;
    notifyListeners();
  }

// add product to cart from product detail screen
  addProductToCart(ProductModel productToAdd) async {
    isLoading = true;
    notifyListeners();

    CartModel productCart = CartModel(
      amount: defaultAmount,
      productID: productToAdd.id,
      product: productToAdd,
    );

    String userId = FirebaseAuth.instance.currentUser.uid;
    loggedUser = await FirestoreHelper.firestoreHelper.getUserFromFs(userId);
    await FirestoreHelper.firestoreHelper.addToCart(productCart, userId);
    clearDefaultAmount();
    isLoading = false;
    notifyListeners();
    getCartList();
  }

// add product to cart from product / fav widget
  addProdToCart(ProductModel productToAdd) async {
    // log(cartModelList.any((element) => element.productID == productToAdd.id).toString());
    // log(cartModelList.firstWhere((element) => element.productID == productToAdd.id).toMap().toString());

    if (cartModelList.any((element) => element.productID == productToAdd.id)) {
      CartModel cartProduct = cartModelList
          .firstWhere((element) => element.productID == productToAdd.id);

      CartModel productCart = CartModel(
        amount: cartProduct.amount + 1,
        productID: productToAdd.id,
        product: productToAdd,
      );

      String userId = FirebaseAuth.instance.currentUser.uid;
      loggedUser = await FirestoreHelper.firestoreHelper.getUserFromFs(userId);
      await FirestoreHelper.firestoreHelper.addToCart(productCart, userId);

      notifyListeners();
      getCartList();
    } else {
      addProductToCart(productToAdd);
    }
  }

// remove product from cart in cart screen
  removeProductFromCart(CartModel productToDelete) async {
    String userId = FirebaseAuth.instance.currentUser.uid;
    loggedUser = await FirestoreHelper.firestoreHelper.getUserFromFs(userId);
    await FirestoreHelper.firestoreHelper
        .removeFromCart(productToDelete, userId);
    notifyListeners();
    getCartList();
    notifyListeners();
  }

// get cart product list
  getCartList() async {
    if (FirebaseAuth.instance.currentUser != null) {
      String userId = FirebaseAuth.instance.currentUser.uid;
      List returnList =
          await FirestoreHelper.firestoreHelper.getUserCartList(userId);
      // cartModelList = returnList;
      cartList = returnList[0];
      cartModelList = returnList[1];
      notifyListeners();
      getCartTotalPrice();
    }
  }

// total amount in cart
  getCartTotalPrice() {
    totalPriceInCart = 0;
    generalTotal = 0;
    for (int i = 0; i < cartModelList.length; i++) {
      num itemPrice = cartModelList[i].amount * cartModelList[i].product.price;
      totalPriceInCart = totalPriceInCart + itemPrice;
    }
    generalTotal = totalPriceInCart + shippingPrice;
    notifyListeners();
  }

// increment Product Amount In CartScreen
  incProdAmountInCartScreen(CartModel productToUpdate) async {
    String userId = FirebaseAuth.instance.currentUser.uid;
    productToUpdate.amount = productToUpdate.amount + 1;
    await FirestoreHelper.firestoreHelper
        .editProductAmountInCart(productToUpdate, userId);
    // await getCartList();
    getCartTotalPrice();
    notifyListeners();
  }

// decrement Product Amount In CartScreen
  decProdAmountInCartScreen(CartModel productToUpdate) async {
    String userId = FirebaseAuth.instance.currentUser.uid;
    if (productToUpdate.amount > 1) {
      productToUpdate.amount = productToUpdate.amount - 1;
      await FirestoreHelper.firestoreHelper
          .editProductAmountInCart(productToUpdate, userId);
      getCartTotalPrice();
    } else {
      await removeProductFromCart(productToUpdate);
      totalPriceInCart = 0;
    }
    notifyListeners();
  }

// get fav product list
  getFavList() async {
    if (FirebaseAuth.instance.currentUser != null) {
      String userId = FirebaseAuth.instance.currentUser.uid;
      favList = await FirestoreHelper.firestoreHelper.getUserFavList(userId);
      notifyListeners();
    }
  }

// add product to fav
  addProductToFav(ProductModel productToAdd) async {
    isLoading = true;
    notifyListeners();

    FavModel productCart = FavModel(
      productID: productToAdd.id,
    );

    String userId = FirebaseAuth.instance.currentUser.uid;
    loggedUser = await FirestoreHelper.firestoreHelper.getUserFromFs(userId);
    await FirestoreHelper.firestoreHelper.addToFav(productCart, userId);
    isLoading = false;
    notifyListeners();
    getFavList();
  }

// remove product from fav
  removeProductFromFav(ProductModel productToAdd) async {
    isLoading = true;
    notifyListeners();
    FavModel productCart = FavModel(
      productID: productToAdd.id,
    );

    String userId = FirebaseAuth.instance.currentUser.uid;
    loggedUser = await FirestoreHelper.firestoreHelper.getUserFromFs(userId);
    await FirestoreHelper.firestoreHelper.removeFromFav(productCart, userId);
    isLoading = false;
    notifyListeners();
    getFavList();
  }

// get address list
  getAddressList() async {
    if (FirebaseAuth.instance.currentUser != null) {
      String userId = FirebaseAuth.instance.currentUser.uid;
      addressList =
          await FirestoreHelper.firestoreHelper.getUseraddressList(userId);
      if (addressList.length > 0) {
        deliveryAddressId = addressList[0].id;
        deliveryAddress = addressList[0];
      }
      isLoading = false;
      notifyListeners();
    }
  }

// add address
  addAddress(AddressModel address) async {
    isLoading = true;
    notifyListeners();

    String userId = FirebaseAuth.instance.currentUser.uid;
    await FirestoreHelper.firestoreHelper.addToAddressesList(address, userId);
    await getAddressList();
    isLoading = false;
    notifyListeners();
  }

// remove address
  removeAddress(AddressModel address) async {
    isLoading = true;
    notifyListeners();

    String userId = FirebaseAuth.instance.currentUser.uid;
    await FirestoreHelper.firestoreHelper
        .removeFromAddressesList(address, userId);
    await getAddressList();
    isLoading = false;
    notifyListeners();
  }

// go to edit
  goToEditAddress(AddressModel address) {
    this.titleAddressControllerEdit.text = address.title;
    this.streetAddressControllerEdit.text = address.street;
    this.countryAddressControllerEdit.text = address.country;
    this.cityAddressControllerEdit.text = address.city;
    this.descriptionAddressControllerEdit.text = address.description;
    addressIDtoChange = address.id;
    RouterHelper.routerHelper
        .routingToSpecificWidgetWithoutPop(DeliveryAddressEditScreen());
    notifyListeners();
  }

// edit Address
  editUserAddress() async {
    isLoading = true;
    notifyListeners();
    String userId = FirebaseAuth.instance.currentUser.uid;
    AddressModel newAddressInfo = AddressModel(
      id: this.addressIDtoChange,
      title: titleAddressControllerEdit.text,
      street: streetAddressControllerEdit.text,
      country: countryAddressControllerEdit.text,
      city: cityAddressControllerEdit.text,
      description: descriptionAddressControllerEdit.text,
    );
    await FirestoreHelper.firestoreHelper.editAddress(newAddressInfo, userId);
    await getAddressList();
    isLoading = false;
    notifyListeners();
    RouterHelper.routerHelper
        .routingToSpecificWidget(DeliveryAddressScreen()); // push replacement
  }

// add address
  addOrder(OrderModel order) async {
    // log(order.toMap().toString());
    isLoading = true;
    notifyListeners();

    String userId = FirebaseAuth.instance.currentUser.uid;
    await FirestoreHelper.firestoreHelper.addToOrdersList(order, userId);

    await getAddressList();
    await getCartList();
    isLoading = false;
    notifyListeners();
  }

// get orders list
  getOrdersList() async {
    if (FirebaseAuth.instance.currentUser != null) {
      String userId = FirebaseAuth.instance.currentUser.uid;
      ordersList =
          await FirestoreHelper.firestoreHelper.getUserOrdersList(userId);
      notifyListeners();
    }
  }

// re-order an order
  reOrder(OrderModel order) async {
    isLoading = true;
    notifyListeners();
    String userId = FirebaseAuth.instance.currentUser.uid;
    loggedUser = await FirestoreHelper.firestoreHelper.getUserFromFs(userId);
    for (int i = 0; i < order.cart.length; i++) {
      await FirestoreHelper.firestoreHelper.addToCart(order.cart[i], userId);
    }
    isLoading = false;
    await getCartList();
    notifyListeners();
  }
}
