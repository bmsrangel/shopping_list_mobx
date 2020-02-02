// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'single_list_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SingleListController on _SingleListBase, Store {
  final _$selectedListAtom = Atom(name: '_SingleListBase.selectedList');

  @override
  ShoppingList get selectedList {
    _$selectedListAtom.context.enforceReadPolicy(_$selectedListAtom);
    _$selectedListAtom.reportObserved();
    return super.selectedList;
  }

  @override
  set selectedList(ShoppingList value) {
    _$selectedListAtom.context.conditionallyRunInAction(() {
      super.selectedList = value;
      _$selectedListAtom.reportChanged();
    }, _$selectedListAtom, name: '${_$selectedListAtom.name}_set');
  }

  final _$shoppingItemsAtom = Atom(name: '_SingleListBase.shoppingItems');

  @override
  ObservableList<ListItem> get shoppingItems {
    _$shoppingItemsAtom.context.enforceReadPolicy(_$shoppingItemsAtom);
    _$shoppingItemsAtom.reportObserved();
    return super.shoppingItems;
  }

  @override
  set shoppingItems(ObservableList<ListItem> value) {
    _$shoppingItemsAtom.context.conditionallyRunInAction(() {
      super.shoppingItems = value;
      _$shoppingItemsAtom.reportChanged();
    }, _$shoppingItemsAtom, name: '${_$shoppingItemsAtom.name}_set');
  }

  final _$addShoppingItemAsyncAction = AsyncAction('addShoppingItem');

  @override
  Future addShoppingItem(ListItem item) {
    return _$addShoppingItemAsyncAction.run(() => super.addShoppingItem(item));
  }

  final _$changeCheckStatusAsyncAction = AsyncAction('changeCheckStatus');

  @override
  Future changeCheckStatus(ListItem listItem, bool check) {
    return _$changeCheckStatusAsyncAction
        .run(() => super.changeCheckStatus(listItem, check));
  }

  final _$deleteListItemAsyncAction = AsyncAction('deleteListItem');

  @override
  Future deleteListItem(int index) {
    return _$deleteListItemAsyncAction.run(() => super.deleteListItem(index));
  }

  final _$_SingleListBaseActionController =
      ActionController(name: '_SingleListBase');

  @override
  dynamic setSelectedList(ShoppingList list) {
    final _$actionInfo = _$_SingleListBaseActionController.startAction();
    try {
      return super.setSelectedList(list);
    } finally {
      _$_SingleListBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setShoppingItems(ShoppingList list) {
    final _$actionInfo = _$_SingleListBaseActionController.startAction();
    try {
      return super.setShoppingItems(list);
    } finally {
      _$_SingleListBaseActionController.endAction(_$actionInfo);
    }
  }
}
