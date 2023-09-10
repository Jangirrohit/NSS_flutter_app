// import 'dart:developer';

import 'package:mongo_dart/mongo_dart.dart';

import 'constant.dart';

class MongoDatabase {
  static connect() async {
    var db = await Db.create(Mongo_Conn_Url);
    await db.open();
    // inspect(db);
    var status = db.serverStatus();
    // ignore: avoid_print
    print(status);

    var usercollection = db.collection(User_Collection);
    await usercollection.insertOne({"title": "Jurassic Park"});
    // ignore: avoid_print
    print(await usercollection.find().toList());
  }

  static Future<dynamic> newMethod(Db db) async => await db.open();
}
