import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:shopping_list_mobx/app/shared/models/list_item.dart';
import 'package:shopping_list_mobx/app/shared/models/shopping_list.dart';
import 'package:shopping_list_mobx/app/shared/services/local_storage_interface.dart';

part 'single_list_controller.g.dart';

class SingleListController = _SingleListBase with _$SingleListController;

abstract class _SingleListBase with Store {
  final ILocalStorage _storage = Modular.get();

  @observable
  ShoppingList selectedList;

  @observable
  ObservableList<ListItem> shoppingItems = <ListItem>[].asObservable();

  @action
  setSelectedList(ShoppingList list) => selectedList = list;

  @action
  setShoppingItems(ShoppingList list) =>
      shoppingItems = list.items.asObservable();

  @action
  addShoppingItem(ListItem item) async {
    selectedList.items.add(item);
    ShoppingList aux = await _storage.updateShoppingList(selectedList);
    shoppingItems = aux.items.asObservable();
  }

  @action
  changeCheckStatus(ListItem listItem, bool check) async {
    selectedList.items[selectedList.items.indexOf(listItem)].checked = check;
    ShoppingList aux = await _storage.updateShoppingList(selectedList);
    shoppingItems = aux.items.asObservable();
  }

  @action
  deleteListItem(int index) async {
    selectedList.items.removeAt(index);
    ShoppingList aux = await _storage.updateShoppingList(selectedList);
    shoppingItems = aux.items.asObservable();
  }
}
