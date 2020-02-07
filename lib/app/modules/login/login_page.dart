import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shopping_list_mobx/app/modules/login/login_controller.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key key, this.title = "Shopping List App"})
      : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey,
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
          key: controller.formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: controller.email$,
                decoration: InputDecoration(labelText: "E-mail"),
                keyboardType: TextInputType.emailAddress,
                validator: (email) {
                  if (email.isEmpty)
                    return "Este campo não pode ficar em branco";
                  else if (!email.contains("@"))
                    return "Formato de e-mail inválido";
                  return null;
                },
              ),
              Observer(builder: (_) {
                return TextFormField(
                  controller: controller.password$,
                  decoration: InputDecoration(
                    labelText: "Senha",
                    suffixIcon: IconButton(
                      icon: Icon(controller.obscureText
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: controller.setObscureText,
                    ),
                  ),
                  obscureText: controller.obscureText,
                  validator: (senha) {
                    if (senha.isEmpty)
                      return "Este campo não pode ficar em branco";
                    else if (senha.length < 6)
                      return "Senha muito curta (mínimo de 6 caracteres)";
                    return null;
                  },
                );
              }),
              SizedBox(height: 20),
              RaisedButton(
                color: Theme.of(context).primaryColor,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  child: Text("Entrar",
                      style: TextStyle(color: Colors.white, fontSize: 16)),
                ),
                onPressed: () async {
                  try {
                    if (controller.formKey.currentState.validate()) {
                      await controller.login();
                      // if (controller.uid != null && controller.uid.isNotEmpty)
                      Modular.to.pushReplacementNamed('/home');
                    }
                  } catch (e) {
                    if (e == "User not found") {
                      controller.scaffoldKey.currentState.showSnackBar(SnackBar(
                        content: Text("Usuário ou senha incorretos"),
                        duration: Duration(seconds: 2),
                      ));
                    }
                  }
                },
              ),
              SizedBox(height: 50),
              Text(
                "Novo na área?",
                style: TextStyle(fontSize: 15),
              ),
              FlatButton(
                padding: EdgeInsets.zero,
                child: Text(
                  "Crie sua conta!",
                  style: TextStyle(fontSize: 15),
                ),
                onPressed: () {
                  Modular.to.pushNamed('/signin');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
