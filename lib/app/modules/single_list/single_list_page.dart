import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shopping_list_mobx/app/modules/single_list/single_list_controller.dart';
import 'package:shopping_list_mobx/app/shared/models/list_item.dart';
import 'package:shopping_list_mobx/app/shared/models/shopping_list.dart';

import 'components/add_item/add_item_widget.dart';

class SingleListPage extends StatefulWidget {
  final String title;
  final ShoppingList list;
  const SingleListPage({Key key, this.title = "SingleList", this.list})
      : super(key: key);

  @override
  _SingleListPageState createState() => _SingleListPageState();
}

class _SingleListPageState
    extends ModularState<SingleListPage, SingleListController> {
  @override
  void initState() {
    controller.setSelectedList(widget.list);
    controller.setShoppingItems(widget.list);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // selectedList.items.add(ListItem(description: "Teste de item"));
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.list.name,
          style: TextStyle(fontSize: MediaQuery.of(context).size.height * .03),
        ),
        centerTitle: true,
      ),
      body: Observer(
        builder: (_) {
          if (controller.shoppingItems == null)
            return Center(
              child: CircularProgressIndicator(),
            );
          return ListView.separated(
            itemCount: controller.shoppingItems.length,
            separatorBuilder: (BuildContext context, int index) => Divider(),
            itemBuilder: (BuildContext context, int index) {
              ListItem listItem = controller.shoppingItems[index];
              return Dismissible(
                child: ListTile(
                  title: Text(
                    listItem.description,
                    style: TextStyle(
                        fontSize: 18,
                        decoration: listItem.checked
                            ? TextDecoration.lineThrough
                            : null,
                        color: listItem.checked ? Colors.grey : Colors.black),
                  ),
                  trailing: Checkbox(
                    value: listItem.checked,
                    onChanged: (bool value) {
                      controller.changeCheckStatus(listItem, value);
                    },
                  ),
                ),
                key: Key(listItem.description),
                background: Container(
                  padding: EdgeInsets.only(right: 20),
                  color: Colors.red,
                  alignment: Alignment.centerRight,
                  child: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                ),
                direction: DismissDirection.endToStart,
                confirmDismiss: (direction) {
                  Future<bool> result = Future.value(false);
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Deseja remover o item da lista?"),
                          content: Text("Esta ação é irreversível!"),
                          actions: <Widget>[
                            FlatButton(
                              child: Text("Cancelar"),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                            FlatButton(
                              child: Text("Confirmar"),
                              onPressed: () {
                                controller.deleteListItem(index);
                                Navigator.pop(context);
                                result = Future.value(true);
                              },
                            ),
                          ],
                        );
                      });
                  return result;
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showDialog(context: context, builder: ((context) => AddItemWidget()));
        },
      ),
    );
  }
}
