import 'package:flutter_test/flutter_test.dart';
import 'package:teste_ioasys_app/app/features/home/data/models/enterprise_type_model.dart';
import 'package:teste_ioasys_app/app/features/home/domain/entities/enterprise_type.dart';

void main() {
  EnterpriseTypeModel tEnterpriseType;

  setUp(() {
    tEnterpriseType = EnterpriseTypeModel(
      enterpriseTypeName: 'textile',
      id: 6,
    );
  });


  test('EnterpriseTypeModel deve ser subtipo de EnterpriseType', () {
    expect(tEnterpriseType, isA<EnterpriseType>());
  });
}
