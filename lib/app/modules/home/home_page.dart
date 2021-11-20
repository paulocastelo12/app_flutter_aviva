import 'package:avivaapp/app/core/models/disciple_model.dart';
import 'package:avivaapp/app/core/utils/generic_functions.dart';
import 'package:avivaapp/app/modules/home/home_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  GenericFunctions genericFunctions = GenericFunctions();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Discípulos Aviva',
          style: GoogleFonts.anton(
            color: genericFunctions.getColorFromHex("#f38633"),
            fontSize: 20,
            letterSpacing: 1.0,
          ),
        ),
        actions: <Widget>[
          Observer(builder: (_) {
            return Center(
              child: Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: store.listdisciple != null
                      ? Text(
                          " ${store.listdisciple.length}",
                          style: TextStyle(
                              fontSize: 20,
                              color:
                                  genericFunctions.getColorFromHex("#f38633")),
                        )
                      : Text("0",
                          style: TextStyle(
                              fontSize: 20,
                              color: genericFunctions
                                  .getColorFromHex("#f38633")))),
            );
          }),
        ],
      ),
      body: Observer(builder: (_) {
        if (store.listdisciple == null) {
          return const Center(child: CircularProgressIndicator());
        }

        if (store.listdisciple.isEmpty) {
          return Container();
        }

        return ListView.builder(
            itemCount: store.listdisciple.length,
            itemBuilder: (_, int index) {
              DiscipleModel disciple = store.listdisciple[index];

              return ListTile(
                onTap: () async {
                  var nav = await Modular.to
                      .pushNamed("/details_disciple/", arguments: disciple);
                  if (nav == true) {
                    store.getDisciple();
                  }
                },
                title: Text(disciple.name,
                    style: GoogleFonts.notoSans(fontSize: 18)),
                subtitle: Text(
                  disciple.phone,
                  style: GoogleFonts.notoSans(fontSize: 18),
                ),
                contentPadding: const EdgeInsets.only(left: 10, right: 10),
                trailing: const Icon(Icons.keyboard_arrow_right),
              );
            });
      }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: genericFunctions.getColorFromHex("#f38633"),
        onPressed: () async {
          var nav = await Modular.to.pushNamed("/register_disciple/");

          if (nav == true || nav == null) {
            store.getDisciple();
          }
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
