import 'package:avivaapp/app/core/auth/auth_store_store.dart';
import 'package:avivaapp/app/shared/components/snackbar_global.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import 'repositories/registerdisciple_repository_interface.dart';

part 'registerdisciple_store.g.dart';

class RegisterdiscipleStore = _RegisterdiscipleStoreBase
    with _$RegisterdiscipleStore;

abstract class _RegisterdiscipleStoreBase with Store {
  final IRegisterdiscipleRepository _resgiterdiscipleRepository = Modular.get();
  final AuthStoreStore _authStoreStore = Modular.get();

  bool isboolnewUser = false;

  @observable
  bool loading = false;

  String nome;
  setNome(String value) => nome = value;

  String telefone;
  setTelefone(String value) => telefone = value;

  @observable
  String sexo;
  @action
  setSexo(String value) => sexo = value;

  @observable
  String fxEtaria;
  @action
  setFxEtaria(String value) => fxEtaria = value;

  //ENDEREf
  @observable
  String bairro;
  @action
  setBairro(String value) => bairro = value;

  String rua;
  setRua(String value) => rua = value;

  String numero;
  setNumero(String value) => numero = value;

  @action
  Future<String> sendNewDisciple() async {
    loading = true;

    await Future.delayed(const Duration(seconds: 3));

    Map<String, dynamic> disciple = {
      "name": nome,
      "phone": telefone,
      "gender": sexo,
      "age_group": fxEtaria,
      "district": bairro,
      "street": rua,
      "number": numero
    };

    String result = await _resgiterdiscipleRepository.createNewDisciple(
        _authStoreStore.user.sId, disciple);

    loading = false;

    if (result == "Ok") {
      GlobalSnackBar.instance.showSnackBarSuccess("Registrado c/ sucesso!");
      isboolnewUser = true;
      clearFields();
      return result;
    }

    return null;
  }

  @action
  clearFields() {
    sexo = null;
    fxEtaria = null;
    bairro = null;
  }

  var cxsexo = ['Masculino', 'Feminino'];

  var cxfxEtaria = ['Criança', 'Jovem', 'Adulto', 'Idoso'];

  var cxbairros = [
    'Adrianópolis',
    'Aleixo',
    'Alfredo Nascimento',
    'Alvorada',
    'Alvorada I',
    'Alvorada II',
    'Amazonino Mendes',
    'Amine Lindoso',
    'Aparecida',
    'Area Rural',
    'Armando Mendes',
    'Betânia',
    'Cachoeirinha',
    'Centro',
    'Chapada',
    'Cidade de Deus',
    'Cidade Deus',
    'Cidade Nova',
    'Cidade Nova III',
    'Colônia Antônio Aleixo',
    'Colônia Chico Mendes',
    'Colônia Japonesa',
    'Colônia Oliveira Machado',
    'Colônia Santo Antônio',
    'Colônia Terra Nova',
    'Compensa',
    'Comunidade Mundo Novo',
    'Comunidade Vitória Régia',
    'Condomínio Villa Cidades',
    'Conjunto 31 Marco',
    'Conjunto Abílio Nery',
    'Conjunto Alphaville',
    'Conjunto Álvaro Neves',
    'Conjunto Amadeu Botelho',
    'Conjunto Anavilhanas I',
    'Conjunto Beija-flor Ii',
    'Conjunto Belvedere',
    'Conjunto Canaã',
    'Conjunto Celetramazon',
    'Conjunto Cidade Nova I',
    'Conjunto Fca Mendes II',
    'Conjunto Habitacional Boas Novas',
    'Conjunto Habitacional Sargento',
    'Conjunto Jardim Éden',
    'Conjunto Jardim Haydea I',
    'Conjunto Jardim Versalles II',
    'Conjunto João Paulo II',
    'Conjunto Marina Tauá',
    'Conjunto Mundo Novo',
    'Conjunto Nascente Água Claras',
    'Conjunto Nova Cidade',
    'Conjunto Nova República II',
    'Conjunto Parque Aruana',
    'Conjunto Parque Sucupiras',
    'Conjunto Pindorama',
    'Conjunto Renato S Pinto II',
    'Conjunto Residencial Lago Azul',
    'Conjunto São Cristóvão',
    'Conjunto Tapajós',
    'Conjunto Villa Amazonas',
    'Conjunto Villa Nova',
    'Conjunto Villa Rei',
    'Conjunto Villa Verde',
    'Conjunto Villa Verde II',
    'Conjunto Vista Bela',
    'Conjunto Vivenda Verde',
    'Coroado',
    'Coroado III',
    'Crespo',
    'Distrito Industrial',
    'Distrito Industrial I',
    'Distrito Industrial II',
    'Dom Pedro',
    'Dom Pedro I',
    'Dom Pedro II',
    'Educandos',
    'Flores',
    'Florestal',
    'Gilberto Mestrinho',
    'Glória',
    'Grande Vitória',
    'Japiim',
    'Jorge Teixeira',
    'Lago Azul',
    'Lírio do Vale',
    'Lírio Vale',
    'Lírio Vale I',
    'Lírio Vale Ii',
    'Loteamento Bairro Novo',
    'Loteamento Campo Dourado',
    'Loteamento Centenário',
    'Loteamento Evangélico',
    'Loteamento Fazendinha',
    'Loteamento Flávio Espírito San',
    'Loteamento Industriários',
    'Loteamento Monte Pascoal',
    'Loteamento Monte Sião',
    'Loteamento Monte Sinai',
    'Loteamento Novo Aleixo',
    'Loteamento Oriental',
    'Loteamento Rio Piorini',
    'Loteamento Santa Rita',
    'Loteamento Vale Sinai',
    'Margem Esquerda do Rio Negro',
    'Mauazinho',
    'Monte Cristo',
    'Monte das Oliveiras',
    'Monte Oliveiras',
    'Monte Pascoal',
    'Monte Sião',
    'Morro da Liberdade',
    'Nossa Senhora das Graças',
    'Nossa Senhora Fátima',
    'Nossa Senhora Graças',
    'Nova Cidade',
    'Nova Conquista',
    'Nova Esperança',
    'Nova Floresta',
    'Novo Aleixo',
    'Novo Israel',
    'Novo Reino',
    'Parque 10 de Novembro',
    'Parque 10 Novembro',
    'Parque Itapuranga III',
    'Parque Laranjeiras',
    'Parque Santa Etelvina',
    'Paz',
    'Petrópolis',
    'Planalto',
    'Ponta Negra',
    'Praça 14 de Janeiro',
    'Praça 14 Janeiro',
    'Presidente Vargas',
    'Puraquequara',
    'Raiz',
    'Redenção',
    'Residencial Jardim Flamboyant',
    'Santa Etelvina',
    'Santa Luzia',
    'Santo Agostinho',
    'Santo Antônio',
    'São Francisco',
    'São Geraldo',
    'São Jorge',
    'São José',
    'São José II',
    'São José III',
    'São José Operário',
    'São Lázaro',
    'São Raimundo',
    'Tancredo Neves',
    'Tarumã',
    'Taruma-acu',
    'União',
    'União Vitória',
    'Vieiralves',
    'Vila Amanhecer',
    'Vila Buriti',
    'Vila da Prata',
    'Vila Prata',
    'Vila São José Rio Negro',
    'Zona Rural',
    'Zumbi dos Palmares',
    'Zumbi Palmares',
    'Zumbi Palmares II'
  ];
}
