import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shopping_list_mobx/app/modules/home/home_controller.dart';
import 'package:shopping_list_mobx/app/shared/models/list_item.dart';
import 'package:shopping_list_mobx/app/shared/models/shopping_list.dart';

class ListTileWidget extends StatelessWidget {
  final ShoppingList item;
  final HomeController controller;

  ListTileWidget({this.item, this.controller});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        item.name,
        style: Theme.of(context).textTheme.title,
      ),
      subtitle: Text("${item.creationDate.toString()}",
          style: Theme.of(context).textTheme.subhead),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Text(
            "Total de itens: ${item.items.length}",
            style: Theme.of(context).textTheme.subtitle,
          ),
          Text(
            "Itens concluídos: ${_countConcluded(item)}",
            style: Theme.of(context).textTheme.subtitle,
          ),
        ],
      ),
      onTap: () {
        controller.selectedList = item;
        print(controller.selectedList.name);
        Modular.to.pushNamed('/list', arguments: item);
      },
    );
  }

  int _countConcluded(ShoppingList list) {
    int concluded = 0;
    for (ListItem listItem in item.items) {
      if (listItem.checked) {
        concluded++;
      }
    }
    return concluded;
  }
}
