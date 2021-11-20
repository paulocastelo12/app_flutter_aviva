import 'package:avivaapp/app/core/models/disciple_model.dart';
import 'package:avivaapp/app/core/utils/generic_functions.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:avivaapp/app/modules/detailsdisciple/detailsdisciple_store.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsdisciplePage extends StatefulWidget {
  final String title;
  final DiscipleModel disciplemodel;
  const DetailsdisciplePage({Key key, this.title = 'DetailsdisciplePage',  @required this.disciplemodel}) : super(key: key);
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
        title: Text(
          discipleModel.name,
          style: GoogleFonts.anton(
            color: genericFunctions.getColorFromHex("#f38633"),
            fontSize: 20,
            letterSpacing: 1.0,
          ),
        ),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}