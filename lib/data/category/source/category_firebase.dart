import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:either_dart/either.dart';

abstract class CategoryFirebase {
  Future<Either> getCategories();
}

class CategoryFirebaseImpl extends CategoryFirebase {
  @override
  Future<Either> getCategories() async {
    try {
      var res = await FirebaseFirestore.instance.collection("category").get();
      if (res.docs.isEmpty) const Left("No Product");
      return Right(res.docs);
    } catch (e) {
      return const Left("not found 404");
    }
  }
}
