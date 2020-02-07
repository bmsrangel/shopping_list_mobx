import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shopping_list_mobx/app/modules/home/home_controller.dart';
import 'package:shopping_list_mobx/app/shared/models/shopping_list.dart';
import 'package:shopping_list_mobx/app/shared/services/secure_storage_interface.dart';

import 'components/add_box/add_box_widget.dart';
import 'components/list_tile/list_tile_widget.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Minhas Listas"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  final ISecureStorage _secureStorage = Modular.get();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(fontSize: MediaQuery.of(context).size.height * .03),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.power_settings_new),
            onPressed: () {
              _secureStorage.clearUid();
              Modular.to.pushNamedAndRemoveUntil(
                  "/login", (Route<dynamic> route) => false);
            },
          )
        ],
      ),
      body: Observer(
        builder: (_) {
          return ListView.separated(
            itemCount: controller.allShoppingListsList.length,
            separatorBuilder: (BuildContext context, int index) => Divider(),
            itemBuilder: (BuildContext context, int index) {
              ShoppingList item = controller.allShoppingListsList[index];
              return Dismissible(
                key: Key(item.name),
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
                                controller.deleteShoppingList(
                                    controller.allShoppingListsList[index]);
                                Navigator.pop(context);
                                result = Future.value(true);
                              },
                            ),
                          ],
                        );
                      });
                  return result;
                },
                child: ListTileWidget(
                  item: item,
                  controller: controller,
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AddBoxWidget();
              });
        },
      ),
    );
  }
}
