// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PaymentTypesModel {
  final int id;
  final String name;
  final String acronym;
  final bool enabled;

  PaymentTypesModel(this.id, this.name, this.acronym, this.enabled);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'acronym': acronym,
      'enabled': enabled,
    };
  }

  factory PaymentTypesModel.fromMap(Map<String, dynamic> map) {
    return PaymentTypesModel(
      map['id'] as int,
      map['name'] as String,
      map['acronym'] as String,
      map['enabled'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory PaymentTypesModel.fromJson(String source) =>
      PaymentTypesModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
