// ignore_for_file: must_call_super

import 'package:avivaapp/app/core/models/disciple_model.dart';
import 'package:avivaapp/app/core/utils/generic_functions.dart';
import 'package:avivaapp/app/shared/components/loadingscreen.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:avivaapp/app/modules/detailsdisciple/detailsdisciple_store.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsdisciplePage extends StatefulWidget {
  final String title;
  final DiscipleModel disciplemodel;
  const DetailsdisciplePage(
      {Key key,
      this.title = 'DetailsdisciplePage',
      @required this.disciplemodel})
      : super(key: key);
  @override
  DetailsdisciplePageState createState() => DetailsdisciplePageState();
}

class DetailsdisciplePageState extends State<DetailsdisciplePage> {
  final DetailsdiscipleStore store = Modular.get();
  GenericFunctions genericFunctions = GenericFunctions();

  DiscipleModel discipleModel;

  @override
  void initState() {
    discipleModel = widget.disciplemodel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         leading:  IconButton(
          icon:  const Icon(Icons.arrow_back),
          onPressed: (){Navigator.pop(context, false);}
        ),
        title: Text(
          
          discipleModel.name,
          style: GoogleFonts.anton(
            color: genericFunctions.getColorFromHex("#f38633"),
            fontSize: 20,
            letterSpacing: 1.0,
          ),
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16, top: 16),
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Text("Data: ",
                          style: TextStyle(
                              fontSize: 18,
                              color:
                                  genericFunctions.getColorFromHex("#f38633"),
                              fontWeight: FontWeight.bold)),
                      Text(
                          store
                              .formatDateHr(discipleModel.createdAt)
                              .substring(0, 10),
                          style: const TextStyle(fontSize: 18)),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Text("Telefone: ",
                          style: TextStyle(
                              fontSize: 18,
                              color:
                                  genericFunctions.getColorFromHex("#f38633"),
                              fontWeight: FontWeight.bold)),
                      Text(discipleModel.phone,
                          style: const TextStyle(fontSize: 18)),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Text("Gênero: ",
                          style: TextStyle(
                              fontSize: 18,
                              color:
                                  genericFunctions.getColorFromHex("#f38633"),
                              fontWeight: FontWeight.bold)),
                      Text(discipleModel.gender,
                          style: const TextStyle(fontSize: 18)),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Text("Faixa Etária: ",
                          style: TextStyle(
                              fontSize: 18,
                              color:
                                  genericFunctions.getColorFromHex("#f38633"),
                              fontWeight: FontWeight.bold)),
                      Text(discipleModel.ageGroup,
                          style: const TextStyle(fontSize: 18)),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Divider(),
                  Row(
                    children: [
                      Text("Bairro: ",
                          style: TextStyle(
                              fontSize: 18,
                              color:
                                  genericFunctions.getColorFromHex("#f38633"),
                              fontWeight: FontWeight.bold)),
                      Text(discipleModel.district,
                          style: const TextStyle(fontSize: 18)),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Text("Rua: ",
                          style: TextStyle(
                              fontSize: 18,
                              color:
                                  genericFunctions.getColorFromHex("#f38633"),
                              fontWeight: FontWeight.bold)),
                      Text(discipleModel.street,
                          style: const TextStyle(fontSize: 18)),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Text("N°: ",
                          style: TextStyle(
                              fontSize: 18,
                              color:
                                  genericFunctions.getColorFromHex("#f38633"),
                              fontWeight: FontWeight.bold)),
                      Text(discipleModel.number,
                          style: const TextStyle(fontSize: 18)),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: GestureDetector(
                        onTap: () async {
                          String result = await store.delete(discipleModel.sId);
                          if(result == "Ok") Navigator.pop(context, true);
                        },
                        child: Container(
                          height: 52,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(6)),
                          child: Center(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.delete),
                              Text(
                                "Deletar",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ],
                          )),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
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
      ),
    );
  }
}
