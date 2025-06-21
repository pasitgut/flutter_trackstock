import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_trackstock/data/models/item_model.dart';
import 'package:flutter_trackstock/data/repositories/item_repository.dart';

final itemRepositoryProvider = Provider<ItemRepository>((ref) {
  return ItemRepository();
});

final itemListProvider = StreamProvider<List<Item>>((ref) {
  return ref.watch(itemRepositoryProvider).watchAllItems();
});

final itemByIdProvider = FutureProvider.family<Item?, String>((ref, id) {
  return ref.watch(itemRepositoryProvider).getItemById(id);
});
