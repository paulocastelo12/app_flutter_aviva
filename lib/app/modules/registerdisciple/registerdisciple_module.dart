import 'package:avivaapp/app/modules/registerdisciple/registerdisciple_Page.dart';
import 'package:avivaapp/app/modules/registerdisciple/registerdisciple_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RegisterdiscipleModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => RegisterdiscipleStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const RegisterdisciplePage()),
  ];
}
