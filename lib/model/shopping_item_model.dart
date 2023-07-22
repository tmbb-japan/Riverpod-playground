class ShoppingItemModel {
  final String name;
  final int qunatity;
  final bool hasBought;
  final bool isSpicy;

  ShoppingItemModel({
    required this.name,
    required this.qunatity,
    required this.hasBought,
    required this.isSpicy,
  });

  ShoppingItemModel copywith({
    String? name,
    int? qunatity,
    bool? hasBought,
    bool? isSpicy,
  }) {
    return ShoppingItemModel(
      name: name ?? this.name,
      qunatity: qunatity ?? this.qunatity,
      hasBought: hasBought ?? this.hasBought,
      isSpicy: isSpicy ?? this.isSpicy,
    );
  }
}
