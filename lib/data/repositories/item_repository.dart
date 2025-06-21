import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_trackstock/data/models/item_model.dart';

class ItemRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final String _collection = "items";

  Stream<List<Item>> watchAllItems() {
    return _db
        .collection(_collection)
        .orderBy('createAt', descending: true)
        .snapshots()
        .map((snapshot) {
          return snapshot.docs
              .map((doc) => Item.fromMap(doc.data(), doc.id))
              .toList();
        });
  }

  Future<void> addItem(Item item) async {
    await _db.collection(_collection).add(item.toMap());
  }

  Future<void> updateItem(Item item) async {
    await _db.collection(_collection).doc(item.id).update(item.toMap());
  }

  Future<void> deleteItem(String id) async {
    await _db.collection(_collection).doc(id).delete();
  }

  Future<Item?> getItemById(String id) async {
    final doc = await _db.collection(_collection).doc(id).get();
    if (doc.exists) {
      return Item.fromMap(doc.data()!, doc.id);
    }
    return null;
  }
}
