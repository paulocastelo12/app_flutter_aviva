import 'package:avivaapp/app/modules/detailsdisciple/detailsdisciple_Page.dart';
import 'package:avivaapp/app/modules/detailsdisciple/detailsdisciple_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DetailsdiscipleModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => DetailsdiscipleStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) =>  DetailsdisciplePage(disciplemodel: args.data)),
  ];
}
