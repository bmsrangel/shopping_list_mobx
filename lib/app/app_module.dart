<<<<<<< HEAD
import 'package:shopping_list_mobx/app/modules/login/sign_in/sign_in_page.dart';
import 'package:shopping_list_mobx/app/shared/services/secure_storage_service.dart';
=======
>>>>>>> parent of 62e1693... Added login
import 'package:shopping_list_mobx/app/modules/single_list/single_list_module.dart';
import 'package:shopping_list_mobx/app/shared/repositories/hasura_repository.dart';
import 'package:shopping_list_mobx/app/shared/services/local_storage_service.dart';
import 'package:shopping_list_mobx/app/app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:shopping_list_mobx/app/app_widget.dart';
import 'package:shopping_list_mobx/app/modules/home/home_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HasuraRepository()),
        Bind((i) => LocalStorageService()),
        Bind((i) => AppController()),
      ];

  @override
  List<Router> get routers => [
<<<<<<< HEAD
        Router('/', module: SplashModule()),
        Router('/home', module: HomeModule()),
        Router('/login', module: LoginModule()),
        Router('/signin', child: (_, args) => SignInPage()),
        Router('/list', module: SingleListModule())
=======
        Router('/', module: HomeModule()),
        Router(
          '/list',
          module: SingleListModule(),
        )
>>>>>>> parent of 62e1693... Added login
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
