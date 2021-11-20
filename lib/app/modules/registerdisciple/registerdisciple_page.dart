import 'package:avivaapp/app/core/utils/generic_functions.dart';
import 'package:avivaapp/app/shared/components/loadingscreen.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:avivaapp/app/modules/registerdisciple/registerdisciple_store.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class RegisterdisciplePage extends StatefulWidget {
  final String title;
  const RegisterdisciplePage({Key key, this.title = 'RegisterdisciplePage'})
      : super(key: key);
  @override
  RegisterdisciplePageState createState() => RegisterdisciplePageState();
}

enum SingingCharacter { lafayette, jefferson }

class RegisterdisciplePageState extends State<RegisterdisciplePage> {
  final RegisterdiscipleStore store = Modular.get();
  GenericFunctions genericFunctions = GenericFunctions();
  final _formKey = GlobalKey<FormState>();

  var maskFormatter =  MaskTextInputFormatter(mask: '(##) #####-#####', filter: { "#": RegExp(r'[0-9]') });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:  IconButton(
          icon:  const Icon(Icons.arrow_back),
          onPressed: (){Navigator.pop(context, store.isboolnewUser);}
        ),
        title: Text(
          'Novo Discípulo Aviva',
          style: GoogleFonts.anton(
            color: genericFunctions.getColorFromHex("#f38633"),
            fontSize: 20,
            letterSpacing: 1.0,
          ),
        ),
      ),
      body: SingleChildScrollView(
          child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dados:',
                    style: GoogleFonts.anton(
                      color: genericFunctions.getColorFromHex("#f38633"),
                      fontSize: 20,
                      letterSpacing: 1.0,
                    ),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: "Nome:"),
                    style: const TextStyle(fontSize: 18),
                    onSaved: store.setNome,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "This field can not be empty";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    inputFormatters: [maskFormatter],
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: "Telefone:"),
                    style: const TextStyle(fontSize: 18),
                    onSaved: store.setTelefone,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "This field can not be empty";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Observer(builder: (_) {
                    return DropdownButton<String>(
                        hint: const Text(
                          "Selecione Sexo",
                          style: TextStyle(fontSize: 18),
                        ),
                        isExpanded: true,
                        items: store.cxsexo.map((String dropDownStringItem) {
                          return DropdownMenuItem<String>(
                            value: dropDownStringItem,
                            child: Text(dropDownStringItem),
                          );
                        }).toList(),
                        onChanged: store.setSexo,
                        value: store.sexo);
                  }),
                  const SizedBox(
                    height: 16,
                  ),
                  Observer(builder: (_) {
                    return DropdownButton<String>(
                        hint: const Text(
                          "Selecione Faixa Etária",
                          style: TextStyle(fontSize: 18),
                        ),
                        isExpanded: true,
                        items:
                            store.cxfxEtaria.map((String dropDownStringItem) {
                          return DropdownMenuItem<String>(
                            value: dropDownStringItem,
                            child: Text(dropDownStringItem),
                          );
                        }).toList(),
                        onChanged: store.setFxEtaria,
                        value: store.fxEtaria);
                  }),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Endereço:',
                    style: GoogleFonts.anton(
                      color: genericFunctions.getColorFromHex("#f38633"),
                      fontSize: 20,
                      letterSpacing: 1.0,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Observer(builder: (_) {
                    return DropdownButton(
                      hint: const Text(
                        "Selecione Bairro",
                        style: TextStyle(fontSize: 18),
                      ),
                      isExpanded: true,
                      value: store.bairro,
                      items: store.cxbairros.map((String dropDownStringItem) {
                        return DropdownMenuItem<String>(
                          value: dropDownStringItem,
                          child: Text(dropDownStringItem),
                        );
                      }).toList(),
                      onChanged: (String newValue){
                         store.bairro = newValue;
                      } ,
                    );
                  }),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: "Rua:"),
                    style: const TextStyle(fontSize: 18),
                    onSaved: store.setRua,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "This field can not be empty";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: "N°:"),
                    style: const TextStyle(fontSize: 18),
                    onSaved: store.setNumero,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "This field can not be empty";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  GestureDetector(
                    onTap: () async {
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                       String result = await store.sendNewDisciple();
                       if(result == "Ok") _formKey.currentState.reset();
                        FocusScope.of(context).requestFocus(FocusNode());
                      }
                    },
                    child: Container(
                      height: 52,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: genericFunctions.getColorFromHex("#f38633"),
                          borderRadius: BorderRadius.circular(6)),
                      child: const Center(
                          child: Text(
                        "Registrar",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )),
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                ],
              ),
            ),
          ),
          Observer(builder: (_) {
            if (store.loading) {
              return const Loadingscreen();
            }
            return Container();
          })
        ],
      )),
    );
  }
}
