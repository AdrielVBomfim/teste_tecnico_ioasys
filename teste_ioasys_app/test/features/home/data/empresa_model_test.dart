import 'package:flutter_test/flutter_test.dart';
import 'package:teste_ioasys_app/app/features/home/data/models/enterprise_type_model.dart';
import 'package:teste_ioasys_app/app/features/home/data/models/empresa_model.dart';
import 'package:teste_ioasys_app/app/features/home/domain/entities/empresa.dart';

void main() {
  EnterpriseTypeModel tEnterpriseType;
  EmpresaModel tEmpresa;

  setUp(() {
    tEnterpriseType = EnterpriseTypeModel(
      enterpriseTypeName: 'textile',
      id: 6,
    );

    tEmpresa = EmpresaModel(
        id: 423,
        city: 'aracaju',
        country: 'BR',
        description: 'uma empresa',
        emailEnterprise: '',
        enterpriseName: 'Pizza do bairro',
        enterpriseType: tEnterpriseType,
        facebook: '',
        twitter: '',
        linkedin: '',
        phone: '',
        value: 0,
        sharePrice: 0.0,
        ownEnterprise: false,
        photo: '');
  });

  test('ChavePixModel deve ser subtipo de ChavePix', () async {
    expect(tEmpresa, isA<Empresa>());
  });
}
