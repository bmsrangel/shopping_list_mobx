import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shopping_list_mobx/app/modules/single_list/single_list_controller.dart';
import 'package:shopping_list_mobx/app/shared/models/list_item.dart';

class AddItemWidget extends StatelessWidget {
  final SingleListController controller = Modular.get();

  @override
  Widget build(BuildContext context) {
    TextEditingController newListItem = TextEditingController();
    return AlertDialog(
      title: Text("Adicionar item"),
      content: TextField(
        controller: newListItem,
        maxLines: 1,
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
          hintText: "Novo item",
        ),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text("Cancelar"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        FlatButton(
          child: Text("Adicionar"),
          onPressed: () {
            ListItem newItem = ListItem(description: newListItem.text);
            controller.addShoppingItem(newItem);
            Navigator.pop(context);
          },
        )
      ],
    );
  }
}
