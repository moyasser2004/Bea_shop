String calculateCartItem(
    {required int itemsPrice,
    required int itemsDiscount,
    required int cartItemCount}) {
  double discountedPrice =
      itemsPrice - (itemsDiscount / 100 * itemsPrice);
  double total = discountedPrice * cartItemCount;
  return total.toString();
}

String calculateCartItemTotal({
  required int itemsPrice,
  required int itemsDiscount,
  required int cartItemCount,
  required int cartPromoCodeDiscount,
  required int delivery,
}) {
  double discountedPrice =
      itemsPrice - (itemsDiscount / 100 * itemsPrice);
  double total = (discountedPrice * cartItemCount) -
      cartPromoCodeDiscount +
      delivery;
  return total.toString();
}
