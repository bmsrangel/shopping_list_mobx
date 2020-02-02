import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shopping_list_mobx/app/shared/models/shopping_list.dart';

import 'local_storage_interface.dart';

class LocalStorageService extends Disposable implements ILocalStorage {
  Completer<Box> _completer = Completer<Box>();

  LocalStorageService() {
    _init();
  }

  _init() async {
    final directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);
    final box = Hive.openBox("shoppingLists");
    if (!_completer.isCompleted) _completer.complete(box);
  }

  @override
  Future<ShoppingList> addShoppingList(ShoppingList list) async {
    final box = await _completer.future;
    list.id = box.values.length;
    box.put(box.values.length, list.toJson());
    return list;
  }

  @override
  void deleteShoppingList(int index) async {
    final box = await _completer.future;
    box.deleteAt(index);
  }

  @override
  Future<List<ShoppingList>> getAllShoppingLists() async {
    final box = await _completer.future;
    return box.values.map((item) => ShoppingList.fromJson(item)).toList();
  }

  @override
  Future<ShoppingList> updateShoppingList(ShoppingList list) async {
    final box = await _completer.future;
    box.putAt(list.id, list.toJson());
    return list;
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
