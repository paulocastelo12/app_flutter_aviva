import 'package:avivaapp/app/core/utils/generic_functions.dart';
import 'package:avivaapp/app/shared/components/loadingscreen.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:avivaapp/app/modules/login/login_store.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key key, this.title = 'LoginPage'}) : super(key: key);
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final LoginStore store = Modular.get();
  GenericFunctions genericFunctions = GenericFunctions();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(
                    height: 100,
                  ),
                  Text(
                    "MINISTÉRIO APOSTÓLICO",
                    style: TextStyle(
                      color: genericFunctions.getColorFromHex("#f38633"),
                      fontSize: 20,
                      letterSpacing: 1.0,
                    ),
                  ),
                  Text(
                    "AVIVA",
                    style: GoogleFonts.anton(
                      color: genericFunctions.getColorFromHex("#f38633"),
                      fontSize: 64,
                      letterSpacing: 1.0,
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.only(top: 32, left: 32, right: 32),
                    child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Observer(builder: (_) {
                              return TextFormField(
                                controller: store.controllerLogin,
                                decoration:
                                    const InputDecoration(labelText: "Login"),
                                style: const TextStyle(fontSize: 20),
                                onChanged: store.setLogin,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "This field can not be empty";
                                  }
                                  return null;
                                },
                              );
                            }),
                            const SizedBox(
                              height: 8,
                            ),
                            Observer(builder: (_) {
                              return TextFormField(
                                controller: store.controllerPassword,
                                decoration: const InputDecoration(
                                    labelText: "Password", counterText: ""),
                                maxLength: 12,
                                style: const TextStyle(fontSize: 20),
                                onChanged: store.setPassword,
                                keyboardType: TextInputType.text,
                                obscureText: true,
                                validator: (value) {
                                  if (value.isNotEmpty && value.length < 6) {
                                    return "Password must contain at least 6 characters";
                                  }
                                  if (value.isEmpty) {
                                    return "This field can not be empty";
                                  }
                                  return null;
                                },
                              );
                            }),
                            const SizedBox(
                              height: 32,
                            ),
                            GestureDetector(
                              onTap: () {
                                if (_formKey.currentState.validate()) {
                                  _formKey.currentState.save();
                                  store.loginAuth();
                                  FocusScope.of(context)
                                      .requestFocus(FocusNode());
                                }
                              },
                              child: Container(
                                height: 52,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    color: genericFunctions
                                        .getColorFromHex("#f38633"),
                                    borderRadius: BorderRadius.circular(6)),
                                child: const Center(
                                    child: Text(
                                  "Login",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                )),
                              ),
                            ),
                          ],
                        )),
                  )
                ],
              ),
            ),
            Observer(builder: (_) {
              if (store.loading) {
                return const Loadingscreen();
              }
              return Container();
            })
          ],
        ),
      ),
    );
  }
}
