import 'package:shopping_list_mobx/app/modules/single_list/single_list_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shopping_list_mobx/app/modules/single_list/single_list_page.dart';

class SingleListModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => SingleListController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => SingleListPage(list: args.data)),
      ];

  static Inject get to => Inject<SingleListModule>.of();
}
