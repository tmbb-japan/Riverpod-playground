import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theory_rvp/model/shopping_item_model.dart';
import 'package:theory_rvp/riverpod/state_notifier_provider.dart';

final filteredShoppingListProvider = Provider<List<ShoppingItemModel>>(
  (ref) {
    final filterState = ref.watch(filterProvider);
    final ShoppingListState = ref.watch(ShoppingListProvider);

    if (filterState == FilterState.all) {
      return ShoppingListState;
    }

    return ShoppingListState.where(
      (element) =>
          filterState == FilterState.spicy ? element.isSpicy : !element.isSpicy,
    ).toList();
  },
);

enum FilterState {
  notSpicy,
  spicy,
  all,
}

final filterProvider = StateProvider<FilterState>((ref) => FilterState.all);
