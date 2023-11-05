import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:german_management_app/core/error/exception.dart';
import 'package:german_management_app/product/data/models/product_model.dart';

abstract class ProductDatasource {
  Future<List<ProductModel>> getProductList();
  Future<Unit> createProduct(ProductModel productModel);
  Future<Unit> deleteProduct(String docId);
  Future<Unit> updateProduct(ProductModel productModel);
}

class ProductFirebaseDatasource extends ProductDatasource {
  var db = FirebaseFirestore.instance;
  String collectionPath = "products";

  @override
  Future<Unit> createProduct(ProductModel productModel) async {
    try {
      db.collection(collectionPath).add(productModel.toMap());
      return Future.value(unit);
    } catch (e) {
      throw ServerException(msg: e.toString());
    }
  }

  @override
  Future<Unit> deleteProduct(String docId) {
    try {
      db.collection(collectionPath).doc(docId).delete();
      return Future.value(unit);
    } catch (e) {
      throw ServerException(msg: e.toString());
    }
  }

  @override
  Future<List<ProductModel>> getProductList() async {
    try {
      CollectionReference collectionReference = db.collection(collectionPath);
      QuerySnapshot querySnapshot = await collectionReference.get();
      final data = querySnapshot.docs.map((e) {
        return ProductModel.fromQuery(e);
      }).toList();
      print(data);
      return data;
    } catch (e) {
      throw ServerException(msg: e.toString());
    }
  }

  @override
  Future<Unit> updateProduct(ProductModel productModel) {
    try {
      db
          .collection(collectionPath)
          .doc(productModel.docId)
          .update(productModel.toMap());
      return Future.value(unit);
    } catch (e) {
      throw ServerException(msg: e.toString());
    }
  }
}
