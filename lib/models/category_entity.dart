import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

class CategoryEntity {
  final String id = const Uuid().v4();
  final String name;
  num total;
  final List<String> keyWordsToFind;

  CategoryEntity({
    required this.name,
    this.total = 0,
    this.keyWordsToFind = const [],
  });

  @override
  String toString() =>
      'CategoryEntity(name: $name, total: $total, keyWordsToFind: $keyWordsToFind)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CategoryEntity &&
        other.name == name &&
        other.total == total &&
        listEquals(other.keyWordsToFind, keyWordsToFind);
  }

  @override
  int get hashCode => name.hashCode ^ total.hashCode ^ keyWordsToFind.hashCode;
}
