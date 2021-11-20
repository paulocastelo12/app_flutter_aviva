import 'package:avivaapp/app/core/utils/generic_functions.dart';
import 'package:avivaapp/app/shared/components/snackbar_global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

class AppWidget extends StatelessWidget {
  GenericFunctions genericFunctions = GenericFunctions();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Slidy',
        scaffoldMessengerKey: GlobalSnackBar.instance.rootScaffoldMessengerKey,
        theme: ThemeData(
          primarySwatch: Colors.orange,
          fontFamily: GoogleFonts.openSans().fontFamily,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          brightness: Brightness.dark,
        
        ),
      ).modular(),
    );
  }
}
