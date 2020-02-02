import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:shopping_list_mobx/app/shared/models/shopping_list.dart';
import 'package:shopping_list_mobx/app/shared/services/local_storage_interface.dart';

part 'home_controller.g.dart';

class HomeController = _HomeBase with _$HomeController;

abstract class _HomeBase with Store {
  ILocalStorage _storage = Modular.get();
  _HomeBase() {
    _init();
  }

  @observable
  ObservableList<ShoppingList> allShoppingListsList =
      <ShoppingList>[].asObservable();

  @observable
  ShoppingList selectedList;

  @action
  _init() async {
    final fullList = await _storage.getAllShoppingLists();
    if (fullList != null) allShoppingListsList = fullList.asObservable();
  }

  @action
  addShoppingList(ShoppingList list) async {
    list = await _storage.addShoppingList(list);
    allShoppingListsList.add(list);
  }

  @action
  deleteShoppingList(ShoppingList list) async {
    int index = allShoppingListsList.indexWhere((item) => item.id == list.id);
    allShoppingListsList.removeWhere((item) => item.id == list.id);
    _storage.deleteShoppingList(index);
  }
}
