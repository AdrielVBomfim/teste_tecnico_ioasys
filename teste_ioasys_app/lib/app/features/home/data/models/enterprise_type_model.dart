import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:teste_ioasys_app/app/features/home/domain/entities/enterprise_type.dart';

@JsonSerializable()
class EnterpriseTypeModel extends EnterpriseType {
  const EnterpriseTypeModel(
      {@required this.id, @required this.enterpriseTypeName});

  final int id;
  final String enterpriseTypeName;

  factory EnterpriseTypeModel.fromJson(Map<String, dynamic> map) {
    return EnterpriseTypeModel(
      id: map['id'],
      enterpriseTypeName: map['enterprise_type_name'],
    );
  }
}
