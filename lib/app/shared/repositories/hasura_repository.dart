import 'package:flutter_modular/flutter_modular.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:shopping_list_mobx/app/shared/models/list_item.dart';
import 'package:shopping_list_mobx/app/shared/models/shopping_list.dart';
import 'package:shopping_list_mobx/app/shared/models/user_model.dart';
import 'package:shopping_list_mobx/app/shared/repositories/repositories_interface.dart';

class HasuraRepository extends Disposable implements IRepository {
  final HasuraConnect _repo = HasuraConnect(
      "https://shoppinglistflutter.herokuapp.com/v1/graphql",
      headers: {
        "X-Hasura-Role": "admin",
        "X-Hasura-Admin-Secret": "bmsrangel",
      });

  @override
  Future<String> createUser(UserModel user) async {
    String query = r"""
      mutation createUser($name:String!, $lastName:String!, $email:String!, $password:String!) {
        insert_users(objects: {nome: $name, sobrenome: $lastName, email: $email, senha: $password}) {
          returning {
            id
          }
        }
      }
    """;
    try {
      var data = await _repo.mutation(query, variables: {
        "name": user.nome,
        "lastName": user.sobrenome,
        "email": user.email,
        "password": user.senha,
      });
      return data["data"]["insert_users"]["returning"][0]["id"];
    } on HasuraError catch (e) {
      print(e);
      throw e;
      // throw e;
    }
  }

  @override
  Future<void> deleteShoppingList(String id) {
    // TODO: implement deleteShoppingList
    throw UnimplementedError();
  }

  @override
  Future<void> deleteShoppingListItem(int id) {
    // TODO: implement deleteShoppingListItem
    throw UnimplementedError();
  }

  @override
  List<ShoppingList> getAllShoppingLists() {
    String query = """
      subscription getAllShoppingLists {
        shopping_lists {
          id
          name
          created_at
          items {
            id
            name
            completed
          }
        }
      }
    """;
    // String query = """
    //   query getAllShoppingLists {
    //     shopping_lists(order_by: {created_at: desc}) {
    //       id
    //       name
    //       items {
    //         id
    //         name
    //         completed
    //       }
    //     }
    //   }
    // """;
    Snapshot data = _repo.subscription(query).convert<List<ShoppingList>>(
          (data) => data["data"]["shopping_lists"]
              .map<ShoppingList>((lista) => ShoppingList.fromJson(lista))
              .toList(),
          cachePersist: (List<ShoppingList> listas) => {
            "data": {
              "shopping_lists":
                  listas.map((ShoppingList lista) => lista.toJson()).toList()
            }
          },
        );
    return data.value;
  }

  @override
  Future<List<ListItem>> getShoppingListItems(String id) {
    // TODO: implement getShoppingListItems
    throw UnimplementedError();
  }

  @override
  Future<String> login(String email, String password) async {
    String query = r"""
      query login($email: String!, $password: String!) {
        users(where: {email: {_eq: $email}, senha: {_eq: $password}}) {
          id
        }
      }
    """;
    try {
      var data = await _repo.query(query, variables: {
        "email": email,
        "password": password,
      });

      if (data["data"]["users"].length > 0)
        return data["data"]["users"][0]["id"];
      else
        throw "User not found";
    } on HasuraError catch (e) {
      print(e.message);
    }
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
