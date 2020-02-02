import 'package:shopping_list_mobx/app/shared/models/shopping_list.dart';

abstract class ILocalStorage {
  Future<List<ShoppingList>> getAllShoppingLists();
  Future<ShoppingList> addShoppingList(ShoppingList list);
  Future<ShoppingList> updateShoppingList(ShoppingList list);
  void deleteShoppingList(int index);
}
