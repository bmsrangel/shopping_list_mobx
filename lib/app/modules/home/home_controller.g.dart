// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeBase, Store {
  final _$allShoppingListsListAtom =
      Atom(name: '_HomeBase.allShoppingListsList');

  @override
  ObservableList<ShoppingList> get allShoppingListsList {
    _$allShoppingListsListAtom.context
        .enforceReadPolicy(_$allShoppingListsListAtom);
    _$allShoppingListsListAtom.reportObserved();
    return super.allShoppingListsList;
  }

  @override
  set allShoppingListsList(ObservableList<ShoppingList> value) {
    _$allShoppingListsListAtom.context.conditionallyRunInAction(() {
      super.allShoppingListsList = value;
      _$allShoppingListsListAtom.reportChanged();
    }, _$allShoppingListsListAtom,
        name: '${_$allShoppingListsListAtom.name}_set');
  }

  final _$selectedListAtom = Atom(name: '_HomeBase.selectedList');

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

  final _$_initAsyncAction = AsyncAction('_init');

  @override
  Future _init() {
    return _$_initAsyncAction.run(() => super._init());
  }

  final _$addShoppingListAsyncAction = AsyncAction('addShoppingList');

  @override
  Future addShoppingList(ShoppingList list) {
    return _$addShoppingListAsyncAction.run(() => super.addShoppingList(list));
  }

  final _$deleteShoppingListAsyncAction = AsyncAction('deleteShoppingList');

  @override
  Future deleteShoppingList(ShoppingList list) {
    return _$deleteShoppingListAsyncAction
        .run(() => super.deleteShoppingList(list));
  }
}
