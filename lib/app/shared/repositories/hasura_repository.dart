import 'package:flutter_modular/flutter_modular.dart';
import 'package:shopping_list_mobx/app/shared/models/list_item.dart';
import 'package:shopping_list_mobx/app/shared/models/shopping_list.dart';
import 'package:shopping_list_mobx/app/shared/models/user_model.dart';
import 'package:shopping_list_mobx/app/shared/repositories/repositories_interface.dart';

class HasuraRepository extends Disposable implements IRepository {
  @override
  Future<String> createUser(UserModel user) {
    // TODO: implement createUser
    throw UnimplementedError();
  }

  @override
  Future<List<ShoppingList>> getAllShoppingLists() {
    // TODO: implement getAllShoppingLists
    throw UnimplementedError();
  }

  @override
  Future<ShoppingList> getShoppingList(String id) {
    // TODO: implement getShoppingList
    throw UnimplementedError();
  }

  @override
  Future<List<ListItem>> getShoppingListItems(String id) {
    // TODO: implement getShoppingListItems
    throw UnimplementedError();
  }

  @override
  Future<String> login(String email, String password) {
    // TODO: implement login
    throw UnimplementedError();
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
