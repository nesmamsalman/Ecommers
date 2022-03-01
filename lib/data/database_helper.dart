// import 'dart:developer';
// import 'dart:io';

// import 'package:path_provider/path_provider.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:sqflite/sqlite_api.dart';
// import 'package:grocery_app/models/prev/generalProductModel.dart';

// class DatabaseHelper {
//   DatabaseHelper._();
//   static DatabaseHelper databaseHelper = DatabaseHelper._();
//   Database database;
//   initDatabase() {
//     connectToDatabase();
//   }

//   connectToDatabase() async {
//     Directory directory = await getApplicationDocumentsDirectory();
//     String databasePath = directory.path + '/products.db';
//     database = await openDatabase(databasePath, version: 1, onCreate: (db, v) {
//       db.execute('''
//       CREATE TABLE products 
//       (id INTEGER PRIMARY KEY AUTOINCREMENT,
//          name TEXT, 
//          imgURL TEXT,
//          mainPrice REAL,
//          offerPrice REAL,
//          description TEXT,
//          isFav INTEGER,
//          isInCart INTEGER,
//          showInOffer INTEGER,
//          showInMostPopular INTEGER,
//          amountInCart INTEGER
//          )
//       ''');

//       db.transaction((txn) async {
//         int id1 = await txn.rawInsert('''INSERT INTO products
//           (name, imgURL, mainPrice,offerPrice,description,isFav,isInCart,showInOffer,showInMostPopular,amountInCart) 
//           VALUES
//           ("Pink Rose","https://images.unsplash.com/photo-1575543483595-568b7afb6b9e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=435&q=80",
//             20.95,10,'Lorem ipsum dolor sit amet consetetur sadipscing elitr sed diam nonumy eirmod ',
//             1,0,0,1,0
//           )
//           ''');
//         int id2 = await txn.rawInsert('''INSERT INTO products
//           (name, imgURL, mainPrice,offerPrice,description,isFav,isInCart,showInOffer,showInMostPopular,amountInCart) 
//           VALUES
//           ("Yellow Rose","https://images.unsplash.com/photo-1414109918748-922adee5554a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=672&q=80",
//             30.00,25,'Lorem ipsum dolor sit amet consetetur sadipscing elitr sed diam nonumy eirmod ',
//             0,0,1,1,0
//           )
//           ''');
//         int id3 = await txn.rawInsert('''INSERT INTO products
//           (name, imgURL, mainPrice,offerPrice,description,isFav,isInCart,showInOffer,showInMostPopular,amountInCart) 
//           VALUES
//           ("White Rose","https://images.unsplash.com/photo-1495231916356-a86217efff12?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=436&q=80",
//             15.00,10,'Lorem ipsum dolor sit amet consetetur sadipscing elitr sed diam nonumy eirmod ',
//             1,0,0,1,0
//           )
//           ''');
//         int id4 = await txn.rawInsert('''INSERT INTO products
//           (name, imgURL, mainPrice,offerPrice,description,isFav,isInCart,showInOffer,showInMostPopular,amountInCart) 
//           VALUES
//           ("Red Rose","https://images.unsplash.com/photo-1561238160-3fd50893667f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
//             20.00,18,'Lorem ipsum dolor sit amet consetetur sadipscing elitr sed diam nonumy eirmod ',
//             1,0,1,1,0
//           )
//           ''');
//         int id5 = await txn.rawInsert('''INSERT INTO products
//           (name, imgURL, mainPrice,offerPrice,description,isFav,isInCart,showInOffer,showInMostPopular,amountInCart) 
//           VALUES
//           ("Purple Flowers","https://images.unsplash.com/photo-1621944129421-b57db886e63c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80",
//             25.00,18,'Lorem ipsum dolor sit amet consetetur sadipscing elitr sed diam nonumy eirmod ',
//             0,0,1,1,0
//           )
//           ''');
//         int id6 = await txn.rawInsert('''INSERT INTO products
//           (name, imgURL, mainPrice,offerPrice,description,isFav,isInCart,showInOffer,showInMostPopular,amountInCart) 
//           VALUES
//           ("Shining Flowers","https://images.unsplash.com/photo-1591889179105-a3f153522288?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=363&q=80",
//             25.00,18,'Lorem ipsum dolor sit amet consetetur sadipscing elitr sed diam nonumy eirmod ',
//             1,0,0,1,0
//           )
//           ''');
//         int id7 = await txn.rawInsert('''INSERT INTO products
//           (name, imgURL, mainPrice,offerPrice,description,isFav,isInCart,showInOffer,showInMostPopular,amountInCart) 
//           VALUES
//           ("Roses","https://images.unsplash.com/photo-1580740132087-761c25cacbf6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=386&q=80",
//             25.00,18,'Lorem ipsum dolor sit amet consetetur sadipscing elitr sed diam nonumy eirmod ',
//             1,0,0,1,0
//           )
//           ''');
//       });
//     });
//   }

//   Future<List<GeneralProductModel>> getAllproducts() async {
//     List<Map<String, Object>> data = await database.query('products');
//     List<GeneralProductModel> productsList = [];

//     List<GeneralProductModel> productsPnjects = data.map((Map map) {
//       return GeneralProductModel.fromMap(map);
//     }).toList();
//     return productsPnjects;
//   }

//   updateOneProduct(GeneralProductModel product) async {
//     await database.update('products', product.toMap(),
//         where: 'id=?', whereArgs: [product.id]);
//   }

//   deleteProductfromCart(GeneralProductModel product) async {
//     // database.delete('products', where: 'id=?', whereArgs: [product.id]);
//     // بدي اعدل الكارت تبع العنصر لأنه الي فوق بيحزفه نهائي
//     await database.update('products', product.toMap(),
//         where: 'id=?', whereArgs: [product.id]);
//   }

//   updateProductCartAmount(GeneralProductModel product) async {
//     await database.update('products', product.toMap(),
//         where: 'id=?', whereArgs: [product.id]);
//   }
// }
