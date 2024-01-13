import 'package:foodappseller/consts/consts.dart';

class StoreServices {
  static getProfile(uid) {
    return firestore
        .collection(vendorsCollection)
        .where('id', isEqualTo: uid)
        .get();
  }

  static getOrders() {
    return firestore
        .collection(ordersCollection)
        .where('orders')
        .snapshots();
  }

  static getProducts(uid) {
    return firestore
        .collection(productsCollection)
        .where('vendor_id')
        .snapshots();
  }
}
