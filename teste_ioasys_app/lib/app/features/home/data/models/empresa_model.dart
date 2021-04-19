import 'package:flutter/material.dart';
import 'package:teste_ioasys_app/app/features/home/data/models/enterprise_type_model.dart';
import 'package:teste_ioasys_app/app/features/home/domain/entities/empresa.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:teste_ioasys_app/app/features/home/domain/entities/enterprise_type.dart';

@JsonSerializable()
class EmpresaModel extends Empresa {
  EmpresaModel(
      {@required this.id,
      @required this.emailEnterprise,
      @required this.facebook,
      @required this.twitter,
      @required this.linkedin,
      @required this.phone,
      @required this.ownEnterprise,
      @required this.enterpriseName,
      @required this.photo,
      @required this.description,
      @required this.city,
      @required this.country,
      @required this.value,
      @required this.sharePrice,
      @required this.enterpriseType});

  final int id;
  final String emailEnterprise;
  final String facebook;
  final String twitter;
  final String linkedin;
  final String phone;
  final bool ownEnterprise;
  final String enterpriseName;
  final String photo;
  final String description;
  final String city;
  final String country;
  final num value;
  final num sharePrice;
  final EnterpriseType enterpriseType;

  factory EmpresaModel.fromJson(Map<String, dynamic> map) {
    return EmpresaModel(
      id: map['id'],
      emailEnterprise: map['email_enterprise'],
      facebook: map['facebook'],
      twitter: map['twitter'],
      linkedin: map['linkedin'],
      phone: map['phone'],
      ownEnterprise: map['own_enterprise'],
      enterpriseName: map['enterprise_name'],
      photo: map['photo'],
      description: map['description'],
      city: map['city'],
      country: map['country'],
      value: map['value'],
      sharePrice: map['share_price'],
      enterpriseType: EnterpriseTypeModel.fromJson(map['enterprise_type']),
    );
  }
}
