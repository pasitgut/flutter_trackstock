import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_trackstock/data/models/item_model.dart';
import 'package:flutter_trackstock/data/providers/item_provider.dart';
import 'package:flutter_trackstock/widgets/loading_widget.dart';
import 'package:go_router/go_router.dart';

final List<Map<String, dynamic>> items = const [
  {'name': "Soup", 'quantity': 10},
  {'name': "Shampoo", 'quantity': 5},
];

class ItemScreen extends ConsumerWidget {
  const ItemScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemList = ref.watch(itemListProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Items"),
        // leading: IconButton(
        //   onPressed: () {
        //     context.go('/');
        //   },
        //   icon: const Icon(Icons.arrow_back),
        // ),
      ),
      body: itemList.when(
        loading: () => LoadingWidget(),
        error: (e, _) => Center(child: Text("Fail to load data: $e")),
        data: (items) {
          if (items.isEmpty) {
            return const Center(child: Text("Data not found"));
          }
          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final Item item = items[index];
              return ListTile(
                leading: const Icon(Icons.inventory_2),
                title: Text(item.name),
                subtitle: Text("quantity: ${item.quantity} ${item.unit}"),
                trailing:
                    item.quantity <= item.minQuantity
                        ? const Icon(Icons.warning, color: Colors.red)
                        : null,
                onTap: () {
                  //
                },
              );
            },
          );
        },
      ),
    );
  }
}
