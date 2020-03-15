import 'package:shopping_list_mobx/app/shared/models/list_item.dart';
import 'package:shopping_list_mobx/app/shared/models/shopping_list.dart';
import 'package:shopping_list_mobx/app/shared/models/user_model.dart';

abstract class IRepository {
  Future<String> createUser(UserModel user);
  Future<String> login(String email, String password);
  Future<List<ShoppingList>> getAllShoppingLists();
  Future<ShoppingList> getShoppingList(String id);
  Future<List<ListItem>> getShoppingListItems(String id);
}
