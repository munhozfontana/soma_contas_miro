import 'dart:convert';

import 'package:uuid/uuid.dart';

class CreditBillEntity {
  final String id = const Uuid().v4();
  final String name;
  final num valor;
  CreditBillEntity({
    required this.name,
    required this.valor,
  });

  CreditBillEntity copyWith({
    String? name,
    num? valor,
  }) {
    return CreditBillEntity(
      name: name ?? this.name,
      valor: valor ?? this.valor,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'valor': valor,
    };
  }

  factory CreditBillEntity.fromMap(Map<String, dynamic> map) {
    return CreditBillEntity(
      name: map['name'] ?? '',
      valor: map['valor'] ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory CreditBillEntity.fromJson(String source) =>
      CreditBillEntity.fromMap(json.decode(source));

  @override
  String toString() => 'CreditBillEntity(name: $name, valor: $valor)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CreditBillEntity &&
        other.name == name &&
        other.valor == valor;
  }

  @override
  int get hashCode => name.hashCode ^ valor.hashCode;
}
