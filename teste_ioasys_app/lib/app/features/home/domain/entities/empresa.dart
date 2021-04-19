import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'enterprise_type.dart';

abstract class Empresa extends Equatable {
  const Empresa(
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

  @override
  List<Object> get props => [
        id,
        emailEnterprise,
        facebook,
        twitter,
        linkedin,
        phone,
        ownEnterprise,
        enterpriseName,
        enterpriseName,
        description,
        city,
        country,
        value,
        sharePrice,
        enterpriseType,
      ];
}
