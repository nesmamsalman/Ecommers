import 'package:mns/models/address_model.dart';
import 'package:mns/models/category_model.dart';
// import 'package:mns/models/order_model.dart';
import 'package:mns/models/product_model.dart';

List<CategModel> categ = [
  CategModel(
      name: 'Fruits',
      imgURL:
          'https://images.unsplash.com/photo-1519996529931-28324d5a630e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
  CategModel(
      name: 'Vegetables',
      imgURL:
          'https://images.unsplash.com/photo-1572357243457-fc153742e7a5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=386&q=80'),
  CategModel(
      name: 'Cheese',
      imgURL:
          'https://images.unsplash.com/photo-1589881133595-a3c085cb731d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=465&q=80'),
  CategModel(
      name: 'Soft drinks',
      imgURL:
          'https://images.unsplash.com/photo-1543253687-c931c8e01820?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=465&q=80'),
];

List<ProductModel> bestSeller = [
  ProductModel(
    name: 'Kiwi Pinball',
    imgURL:
        'https://images.unsplash.com/photo-1618897996318-5a901fa6ca71?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80',
    price: 30,
    // isFav: false,
    // isInCart: false,
    categName: 'Fruits',
    description:
        'Lorem ipsum dolor sit amet consetetur sadipscing elitr sed diam nonumy eirmod Lorem ipsum dolor sit amet consetetur sadipscing elitr sed diam nonumy eirmod',
  ),
  ProductModel(
    name: 'Bell peppers',
    imgURL:
        'https://images.unsplash.com/photo-1601648764658-cf37e8c89b70?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=871&q=80',
    price: 30,
    // isFav: false,
    // isInCart: false,
    categName: 'Vegetables',
    description:
        'Lorem ipsum dolor sit amet consetetur sadipscing elitr sed diam nonumy eirmod Lorem ipsum dolor sit amet consetetur sadipscing elitr sed diam nonumy eirmod',
  ),
  ProductModel(
    name: 'Cheese',
    imgURL:
        'https://images.unsplash.com/photo-1608666660863-695ebbedc848?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=526&q=80',
    price: 30,
    // isFav: false,
    // isInCart: false,
    categName: 'Cheese',
    description:
        'Lorem ipsum dolor sit amet consetetur sadipscing elitr sed diam nonumy eirmod Lorem ipsum dolor sit amet consetetur sadipscing elitr sed diam nonumy eirmod',
  ),
  ProductModel(
    name: 'Schweppes',
    imgURL:
        'https://images.unsplash.com/photo-1581006852262-e4307cf6283a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
    price: 30,
    // isFav: false,
    // isInCart: false,
    categName: 'Soft drinks',
    description:
        'Lorem ipsum dolor sit amet consetetur sadipscing elitr sed diam nonumy eirmod Lorem ipsum dolor sit amet consetetur sadipscing elitr sed diam nonumy eirmod',
  ),
];

List<AddressModel> address = [
  AddressModel(
      title: 'Home',
      street: "street 1",
      country: 'Palestine',
      city: 'Gaza',
      description:
          'Lorem ipsum dolor sit amet consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat',
      isDefault: true),
  AddressModel(
      title: 'Office',
      street: "street 1",
      country: 'Palestine',
      city: 'Gaza',
      description:
          'Lorem ipsum dolor sit amet consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat',
      isDefault: false),
];

// List<OrderModel> orders = [
//   OrderModel(
//       orderID: '123',
//       state: 'Approved',
//       totalPrice: '300',
//       date: '2022-02-07',
//       time: '17:01',
//       payMethod: 'Cash on delivery',
//       cart: [
//         ProductModel(
//           name: 'Kiwi Pinball',
//           imgURL:
//               'https://images.unsplash.com/photo-1618897996318-5a901fa6ca71?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80',
//           price: 30,
//           // isFav: false,
//           // isInCart: false,
//           categName: 'Fruits',
//           description:
//               'Lorem ipsum dolor sit amet consetetur sadipscing elitr sed diam nonumy eirmod Lorem ipsum dolor sit amet consetetur sadipscing elitr sed diam nonumy eirmod',
//         ),
//         ProductModel(
//           name: 'Bell peppers',
//           imgURL:
//               'https://images.unsplash.com/photo-1601648764658-cf37e8c89b70?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=871&q=80',
//           price: 30,
//           // isFav: false,
//           // isInCart: false,
//           categName: 'Vegetables',
//           description:
//               'Lorem ipsum dolor sit amet consetetur sadipscing elitr sed diam nonumy eirmod Lorem ipsum dolor sit amet consetetur sadipscing elitr sed diam nonumy eirmod',
//         ),
//       ],
//       address: AddressModel(
//           title: 'Home',
//           street: "street 1",
//           country: 'Palestine',
//           city: 'Gaza',
//           description:
//               'Lorem ipsum dolor sit amet consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat',
//           isDefault: true)),
//   OrderModel(
//       orderID: '123',
//       state: 'Enroute',
//       totalPrice: '300',
//       date: '2022-02-07',
//       time: '17:01',
//       payMethod: 'Cash on delivery',
//       cart: [
//         ProductModel(
//           name: 'Kiwi Pinball',
//           imgURL:
//               'https://images.unsplash.com/photo-1618897996318-5a901fa6ca71?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80',
//           price: 30,
//           // isFav: false,
//           // isInCart: false,
//           categName: 'Fruits',
//           description:
//               'Lorem ipsum dolor sit amet consetetur sadipscing elitr sed diam nonumy eirmod Lorem ipsum dolor sit amet consetetur sadipscing elitr sed diam nonumy eirmod',
//         ),
//         ProductModel(
//           name: 'Bell peppers',
//           imgURL:
//               'https://images.unsplash.com/photo-1601648764658-cf37e8c89b70?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=871&q=80',
//           price: 30,
//           // isFav: false,
//           // isInCart: false,
//           categName: 'Vegetables',
//           description:
//               'Lorem ipsum dolor sit amet consetetur sadipscing elitr sed diam nonumy eirmod Lorem ipsum dolor sit amet consetetur sadipscing elitr sed diam nonumy eirmod',
//         ),
//       ],
//       address: AddressModel(
//           title: 'Home',
//           street: "street 1",
//           country: 'Palestine',
//           city: 'Gaza',
//           description:
//               'Lorem ipsum dolor sit amet consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat',
//           isDefault: true)),
// ];

