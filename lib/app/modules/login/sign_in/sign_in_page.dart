import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shopping_list_mobx/app/modules/login/sign_in/sign_in_controller.dart';

class SignInPage extends StatefulWidget {
  final String title;
  const SignInPage({Key key, this.title = "Crie sua conta"}) : super(key: key);

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
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Form(
            key: controller.formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: controller.nome$,
                  decoration: InputDecoration(labelText: "Nome"),
                  validator: (nome) {
                    if (nome.isEmpty)
                      return "Este campo não pode ficar em branco";
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: controller.sobrenome$,
                  decoration: InputDecoration(labelText: "Sobrenome"),
                  validator: (sobrenome) {
                    if (sobrenome.isEmpty)
                      return "Este campo não pode ficar em branco";
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: controller.email$,
                  decoration: InputDecoration(labelText: "E-mail"),
                  validator: (email) {
                    if (email.isEmpty)
                      return "Este campo não pode ficar em branco";
                    else if (!email.contains("@"))
                      return "Formato de e-mail inválido";
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: controller.senha$,
                  decoration: InputDecoration(labelText: "Senha"),
                  validator: (senha) {
                    if (senha.isEmpty)
                      return "Este campo não pode ficar em branco";
                    else if (senha.length < 6)
                      return "Senha muito curta (mínimo de 6 caracteres)";
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                RaisedButton(
                  child: Container(
                    width: MediaQuery.of(context).size.width * .6,
                    alignment: Alignment.center,
                    child: Text(
                      "Cadastrar",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                  onPressed: () async {
                    if (controller.formKey.currentState.validate()) {
                      await controller.cadastrar();
                      Modular.to.pushNamedAndRemoveUntil(
                          "/home", (Route<dynamic> route) => false);
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
