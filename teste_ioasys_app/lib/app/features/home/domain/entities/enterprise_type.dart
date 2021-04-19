import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class EnterpriseType extends Equatable {
  const EnterpriseType({@required this.id, @required this.enterpriseTypeName});

  final int id;
  final String enterpriseTypeName;

  @override
  List<Object> get props => [
        id,
        enterpriseTypeName,
      ];
}
