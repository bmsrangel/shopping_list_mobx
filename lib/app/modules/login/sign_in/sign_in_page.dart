import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shopping_list_mobx/app/modules/login/sign_in/sign_in_controller.dart';

class SignInPage extends StatefulWidget {
  final String title;
  const SignInPage({Key key, this.title = "SignIn"}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends ModularState<SignInPage, SignInController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: controller.nome$,
              decoration: InputDecoration(labelText: "Nome"),
            ),
            TextField(
              controller: controller.sobrenome$,
              decoration: InputDecoration(labelText: "Sobrenome"),
            ),
            TextField(
              controller: controller.email$,
              decoration: InputDecoration(labelText: "E-mail"),
            ),
            TextField(
              controller: controller.senha$,
              decoration: InputDecoration(labelText: "Senha"),
            ),
            FlatButton(
              child: Text("Ok"),
              onPressed: () async {
                print("entrou");
                await controller.cadastrar();
                Modular.to.pushReplacementNamed("/home");
              },
            )
          ],
        ),
      ),
    );
  }
}
