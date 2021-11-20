import 'package:avivaapp/app/modules/detailsdisciple/detailsdisciple_module.dart';
import 'package:avivaapp/app/modules/home/home_module.dart';
import 'package:avivaapp/app/modules/login/login_module.dart';
import 'package:avivaapp/app/modules/registerdisciple/registerdisciple_module.dart';
import 'package:avivaapp/app/shared/constants/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'core/auth/auth_store_store.dart';
import 'core/auth/repositories/auth_repository.dart';
import 'core/auth/repositories/auth_repository_interface.dart';
import 'modules/home/repositories/home_repository.dart';
import 'modules/home/repositories/home_repository_interface.dart';
import 'modules/registerdisciple/repositories/registerdisciple_repository.dart';
import 'modules/registerdisciple/repositories/registerdisciple_repository_interface.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
     Bind((i) => Dio(BaseOptions(baseUrl: URL_BASE))),
     Bind((i) => AuthStoreStore()),
     Bind<IAuthRepository>((i) => AuthRepository(i.get<Dio>())),
     Bind<IHomeRepository>((i) => HomeRepository(i.get<Dio>())),
     Bind<IRegisterdiscipleRepository>((i) => RegisterdiscipleRepository(i.get<Dio>()))
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: LoginModule()),
    ModuleRoute("/home/", module: HomeModule()),
    ModuleRoute("/register_disciple/", module: RegisterdiscipleModule()),
    ModuleRoute("/details_disciple/", module: DetailsdiscipleModule())
  ];

}