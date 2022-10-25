import 'dart:developer';

import 'package:mongo_dart/mongo_dart.dart';

import 'constant.dart';

class MongoDatabase {
  static connect() async {
    var db = await Db.create(MONGO_URL);
    await db.open();
    inspect(db);
    var status = db.serverStatus();
    print(status);
    var collection = db.collection(COLLECTION_NAME);
    await collection.insertMany([
      {"name": "John", "age": 30, "email": "jhon@gmail.com"},
      {"name": "Peter", "age": 40, "email": "peter@gmail.com"}
    ]);
    print(await collection.find().toList());

    await collection.update(
        where.eq("name", "John"), modify.set("email", "test@test.com"));

    print(await collection.find().toList());

    await collection.deleteOne({"name": "John"});
    await collection.deleteMany({"name": "Peter"});
  }
}
