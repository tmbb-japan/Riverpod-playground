import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theory_rvp/model/shopping_item_model.dart';

final ShoppingListProvider =
    StateNotifierProvider<ShoppingListNotifier, List<ShoppingItemModel>>(
  (ref) => ShoppingListNotifier(),
);

class ShoppingListNotifier extends StateNotifier<List<ShoppingItemModel>> {
  ShoppingListNotifier()
      : super(
          [
            ShoppingItemModel(
              name: '김치',
              qunatity: 3,
              hasBought: false,
              isSpicy: true,
            ),
            ShoppingItemModel(
              name: '라면',
              qunatity: 5,
              hasBought: false,
              isSpicy: true,
            ),
            ShoppingItemModel(
              name: '삼겹살',
              qunatity: 10,
              hasBought: false,
              isSpicy: false,
            ),
            ShoppingItemModel(
              name: '수박',
              qunatity: 2,
              hasBought: false,
              isSpicy: false,
            ),
            ShoppingItemModel(
              name: '카스테라',
              qunatity: 5,
              hasBought: false,
              isSpicy: false,
            ),
          ],
        );

  void toggleHasBought({required String name}) {
    state = state
        .map((e) => e.name == name
            ? ShoppingItemModel(
                name: e.name,
                qunatity: e.qunatity,
                hasBought: !e.hasBought,
                isSpicy: e.isSpicy,
              )
            : e)
        .toList();
  }
}
