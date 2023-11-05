import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:german_management_app/core/error/exception.dart';
import 'package:german_management_app/product/data/models/catagory_model.dart';

abstract class CatagorytDatasource {
  Future<List<CatagoryModel>> getCatagoryList();
  Future<Unit> createCatagory(CatagoryModel catagoryModel);
  Future<Unit> deleteCatagory(String docId);
  Future<Unit> updateCatagory(CatagoryModel catagoryModel);
}

class CatagoryFirebaseDatasource extends CatagorytDatasource {
  var db = FirebaseFirestore.instance;
  String collectionPath = "catagories";
  @override
  Future<Unit> createCatagory(CatagoryModel catagoryModel) async {
    try {
      await db.collection(collectionPath).add(catagoryModel.toMap());
      return Future.value(unit);
    } catch (e) {
      throw ServerException(msg: e.toString());
    }
  }

  @override
  Future<Unit> deleteCatagory(String docId) async {
    try {
      await db.collection(collectionPath).doc(docId).delete();
      return Future.value(unit);
    } catch (e) {
      throw ServerException(msg: e.toString());
    }
  }

  @override
  Future<List<CatagoryModel>> getCatagoryList() async {
    try {
      CollectionReference collectionReference = db.collection(collectionPath);
      QuerySnapshot querySnapshot = await collectionReference.get();
      return querySnapshot.docs.map((e) => CatagoryModel.fromQuery(e)).toList();
    } catch (e) {
      throw ServerException(msg: e.toString());
    }
  }

  @override
  Future<Unit> updateCatagory(CatagoryModel catagoryModel) async {
    try {
      await db
          .collection(collectionPath)
          .doc(catagoryModel.docId)
          .update(catagoryModel.toMap());
      return Future.value(unit);
    } catch (e) {
      throw ServerException(msg: e.toString());
    }
  }
}
